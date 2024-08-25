// import vis from 'react-visjs-timeline';
import Timeline from 'react-visjs-timeline';

// import { Timeline } from 'vis-timeline';
// import moment from 'moment';
// import * as moment from 'moment';

const Chronicle = ({ proInputs }) => {
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

  const timelineProInputs = proInputs.filter(item =>
    item.subject.toLowerCase().includes('timeline')
  );
  const timelineGroups = timelineProInputs.filter(item =>
    item.condition1.toLowerCase().includes('group')
  );
  const timelineItems = timelineProInputs.filter(item =>
    item.condition1.toLowerCase().includes('item')
  );

  // console.log('timelineProInputs', timelineProInputs);
  // console.log('timelineGroups', timelineGroups);
  // console.log('timelineItems', timelineItems);

  // console.log(
  //   'timelineGroups[0].condition2',
  //   parseInt(timelineGroups[0].condition2)
  // );
  // console.log(
  //   'timelineGroups[0].condition5',
  //   timelineGroups[0].condition5.split(',').map(char => parseInt(char))
  // );

  const groups = timelineGroups.map(group => ({
    id: parseInt(group.condition2, 10),
    content: group.condition3,
    value: parseInt(group.condition4, 10),
    nestedGroups: group.condition5
      ? group.condition5.split(',').map(char => parseInt(char, 10))
      : undefined,
    treeLevel: parseInt(group.condition6, 10)
  }));

  // const groups = timelineGroups.map(group => {
  //   const groupObj = {
  //     id: parseInt(group.condition2, 10),
  //     content: group.condition3,
  //     value: parseInt(group.condition4, 10),
  //     treeLevel: parseInt(group.condition6, 10)
  //   };

  //   if (group.condition5) {
  //     groupObj.nestedGroups = group.condition5
  //       .split(',')
  //       .map(char => parseInt(char, 10));
  //   }

  //   return groupObj;
  // });

  // console.log('group', groups);

  const items = timelineItems.map(item => ({
    id: item._id,
    group: parseInt(item.condition7, 10),
    content: item.condition3,
    start: item.condition8,
    end: item.condition9,
    type: item.condition10.toLowerCase(),
    title: item.condition11,
    style: item.condition12
  }));

  // console.log('items', items);

  return (
    <Timeline
      // className="container vis-timeline"
      options={options}
      items={items}
      groups={groups}
    />
  );
};
export default Chronicle;
