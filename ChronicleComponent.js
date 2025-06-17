import React, { useRef, useState } from 'react';
import Timeline from 'react-visjs-timeline';
// import moment from 'moment';
// import * as moment from 'moment';

const Chronicle = ({ proInputs, keyword }) => {
  const timelineRef = useRef(null); // Reference for the Timeline instance
  const [zoomInterval, setZoomInterval] = useState(null); // State to store the interval ID
  const [tooltip, setTooltip] = useState({
    visible: false,
    content: '',
    position: { x: 0, y: 0 }
  });
  const [holdTimeout, setHoldTimeout] = useState(null); // Timeout for touch and hold

  const options = {
    stack: true,
    // maxHeight: 640,
    horizontalScroll: true,
    verticalScroll: true,
    zoomKey: 'ctrlKey',
    start: Date.now() - 1000 * 60 * 60 * 24 * 60, // minus 3 days
    end: Date.now() + 1000 * 60 * 60 * 24 * 21, // plus 1 months aprox.
    orientation: {
      axis: 'both',
      item: 'top'
    },
    editable: true,
    groupOrder: function (a, b) {
      return a.value - b.value;
    },
    doubleClick: false // Disable default double-tap behavior
  };

  // Split the keyword into individual words
  const keywordsArray = keyword.toLowerCase().split(/\s+/);

  // Parse the keyword string into logical expressions
  const parseKeywords = keywords => {
    return keywords
      .split('|') // Split by OR operator
      .map(group => {
        const andConditions = group
          .trim()
          .split(/\s+/)
          .map(condition => {
            if (condition.startsWith('!')) {
              return { type: 'NOT', value: condition.slice(1).toLowerCase() }; // Handle NOT
            }
            return { type: 'AND', value: condition.toLowerCase() }; // Handle AND
          });
        return andConditions;
      });
  };

  // Evaluate the parsed keyword conditions
  const evaluateConditions = (conditions, person) => {
    return conditions.some(andConditions =>
      andConditions.every(condition => {
        if (condition.type === 'NOT') {
          return !person.includes(condition.value); // NOT condition
        }
        return person.includes(condition.value); // AND condition
      })
    );
  };

  // Parse the keyword string
  const parsedKeywords = parseKeywords(keyword);

  // Filter proInputs based on the presence of 'timeline' in the subject and all keywords in the person field
  const timelineProInputs = proInputs.filter(item => {
    const subject = item.subject.toLowerCase();
    const person = item.person.toLowerCase();
    return (
      subject.includes('timeline') && evaluateConditions(parsedKeywords, person)
      // keywordsArray.every(kw => person.includes(kw))
    );
  });
  // console.log('timelineProInputs', timelineProInputs);

  const timelineGroups = timelineProInputs.filter(item =>
    item.condition1.toLowerCase().includes('group')
  );
  const timelineItems = timelineProInputs.filter(item =>
    item.condition1.toLowerCase().includes('item')
  );

  const groups = timelineGroups.map(group => ({
    id: parseInt(group.condition2, 10),
    content: group.condition3,
    value: parseInt(group.condition4, 10),
    nestedGroups: group.condition5
      ? group.condition5.split(',').map(char => parseInt(char, 10))
      : undefined,
    treeLevel: parseInt(group.condition6, 10),
    title: group.condition11
    // style: 'background: rgba(82, 226, 233, 0.2)'
    // visible: false // Hide the group hierarchy
    // style: 'background-color: transparent; z-index: 1;'
    // style: 'opacity: 0.5;' // Adjust the opacity value as needed
  }));

  const items = timelineItems.flatMap(item => {
    const groupNumbers = item.condition7
      .split(',')
      .map(num => parseInt(num.trim(), 10));

    return groupNumbers.map(groupNumber => {
      const message = item.condition3.trim();
      const url = item.condition4.trim();
      const content = url
        ? `<a href="${url}" target="_blank">${message}</a>`
        : message;

      // console.log('content', content);
      return {
        id: item._id + '-' + groupNumber, // Ensure unique ID for each item
        group: groupNumber,
        content: content,
        start: item.condition8,
        end: item.condition9,
        type: item.condition10.trim().toLowerCase(),
        title: item.condition11,
        style: item.condition12
      };
    });
  });

  const handleSelect = event => {
    const { items } = event;
    if (items.length > 0) {
      const itemId = items[0]; // Get the selected item ID
      if (tooltip.visible && tooltip.content === `Tooltip for item ${itemId}`) {
        // If the same item is tapped again, hide the tooltip
        setTooltip({ visible: false, content: '', position: { x: 0, y: 0 } });
      } else {
        // Otherwise, show the tooltip
        const rect = timelineRef.current.$el.getBoundingClientRect();
        setTooltip({
          visible: true,
          content: `Tooltip for item ${itemId}`,
          position: {
            x: rect.left + event.event.center.x,
            y: rect.top + event.event.center.y
          }
        });
      }
    } else {
      // If no item is selected, hide the tooltip
      setTooltip({ visible: false, content: '', position: { x: 0, y: 0 } });
    }
  };

  const handleTouchStart = event => {
    const { items } = event;
    if (items.length > 0) {
      const itemId = items[0]; // Get the selected item ID
      const timeout = setTimeout(() => {
        const rect = timelineRef.current.$el.getBoundingClientRect();
        setTooltip({
          visible: true,
          content: `Tooltip for item ${itemId}`,
          position: {
            x: rect.left + event.event.center.x,
            y: rect.top + event.event.center.y
          }
        });
      }, 500); // Show tooltip after 500ms
      setHoldTimeout(timeout);
    }
  };

  const handleTouchEnd = () => {
    if (holdTimeout) {
      clearTimeout(holdTimeout); // Clear the timeout if touch is released
      setHoldTimeout(null);
    }
  };

  const handleZoomIn = () => {
    if (timelineRef.current && timelineRef.current.$el) {
      timelineRef.current.$el.zoomIn(1.0); // Zoom in by 50%
    }
  };

  const handleZoomOut = () => {
    if (timelineRef.current && timelineRef.current.$el) {
      timelineRef.current.$el.zoomOut(1.0); // Zoom out by 50%
    }
  };

  return (
    <div style={{ position: 'relative' }}>
      {/* Zoom Buttons */}
      <div style={{ position: 'absolute', top: 10, right: 10, zIndex: 1000 }}>
        <button
          onClick={handleZoomIn}
          style={{
            marginRight: 5,
            border: 'none', // Remove the border
            background: '#d3d3d3', // Light gray background
            cursor: 'pointer', // Optional: Add a pointer cursor for better UX
            padding: '5px 10px', // Optional: Add padding for better appearance
            borderRadius: '4px' // Optional: Add rounded corners
          }}
        >
          +
        </button>
        <button
          onClick={handleZoomOut}
          style={{
            border: 'none', // Remove the border
            background: '#d3d3d3', // Light gray background
            cursor: 'pointer', // Optional: Add a pointer cursor for better UX
            padding: '5px 10px', // Optional: Add padding for better appearance
            borderRadius: '4px' // Optional: Add rounded corners
          }}
        >
          -
        </button>
      </div>

      {/* Timeline */}
      <Timeline
        ref={timelineRef}
        className='container vis-timeline vis-item'
        id='timeline'
        options={options}
        items={items}
        groups={groups}
        events={{
          select: handleSelect, // Handle single-tap selection
          touchstart: handleTouchStart, // Handle touch and hold
          touchend: handleTouchEnd // Clear timeout on touch release
        }}
      />
      {tooltip.visible && (
        <div
          style={{
            position: 'absolute',
            top: tooltip.position.y,
            left: tooltip.position.x,
            background: 'white',
            border: '1px solid black',
            padding: '5px',
            zIndex: 1000
          }}
        >
          {tooltip.content}
        </div>
      )}
    </div>
  );
};
export default Chronicle;
