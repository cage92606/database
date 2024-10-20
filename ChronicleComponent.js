// import vis from 'react-visjs-timeline';
import Timeline from 'react-visjs-timeline';
// import moment from 'moment';
// import * as moment from 'moment';

const Chronicle = ({ proInputs, keyword }) => {
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
    }
  };

  // Split the keyword into individual words
  const keywordsArray = keyword.toLowerCase().split(/\s+/);

  // Filter proInputs based on the presence of 'timeline' in the subject and all keywords in the person field
  const timelineProInputs = proInputs.filter(item => {
    const subject = item.subject.toLowerCase();
    const person = item.person.toLowerCase();
    return (
      subject.includes('timeline') &&
      keywordsArray.every(kw => person.includes(kw))
    );
  });
  console.log('timelineProInputs', timelineProInputs);

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

  // const items = timelineItems.map(item => ({
  //   id: item._id,
  //   group: parseInt(item.condition7, 10),
  //   content: item.condition3,
  //   start: item.condition8,
  //   end: item.condition9,
  //   type: item.condition10.trim().toLowerCase(),
  //   title: item.condition11,
  //   style: item.condition12
  //   // className: 'myClassName'
  // }));

  const items = timelineItems.flatMap(item => {
    const groupNumbers = item.condition7
      .split(',')
      .map(num => parseInt(num.trim(), 10));
    return groupNumbers.map(groupNumber => ({
      id: item._id + '-' + groupNumber, // Ensure unique ID for each item
      group: groupNumber,
      content: item.condition3,
      start: item.condition8,
      end: item.condition9,
      type: item.condition10.trim().toLowerCase(),
      title: item.condition11,
      style: item.condition12
    }));
  });

  return (
    <Timeline
      className='container vis-timeline vis-item'
      id='timeline'
      options={options}
      items={items}
      groups={groups}
    />
  );
};
export default Chronicle;
