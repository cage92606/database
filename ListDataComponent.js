/* eslint-disable react/jsx-pascal-case */
import React, { useEffect, Fragment } from 'react';
import { useState } from 'react';
import { useSelector, useDispatch } from 'react-redux';
// import { Control } from 'react-redux-form';
import {
  Card,
  CardBody,
  Button,
  Label,
  Col,
  Row,
  Modal,
  ModalHeader,
  ModalBody,
  Table,
  Input
} from 'reactstrap';
import { ListGroup, ListGroupItem } from 'reactstrap';
import { Loading } from './LoadingComponent';
import { Control, Form } from 'react-redux-form';
// import { fetchInputs } from '../redux/ActionCreators';
// import { fetchKirks, fetchInputs } from '../redux/ActionCreators';
import { CSVLink, CSVDownload } from 'react-csv';
import Pagination from './Pagination';

function RenderInputTable ({
  input,
  deleteInput,
  updateInput,
  resetInputForm,
  auth,
  isUpdating,
  isFullContentShown,
  toggleIsFullContentShown
}) {
  const [isOpen, setIsOpen] = useState(false);
  // const classNameForEditAndDelete = this.props.isMobile ? '' : 'sticky-td';
  const [isMobile, setIsMobile] = useState(window.innerWidth < 1200);

  useEffect(() => {
    window.addEventListener(
      'resize',
      () => {
        const ismobile = window.innerWidth < 768; //iPad mini
        if (ismobile !== isMobile) setIsMobile(ismobile);
      },
      false
    );
  }, [isMobile]);

  // console.log('isMobile: ', isMobile);

  const toggleModal = () => {
    setIsOpen(!isOpen);
  };

  const handleSubmit = (value, event) => {
    toggleModal();
    if (window.confirm('OK to change data?')) {
      updateInput(
        input._id,
        value.date,
        value.place,
        value.person,
        value.subject,
        value.reason,
        value.condition,
        value.data,
        value.unit
      );
      // console.log('isUpdating: ', isUpdating);
    }
    // resetInputForm();
    // <div className="container">
    //   <div className="row">
    //     <Loading />
    //   </div>
    // </div>;
  };

  // const [isDateEditing, setIsDateEditing] = useState(false);
  const [isDateEditing, setIsDateEditing] = useState(false);
  const [isPlaceEditing, setIsPlaceEditing] = useState(false);
  const [isPersonEditing, setIsPersonEditing] = useState(false);
  const [isSubjectEditing, setIsSubjectEditing] = useState(false);
  const [isReasonEditing, setIsReasonEditing] = useState(false);
  const [isConditionEditing, setIsConditionEditing] = useState(false);
  const [isDataEditing, setIsDataEditing] = useState(false);
  const [isUnitEditing, setIsUnitEditing] = useState(false);

  const [tempValue, setTempValue] = useState('');

  const handleDoubleClick = e => {
    const fieldName = e.target.getAttribute('name');
    const fieldValue = input[fieldName];
    setTempValue(fieldValue); // Store the current value before editing
    if (fieldName === 'date') setIsDateEditing(true);
    if (fieldName === 'place') setIsPlaceEditing(true);
    if (fieldName === 'person') setIsPersonEditing(true);
    if (fieldName === 'subject') setIsSubjectEditing(true);
    if (fieldName === 'reason') setIsReasonEditing(true);
    if (fieldName === 'condition') setIsConditionEditing(true);
    if (fieldName === 'data') setIsDataEditing(true);
    if (fieldName === 'unit') setIsUnitEditing(true);
  };

  const handleChange = e => {
    setTempValue(e.target.value); // Update the temporary value on each key press
  };
  const handleBlur = e => {
    const fieldName = e.target.name;
    if (tempValue !== input[fieldName]) {
      // Check if the input has changed
      const newInput = { ...input, [fieldName]: tempValue }; // Use the temporary value to update the input
      if (window.confirm('OK to change data?')) {
        updateInput(
          input._id,
          newInput.date,
          newInput.place,
          newInput.person,
          newInput.subject,
          newInput.reason,
          newInput.condition,
          newInput.data,
          newInput.unit
        );
      }
    }
    if (fieldName === 'date') setIsDateEditing(false);
    if (fieldName === 'place') setIsPlaceEditing(false);
    if (fieldName === 'person') setIsPersonEditing(false);
    if (fieldName === 'subject') setIsSubjectEditing(false);
    if (fieldName === 'reason') setIsReasonEditing(false);
    if (fieldName === 'condition') setIsConditionEditing(false);
    if (fieldName === 'data') setIsDataEditing(false);
    if (fieldName === 'unit') setIsUnitEditing(false);
  };

  const handleKeyDown = event => {
    if (event.key === 'Enter') {
      event.target.blur();
    }
  };

  return (
    <tr>
      <Modal
        isOpen={isOpen}
        toggle={toggleModal}
        size='lg'
        style={{ maxWidth: '1000px', width: '100%' }}
        className='my-modal'
      >
        <ModalHeader toggle={toggleModal}>Update Input</ModalHeader>
        <ModalBody>
          <Form onSubmit={handleSubmit} model='input'>
            <Row className='form-group mb-2'>
              <Label htmlFor='date'>date</Label>
              <Control.text
                model='.date'
                id='date'
                name='date'
                defaultValue={input.date}
                className='form-control'
              />
            </Row>
            <Row className='form-group mb-2'>
              <Label htmlFor='place'>place</Label>
              <Control.text
                model='.place'
                id='place'
                name='place'
                defaultValue={input.place}
                className='form-control'
              />
            </Row>
            <Row className='form-group mb-2'>
              <Label htmlFor='person'>person</Label>
              <Control.text
                model='.person'
                id='person'
                name='person'
                defaultValue={input.person}
                className='form-control'
              />
            </Row>
            <Row className='form-group mb-2'>
              <Label htmlFor='subject'>subject</Label>
              <Control.text
                model='.subject'
                id='subject'
                name='subject'
                defaultValue={input.subject}
                className='form-control'
              />
            </Row>
            <Row className='form-group mb-2'>
              <Label htmlFor='reason'>reason</Label>
              <Control.textarea
                model='.reason'
                id='reason'
                name='reason'
                defaultValue={input.reason}
                className='form-control'
              />
            </Row>
            <Row className='form-group mb-2'>
              <Label htmlFor='condition'>condition</Label>
              <Control.textarea
                model='.condition'
                id='condition'
                name='condition'
                defaultValue={input.condition}
                className='form-control'
              />
            </Row>
            <Row className='form-group mb-2'>
              <Label htmlFor='data'>data</Label>
              <Control.text
                model='.data'
                id='data'
                name='data'
                defaultValue={input.data}
                className='form-control'
              />
              {/* </Row>
              <Row className="form-group mb-2"> */}
              <Label htmlFor='unit'>unit</Label>
              <Control.text
                model='.unit'
                id='unit'
                name='unit'
                defaultValue={input.unit}
                className='form-control'
              />
            </Row>
            <Button type='submit' value='submit' color='primary'>
              Submit
            </Button>
          </Form>
        </ModalBody>
      </Modal>

      {/* <td className={classNameForEditAndDelete}> */}

      <td className={`${isMobile ? '' : 'sticky-td'}`}>
        {/* <td className="sticky-td"> */}
        {auth.id === input.user ? (
          <Button
            outline
            color='primary'
            onClick={toggleModal}
            style={{ border: 'none' }}
          >
            <span className='fa fa-edit'></span>
          </Button>
        ) : (
          <Button outline color='secondary' style={{ border: 'none' }}>
            <span className='fa fa-edit'></span>
          </Button>
        )}
      </td>
      {/* <td>{input.date}</td> */}
      <td
        name='date'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
      >
        {auth.id === input.user && isDateEditing ? (
          <Input
            name='date'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : (
          input.date
        )}
      </td>
      {/* <td class="text text-truncate"> */}
      <td
        name='place'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
      >
        {auth.id === input.user && isPlaceEditing ? (
          <Input
            name='place'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : // input.date
        input.place.indexOf('http') === 0 || input.place.indexOf('/') === 0 ? (
          input.place ? (
            input.place.indexOf('http') === 0 ? (
              <a href={input.place} target='_blank' rel='noreferrer'>
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : input.place.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {input.place.split('//')[1].split('/')[0].split('.')[1]}
                  </span>
                ) : input.place.split('//')[1].split('/')[0].split('.')
                    .length === 2 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {input.place.split('//')[1].split('/')[0].split('.')[0]}
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                input.place.split('//')[1].split('/')[0].split('.')[0].length <
                  input.place.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {input.place.split('//')[1].split('/')[0].split('.')[1]}
                  </span>
                ) : (
                  <span>
                    {input.place.split('//')[1].split('/')[0].split('.')[0]}
                  </span>
                )}
              </a>
            ) : (
              <a href={`file:${input.place}`} target='_blank' rel='noreferrer'>
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <code>{input.place}</code>
        )}
      </td>
      <td
        name='person'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
      >
        {/* {input.person} */}
        {auth.id === input.user && isPersonEditing ? (
          <Input
            name='person'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : (
          input.person
        )}
      </td>
      <td
        name='subject'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
      >
        {auth.id === input.user && isSubjectEditing ? (
          <Input
            name='subject'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : (
          <b>{input.subject}</b>
        )}
      </td>
      <td
        name='reason'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
      >
        {auth.id === input.user && isReasonEditing ? (
          <Input
            name='reason'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : (
          input.reason
        )}
      </td>
      <td
        name='condition'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
      >
        {auth.id === input.user && isConditionEditing ? (
          <Input
            name='condition'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : (
          input.condition
        )}
      </td>
      <td
        name='data'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        style={
          isNaN(input.data.replace(/,/g, '')) ? {} : { textAlign: 'right' }
        }
      >
        {auth.id === input.user && isDataEditing ? (
          <Input
            name='data'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : input.data.indexOf('http') === 0 ||
          input.data.indexOf('/') === 0 ? (
          input.data ? (
            input.data.indexOf('http') === 0 ? (
              <a href={input.data} target='_blank' rel='noreferrer'>
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : input.data.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {input.data.split('//')[1].split('/')[0].split('.')[1]}
                  </span>
                ) : input.data.split('//')[1].split('/')[0].split('.')
                    .length === 2 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {input.data.split('//')[1].split('/')[0].split('.')[0]}
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                input.data.split('//')[1].split('/')[0].split('.')[0].length <
                  input.data.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {input.data.split('//')[1].split('/')[0].split('.')[1]}
                  </span>
                ) : (
                  <span>
                    {input.data.split('//')[1].split('/')[0].split('.')[0]}
                  </span>
                )}
              </a>
            ) : (
              <a href={`file:${input.data}`} target='_blank' rel='noreferrer'>
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <code>{input.data}</code>
        )}
      </td>
      <td
        name='unit'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
      >
        {auth.id === input.user && isUnitEditing ? (
          <Input
            name='unit'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : (
          input.unit
        )}
      </td>
      <td className={`${isMobile ? '' : 'sticky-td'}`}>
        {/* <td className="sticky-td"> */}
        {auth.id === input.user ? (
          <Button
            outline
            color='danger'
            disabled={isUpdating} // 2023.11.18
            onClick={() => {
              if (window.confirm('Are you sure?')) deleteInput(input._id);
            }}
            style={{ border: 'none' }}
          >
            <span className='fa fa-times'></span>
          </Button>
        ) : (
          <span></span>
        )}
      </td>
    </tr>
  );
}

export let input_num;
// export let foundInputs2ForExport;
// console.log('input_num in ListData is ', input_num);

export default function ListData (props) {
  // const searchDone = (display) => {
  //   setDisplay(display);
  // };

  // const [isFullContentShown, setIsFullContentShown] = useState(true);

  const isFullContentShown = useSelector(
    state => state.fieldButtons.isFullContentShown
  );

  // const toggleContent = () => {
  //   setIsFullContentShown(!isFullContentShown);
  //   // console.log('isFullContentShown is now ', isFullContentShown);
  // };

  const toggledInputFieldButton = useSelector(
    state => state.fieldButtons.toggledInputFieldButton
  );

  const isInputIdAscending = useSelector(
    state => state.fieldButtons.isInputIdAscending
  );
  const isInputDateAscending = useSelector(
    state => state.fieldButtons.isInputDateAscending
  );
  const isInputPlaceAscending = useSelector(
    state => state.fieldButtons.isInputPlaceAscending
  );
  const isInputPersonAscending = useSelector(
    state => state.fieldButtons.isInputPersonAscending
  );
  const isInputSubjectAscending = useSelector(
    state => state.fieldButtons.isInputSubjectAscending
  );
  const isInputReasonAscending = useSelector(
    state => state.fieldButtons.isInputReasonAscending
  );
  const isInputConditionAscending = useSelector(
    state => state.fieldButtons.isInputConditionAscending
  );
  const isInputDataAscending = useSelector(
    state => state.fieldButtons.isInputDataAscending
  );
  const isInputUnitAscending = useSelector(
    state => state.fieldButtons.isInputUnitAscending
  );

  // console.log(
  //   'isInputSubjectAscending value on ListData:',
  //   isInputSubjectAscending
  // );

  const dispatch = useDispatch();
  const toggleIsInputIdAscending = () => {
    dispatch({ type: 'TOGGLE_IS_INPUT_ID_ASCENDING' });
  };
  const toggleIsInputDateAscending = () => {
    dispatch({ type: 'TOGGLE_IS_INPUT_DATE_ASCENDING' });
  };
  const toggleIsInputPlaceAscending = () => {
    dispatch({ type: 'TOGGLE_IS_INPUT_PLACE_ASCENDING' });
  };
  const toggleIsInputPersonAscending = () => {
    dispatch({ type: 'TOGGLE_IS_INPUT_PERSON_ASCENDING' });
  };
  const toggleIsInputSubjectAscending = () => {
    // console.log('toggleIsSubjectAscending called');
    // console.log('dispatch function:', dispatch);
    dispatch({ type: 'TOGGLE_IS_INPUT_SUBJECT_ASCENDING' });
  };
  const toggleIsInputReasonAscending = () => {
    dispatch({ type: 'TOGGLE_IS_INPUT_REASON_ASCENDING' });
  };
  const toggleIsInputConditionAscending = () => {
    dispatch({ type: 'TOGGLE_IS_INPUT_CONDITION_ASCENDING' });
  };
  const toggleIsInputDataAscending = () => {
    dispatch({ type: 'TOGGLE_IS_INPUT_DATA_ASCENDING' });
  };
  const toggleIsInputUnitAscending = () => {
    dispatch({ type: 'TOGGLE_IS_INPUT_UNIT_ASCENDING' });
  };
  const toggleIsFullContentShown = () => {
    dispatch({ type: 'TOGGLE_IS_FULL_CONTENT_SHOWN' });
  };

  const [currentPage, setCurrentPage] = useState(1);
  const [inputListPerPage] = useState(1000);

  const paginate = pageNumber => setCurrentPage(pageNumber);

  if (props.isLoading) {
    // console.log('loading');
    return (
      <div className='container'>
        <div className='row'>
          <Loading />
        </div>
      </div>
    );
  } else if (props.errMess) {
    return (
      <div className='container'>
        <div className='row'>
          <h4>{props.errMess}</h4>
        </div>
      </div>
    );
  } else if (props.keyword !== '') {
    // console.log('you are in keyword');
    // console.log('setIsKeywordChanged is now ', setIsKeywordChanged);

    const keywordAndArray = props.keyword.split('|');
    var keywords = [];
    var exwords = [];
    for (let k = 0; k < keywordAndArray.length; k++) {
      let keywordArray = keywordAndArray[k].split(/(\s+)/);
      var keywords_temp = [];
      var exwords_temp = [];
      let j = 0;
      let m = 0;
      for (let i = 0; i < keywordArray.length; i++) {
        if ((keywordArray[i] !== ' ') & (keywordArray[i] !== '')) {
          if (keywordArray[i].split('')[0] === '!') {
            exwords_temp[m] = keywordArray[i]
              .toLowerCase()
              .split('')
              .splice(1)
              .join('');
            m = m + 1;
          } else {
            keywords_temp[j] = keywordArray[i].toLowerCase();
            j = j + 1;
          }
        }
      }
      keywords.push(keywords_temp); // OR演算子で分割した各々のキーワード群
      exwords.push(exwords_temp); // NOT演算子, !, で分割した各々のキーワード郡
    }
    var foundInputs = [];
    for (let i = 0; i < keywords.length; i++) {
      //     for (let j = 0; j < keywords[i].length; j++) {
      const foundInputs_temp = props.inputs.filter(curr => {
        const test = keywords[i].map(
          keyword =>
            curr.date.toLowerCase().includes(keyword) ||
            curr.place.toLowerCase().includes(keyword) ||
            curr.person.toLowerCase().includes(keyword) ||
            curr.subject.toLowerCase().includes(keyword) ||
            curr.reason.toLowerCase().includes(keyword) ||
            curr.condition.toLowerCase().includes(keyword) ||
            curr.data.toLowerCase().includes(keyword) ||
            curr.unit.toLowerCase().includes(keyword)
        );
        return test.every(logic => logic === true);
      });
      foundInputs = foundInputs.concat(foundInputs_temp);
      //     }
    }
    var foundInputs2 = [];
    for (let i = 0; i < exwords.length; i++) {
      //     for (let j = 0; j < keywords[i].length; j++) {
      const foundInputs2_temp = foundInputs.filter(curr => {
        const test = exwords[i].map(
          exword =>
            curr.date.toLowerCase().includes(exword) ||
            curr.place.toLowerCase().includes(exword) ||
            curr.person.toLowerCase().includes(exword) ||
            curr.subject.toLowerCase().includes(exword) ||
            curr.reason.toLowerCase().includes(exword) ||
            curr.condition.toLowerCase().includes(exword) ||
            curr.data.toLowerCase().includes(exword) ||
            curr.unit.toLowerCase().includes(exword)
        );
        return test.every(logic => logic === false);
      });
      foundInputs2 = foundInputs2.concat(foundInputs2_temp);
      //     }
      foundInputs2.sort((a, b) => {
        return a._id.localeCompare(b._id);
      });
    }

    const conv = inputDate => {
      let day = inputDate.split(' ').find(element => element.includes('-'));
      if (day) {
        const len = day.split('-')[0].length;
        const firstnumber = day.split('-')[0];
        const secondnumber = day.split('-')[1];
        const thirdnumber = day.split('-')[2];

        if (len === 1 || len === 2) {
          // In the case of like "25-2023-1"
          if (thirdnumber === '1')
            day = `January-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '2')
            day = `Febrary-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '3')
            day = `March-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '4')
            day = `April-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '5')
            day = `May-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '6')
            day = `June-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '7')
            day = `July-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '8')
            day = `August-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '9')
            day = `September-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '10')
            day = `October-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '11')
            day = `November-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '12')
            day = `December-${secondnumber}-${firstnumber}`;
        }
      }

      const time = inputDate.split(' ').find(element => element.includes(':'));

      return day;
    };

    switch (toggledInputFieldButton) {
      case 'ID':
        if (isInputIdAscending === false) {
          foundInputs2.sort((a, b) => {
            return a._id.localeCompare(b._id);
          });
        } else {
          foundInputs2.sort((a, b) => {
            return b._id.localeCompare(a._id);
          });
        }
        break;
      case 'DATE':
        if (isInputDateAscending === false) {
          foundInputs2.sort((a, b) => {
            // return a.date.localeCompare(b.date);
            return new Date(conv(a.date)) - new Date(conv(b.date));
          });
        } else {
          foundInputs2.sort((a, b) => {
            // return a.date.localeCompare(b.date).reverse();
            return new Date(conv(b.date)) - new Date(conv(a.date));
          });
        }
        break;
      case 'PLACE':
        if (isInputPlaceAscending === false) {
          foundInputs2.sort((a, b) => {
            return a.place.localeCompare(b.place);
          });
        } else {
          foundInputs2.sort((a, b) => {
            return b.place.localeCompare(a.place);
          });
        }
        break;
      case 'PERSON':
        if (isInputPersonAscending === false) {
          foundInputs2.sort((a, b) => {
            return a.person.localeCompare(b.person);
          });
        } else {
          foundInputs2.sort((a, b) => {
            return b.person.localeCompare(a.person);
          });
        }
        break;
      case 'SUBJECT':
        if (isInputSubjectAscending === false) {
          foundInputs2.sort((a, b) => {
            return a.subject.localeCompare(b.subject);
          });
        } else {
          foundInputs2.sort((a, b) => {
            return b.subject.localeCompare(a.subject);
          });
        }
        break;
      case 'REASON':
        if (isInputReasonAscending === false) {
          foundInputs2.sort((a, b) => {
            return a.reason.localeCompare(b.reason);
          });
        } else {
          foundInputs2.sort((a, b) => {
            return b.reason.localeCompare(a.reason);
          });
        }
        break;
      case 'CONDITION':
        if (isInputConditionAscending === false) {
          foundInputs2.sort((a, b) => {
            return a.condition.localeCompare(b.condition);
          });
        } else {
          foundInputs2.sort((a, b) => {
            return b.condition.localeCompare(a.condition);
          });
        }
        break;
      case 'DATA':
        if (isInputDataAscending === false) {
          foundInputs2.sort((a, b) => {
            // foundInputs2.sort((a, b) => {
            return a.data
              .replaceAll(',', '')
              .localeCompare(b.data.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundInputs2.sort((a, b) => {
            // foundInputs2.reverse((a, b) => {
            return b.data
              .replaceAll(',', '')
              .localeCompare(a.data.replaceAll(',', ''), undefined, {
                numeric: true
              });
            // .reverse();
          });
        }
        break;
      case 'UNIT':
        if (isInputUnitAscending === false) {
          foundInputs2.sort((a, b) => {
            return a.unit.localeCompare(b.unit);
          });
        } else {
          foundInputs2.sort((a, b) => {
            return b.unit.localeCompare(a.unit);
          });
        }
        break;
      default:
        if (isInputIdAscending === false) {
          foundInputs2.sort((a, b) => {
            return a._id.localeCompare(b._id);
          });
        } else {
          foundInputs2.sort((a, b) => {
            return b._id.localeCompare(a._id);
          });
        }
    }

    function onlyUnique (value, index, array) {
      return array.indexOf(value) === index;
    }
    foundInputs2 = foundInputs2.filter(onlyUnique);

    const csvData = foundInputs2;

    const inputList = foundInputs2.map(input => {
      return (
        <Fragment>
          {/* <div key={input._id}> */}
          {/* <RenderInputItem */}
          <RenderInputTable
            input={input}
            deleteInput={props.deleteInput}
            updateInput={props.updateInput}
            resetInputForm={props.resetInputForm}
            auth={props.auth}
            isUpdating={props.isUpdating}
            isFullContentShown={isFullContentShown}
            toggleIsFullContentShown={toggleIsFullContentShown}
          />
          {/* </div> */}
        </Fragment>
      );
    });

    input_num = inputList.length;

    // Get current posts
    const indexOfLastInputList = currentPage * inputListPerPage;
    const indexOfFirstInputList = indexOfLastInputList - inputListPerPage;
    const currentInputList = inputList
      .reverse()
      .slice(indexOfFirstInputList, indexOfLastInputList);

    // console.log('currentInputs is', currentInputList);

    return (
      <div>
        <Card>
          <Row className='form-group'>
            <Col>
              <CardBody>
                <div className='row'>
                  <div className='col-6'>
                    {/* <h5>{input_num} items</h5> */}
                    <Button
                      outline
                      color={
                        isInputIdAscending === false ? 'primary' : 'secondary'
                      }
                      // color='secondary'
                      onClick={toggleIsInputIdAscending}
                      // style={{ border: 'none' }}
                    >
                      {input_num} items
                    </Button>
                    <Button
                      outline
                      onClick={toggleIsFullContentShown}
                      style={{ marginLeft: '10px' }}
                    >
                      {isFullContentShown ? '...' : 'Show all'}
                    </Button>
                  </div>
                  <div className='col-6'>
                    <CSVLink
                      data={csvData}
                      className='fa fa-arrow-down'
                    ></CSVLink>
                  </div>
                </div>
                <Table bordered responsive hover striped>
                  <thead>
                    <tr>
                      <th></th> {/* for Edit */}
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputDateAscending}
                        >
                          date
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputPlaceAscending}
                        >
                          place
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputPersonAscending}
                        >
                          person
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputSubjectAscending}
                        >
                          subject
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputReasonAscending}
                        >
                          reason
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputConditionAscending}
                        >
                          condition
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputDataAscending}
                        >
                          data
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputUnitAscending}
                        >
                          unit
                        </Button>
                      </th>
                      <th></th> {/* for Delete */}
                    </tr>
                  </thead>
                  <tbody>{currentInputList}</tbody>
                  {/* <tbody>{currentInputList.reverse()}</tbody> */}
                  {/* <tbody>{currentInputs}</tbody> */}
                </Table>
              </CardBody>
            </Col>
          </Row>
        </Card>
        <Pagination
          inputListPerPage={inputListPerPage}
          totalInputList={inputList.length}
          paginate={paginate}
        />
      </div>
    );
    // }
  } else if (props.inputs !== null) {
    // this.props.getDisplay(props.inputs);

    const inputList = props.inputs.map(input => {
      return (
        <Fragment>
          {/* <div key={input._id}> */}
          {/* <RenderInputItem */}
          <RenderInputTable
            input={input}
            deleteInput={props.deleteInput}
            updateInput={props.updateInput}
            resetInputForm={props.resetInputForm}
            auth={props.auth}
            isUpdating={props.isUpdating}
            isFullContentShown={isFullContentShown}
            toggleIsFullContentShown={toggleIsFullContentShown}
          />
          {/* </div> */}
        </Fragment>
      );
    });

    // console.log('isAnyFieldBtnPushed is', isAnyFieldBtnPushed);

    // if (isDateBtnPushed) {
    const conv = inputDate => {
      let day = inputDate.split(' ').find(element => element.includes('-'));
      if (day) {
        const len = day.split('-')[0].length;
        const firstnumber = day.split('-')[0];
        const secondnumber = day.split('-')[1];
        const thirdnumber = day.split('-')[2];

        if (len === 1 || len === 2) {
          // In the case of like "25-2023-1"
          if (thirdnumber === '1')
            day = `January-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '2')
            day = `Febrary-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '3')
            day = `March-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '4')
            day = `April-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '5')
            day = `May-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '6')
            day = `June-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '7')
            day = `July-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '8')
            day = `August-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '9')
            day = `September-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '10')
            day = `October-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '11')
            day = `November-${secondnumber}-${firstnumber}`;
          else if (thirdnumber === '12')
            day = `December-${secondnumber}-${firstnumber}`;
        }
      }

      const time = inputDate.split(' ').find(element => element.includes(':'));

      return day;
    };

    switch (toggledInputFieldButton) {
      case 'ID':
        if (isInputIdAscending === false) {
          props.inputs.sort((a, b) => {
            return a._id.localeCompare(b._id);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b._id.localeCompare(a._id);
          });
        }
        break;
      case 'DATE':
        if (isInputDateAscending === false) {
          props.inputs.sort((a, b) => {
            // return a.date.localeCompare(b.date);
            return new Date(conv(a.date)) - new Date(conv(b.date));
          });
        } else {
          props.inputs.sort((a, b) => {
            // return a.date.localeCompare(b.date).reverse();
            return new Date(conv(b.date)) - new Date(conv(a.date));
          });
        }
        break;
      case 'PLACE':
        if (isInputPlaceAscending === false) {
          props.inputs.sort((a, b) => {
            return a.place.localeCompare(b.place);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b.place.localeCompare(a.place);
          });
        }
        break;
      case 'PERSON':
        if (isInputPersonAscending === false) {
          props.inputs.sort((a, b) => {
            return a.person.localeCompare(b.person);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b.person.localeCompare(a.person);
          });
        }
        break;
      case 'SUBJECT':
        if (isInputSubjectAscending === false) {
          props.inputs.sort((a, b) => {
            return a.subject.localeCompare(b.subject);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b.subject.localeCompare(a.subject);
          });
        }
        break;
      case 'REASON':
        if (isInputReasonAscending === false) {
          props.inputs.sort((a, b) => {
            return a.reason.localeCompare(b.reason);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b.reason.localeCompare(a.reason);
          });
        }
        break;
      case 'CONDITION':
        if (isInputConditionAscending === false) {
          props.inputs.sort((a, b) => {
            return a.condition.localeCompare(b.condition);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b.condition.localeCompare(a.condition);
          });
        }
        break;
      case 'DATA':
        if (isInputDataAscending === false) {
          props.inputs.sort((a, b) => {
            // props.inputs.sort((a, b) => {
            return a.data
              .replaceAll(',', '')
              .localeCompare(b.data.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.inputs.sort((a, b) => {
            // props.inputs.reverse((a, b) => {
            return b.data
              .replaceAll(',', '')
              .localeCompare(a.data.replaceAll(',', ''), undefined, {
                numeric: true
              });
            // .reverse();
          });
        }
        break;
      case 'UNIT':
        if (isInputUnitAscending === false) {
          props.inputs.sort((a, b) => {
            return a.unit.localeCompare(b.unit);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b.unit.localeCompare(a.unit);
          });
        }
        break;
      default:
        if (isInputIdAscending === false) {
          props.inputs.sort((a, b) => {
            return a._id.localeCompare(b._id);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b._id.localeCompare(a._id);
          });
        }
    }

    input_num = inputList.length;
    const csvData = props.inputs;

    // Get current posts
    const indexOfLastInputList = currentPage * inputListPerPage;
    const indexOfFirstInputList = indexOfLastInputList - inputListPerPage;
    const currentInputList = inputList
      .reverse()
      .slice(indexOfFirstInputList, indexOfLastInputList);

    return (
      <div class='table-responsive'>
        <Card>
          <Row className='form-group'>
            <Col>
              <CardBody>
                <div className='row'>
                  <div className='col-6'>
                    {/* <h5>{input_num} items</h5> */}
                    <Button
                      outline
                      color={
                        isInputIdAscending === false ? 'primary' : 'secondary'
                      }
                      // color='secondary'
                      onClick={toggleIsInputIdAscending}
                      // style={{ border: 'none' }}
                    >
                      {input_num} items
                    </Button>
                    <Button
                      outline
                      onClick={toggleIsFullContentShown}
                      style={{ marginLeft: '10px' }}
                    >
                      {isFullContentShown ? '...' : 'Show all'}
                    </Button>
                  </div>
                  <div className='col-6'>
                    <CSVLink
                      data={csvData}
                      className='fa fa-arrow-down'
                    ></CSVLink>
                  </div>
                </div>
                <Table bordered responsive hover striped class='table'>
                  <thead>
                    <tr>
                      <th></th> {/* for Edit */}
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputDateAscending}
                        >
                          date
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputPlaceAscending}
                        >
                          place
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputPersonAscending}
                        >
                          person
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputSubjectAscending}
                        >
                          subject
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputReasonAscending}
                        >
                          reason
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputConditionAscending}
                        >
                          condition
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputDataAscending}
                        >
                          data
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleIsInputUnitAscending}
                        >
                          unit
                        </Button>
                      </th>
                      <th></th> {/* for Delete */}
                    </tr>
                  </thead>
                  {/* <tbody>{currentInputList.reverse()}</tbody> */}
                  <tbody>{currentInputList}</tbody>
                </Table>
              </CardBody>
            </Col>
          </Row>
        </Card>
        <Pagination
          inputListPerPage={inputListPerPage}
          totalInputList={inputList.length}
          paginate={paginate}
        />
      </div>
    );
  } else {
    return <div></div>;
  }
}
