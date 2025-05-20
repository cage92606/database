/* eslint-disable react/jsx-pascal-case */
import React, { useEffect, Fragment, useRef } from 'react';
import { useState } from 'react';
import { useSelector, useDispatch } from 'react-redux';

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
  Fade,
  Input
} from 'reactstrap';
import { ListGroup, ListGroupItem } from 'reactstrap';
import { Loading } from './LoadingComponent';
import { Control, Form } from 'react-redux-form';
import { CSVLink, CSVDownload } from 'react-csv';
import Pagination from './Pagination';
import DOMPurify from 'dompurify';

function RenderProInputTable ({
  proInput,
  deleteProInput,
  updateProInput,
  resetProInputForm,
  auth,
  isUpdating,
  isFullContentShown,
  toggleIsFullContentShown,
  saveScrollPosition, // Add this
  restoreScrollPosition // Add this
}) {
  const [isOpen, setIsOpen] = useState(false);
  // const [itemColors, setItemColors] = useState({});
  const itemColors = useSelector(state => state.fieldButtons.itemColors);
  const dispatch = useDispatch();

  const toggleModal = () => {
    setIsOpen(!isOpen);
  };

  const handleSubmit = (value, event) => {
    toggleModal();
    if (window.confirm('OK to change data?')) {
      updateProInput(
        proInput._id,
        value.date,
        value.place,
        value.person,
        value.subject,
        value.reason,
        value.condition1,
        value.condition2,
        value.condition3,
        value.condition4,
        value.condition5,
        value.condition6,
        value.condition7,
        value.condition8,
        value.condition9,
        value.condition10,
        value.condition11,
        value.condition12,
        value.condition13,
        value.condition14,
        value.condition15,
        value.condition16,
        value.condition17,
        value.condition18,
        value.condition19,
        value.condition20,
        value.data,
        value.unit
      );
    }
  };

  // const handleRightClick = (event, id) => {
  //   event.preventDefault();
  //   setItemColors(prevColors => ({
  //     ...prevColors,
  //     [id]: prevColors[id] === '#d6eaf8' ? 'white' : '#d6eaf8' // Toggle color between red and black
  //   }));
  //   // console.log('Right clicked on item with id:', id);
  // };

  const handleClick = (event, id) => {
    event.preventDefault();
    const newColor = itemColors[id] === '#d6eaf8' ? 'white' : '#d6eaf8';
    // dispatch(setItemColor(id, newColor));
    dispatch({
      type: 'SET_ITEM_COLOR',
      payload: { id, color: newColor }
    });
  };

  const handleLinkClick = event => {
    event.stopPropagation();
  };

  const [isDateEditing, setIsDateEditing] = useState(false);
  const [isPlaceEditing, setIsPlaceEditing] = useState(false);
  const [isPersonEditing, setIsPersonEditing] = useState(false);
  const [isSubjectEditing, setIsSubjectEditing] = useState(false);
  const [isReasonEditing, setIsReasonEditing] = useState(false);
  const [isCondition1Editing, setIsCondition1Editing] = useState(false);
  const [isCondition2Editing, setIsCondition2Editing] = useState(false);
  const [isCondition3Editing, setIsCondition3Editing] = useState(false);
  const [isCondition4Editing, setIsCondition4Editing] = useState(false);
  const [isCondition5Editing, setIsCondition5Editing] = useState(false);
  const [isCondition6Editing, setIsCondition6Editing] = useState(false);
  const [isCondition7Editing, setIsCondition7Editing] = useState(false);
  const [isCondition8Editing, setIsCondition8Editing] = useState(false);
  const [isCondition9Editing, setIsCondition9Editing] = useState(false);
  const [isCondition10Editing, setIsCondition10Editing] = useState(false);
  const [isCondition11Editing, setIsCondition11Editing] = useState(false);
  const [isCondition12Editing, setIsCondition12Editing] = useState(false);
  const [isCondition13Editing, setIsCondition13Editing] = useState(false);
  const [isCondition14Editing, setIsCondition14Editing] = useState(false);
  const [isCondition15Editing, setIsCondition15Editing] = useState(false);
  const [isCondition16Editing, setIsCondition16Editing] = useState(false);
  const [isCondition17Editing, setIsCondition17Editing] = useState(false);
  const [isCondition18Editing, setIsCondition18Editing] = useState(false);
  const [isCondition19Editing, setIsCondition19Editing] = useState(false);
  const [isCondition20Editing, setIsCondition20Editing] = useState(false);
  const [isDataEditing, setIsDataEditing] = useState(false);
  const [isUnitEditing, setIsUnitEditing] = useState(false);

  const [tempValue, setTempValue] = useState('');

  const handleDoubleClick = e => {
    const fieldName = e.target.getAttribute('name');
    const fieldValue = proInput[fieldName];
    setTempValue(fieldValue); // Store the current value before editing
    if (fieldName === 'date') setIsDateEditing(true);
    if (fieldName === 'place') setIsPlaceEditing(true);
    if (fieldName === 'person') setIsPersonEditing(true);
    if (fieldName === 'subject') setIsSubjectEditing(true);
    if (fieldName === 'reason') setIsReasonEditing(true);
    if (fieldName === 'condition1') setIsCondition1Editing(true);
    if (fieldName === 'condition2') setIsCondition2Editing(true);
    if (fieldName === 'condition3') setIsCondition3Editing(true);
    if (fieldName === 'condition4') setIsCondition4Editing(true);
    if (fieldName === 'condition5') setIsCondition5Editing(true);
    if (fieldName === 'condition6') setIsCondition6Editing(true);
    if (fieldName === 'condition7') setIsCondition7Editing(true);
    if (fieldName === 'condition8') setIsCondition8Editing(true);
    if (fieldName === 'condition9') setIsCondition9Editing(true);
    if (fieldName === 'condition10') setIsCondition10Editing(true);
    if (fieldName === 'condition11') setIsCondition11Editing(true);
    if (fieldName === 'condition12') setIsCondition12Editing(true);
    if (fieldName === 'condition13') setIsCondition13Editing(true);
    if (fieldName === 'condition14') setIsCondition14Editing(true);
    if (fieldName === 'condition15') setIsCondition15Editing(true);
    if (fieldName === 'condition16') setIsCondition16Editing(true);
    if (fieldName === 'condition17') setIsCondition17Editing(true);
    if (fieldName === 'condition18') setIsCondition18Editing(true);
    if (fieldName === 'condition19') setIsCondition19Editing(true);
    if (fieldName === 'condition20') setIsCondition20Editing(true);
    if (fieldName === 'data') setIsDataEditing(true);
    if (fieldName === 'unit') setIsUnitEditing(true);
  };

  const handleChange = e => {
    setTempValue(e.target.value); // Update the temporary value on each key press
  };
  const handleBlur = e => {
    if (!document.hasFocus()) {
      // The page or application does not have focus, so ignore the blur event
      return;
    }
    if (
      !(
        isDateEditing ||
        isPlaceEditing ||
        isPersonEditing ||
        isSubjectEditing ||
        isReasonEditing ||
        isCondition1Editing ||
        isCondition2Editing ||
        isCondition3Editing ||
        isCondition4Editing ||
        isCondition5Editing ||
        isCondition6Editing ||
        isCondition7Editing ||
        isCondition8Editing ||
        isCondition9Editing ||
        isCondition10Editing ||
        isCondition11Editing ||
        isCondition12Editing ||
        isCondition13Editing ||
        isCondition14Editing ||
        isCondition15Editing ||
        isCondition16Editing ||
        isCondition17Editing ||
        isCondition18Editing ||
        isCondition19Editing ||
        isCondition20Editing ||
        isDataEditing ||
        isUnitEditing
      )
    ) {
      // If it is not in editing mode,
      return;
    }
    const fieldName = e.target.name;
    if (tempValue !== proInput[fieldName]) {
      // Check if the proInput has changed
      const newproInput = { ...proInput, [fieldName]: tempValue }; // Use the temporary value to update the proInput
      if (window.confirm('OK to change data?')) {
        if (saveScrollPosition) {
          saveScrollPosition();
        }

        updateProInput(
          proInput._id,
          newproInput.date,
          newproInput.place,
          newproInput.person,
          newproInput.subject,
          newproInput.reason,
          newproInput.condition1,
          newproInput.condition2,
          newproInput.condition3,
          newproInput.condition4,
          newproInput.condition5,
          newproInput.condition6,
          newproInput.condition7,
          newproInput.condition8,
          newproInput.condition9,
          newproInput.condition10,
          newproInput.condition11,
          newproInput.condition12,
          newproInput.condition13,
          newproInput.condition14,
          newproInput.condition15,
          newproInput.condition16,
          newproInput.condition17,
          newproInput.condition18,
          newproInput.condition19,
          newproInput.condition20,
          newproInput.data,
          newproInput.unit
        ).then(() => {
          // Restore the scroll position after the update
          if (restoreScrollPosition) {
            restoreScrollPosition();
          }
        });
      }
    }
    if (fieldName === 'date') setIsDateEditing(false);
    if (fieldName === 'place') setIsPlaceEditing(false);
    if (fieldName === 'person') setIsPersonEditing(false);
    if (fieldName === 'subject') setIsSubjectEditing(false);
    if (fieldName === 'reason') setIsReasonEditing(false);
    if (fieldName === 'condition1') setIsCondition1Editing(false);
    if (fieldName === 'condition2') setIsCondition2Editing(false);
    if (fieldName === 'condition3') setIsCondition3Editing(false);
    if (fieldName === 'condition4') setIsCondition4Editing(false);
    if (fieldName === 'condition5') setIsCondition5Editing(false);
    if (fieldName === 'condition6') setIsCondition6Editing(false);
    if (fieldName === 'condition7') setIsCondition7Editing(false);
    if (fieldName === 'condition8') setIsCondition8Editing(false);
    if (fieldName === 'condition9') setIsCondition9Editing(false);
    if (fieldName === 'condition10') setIsCondition10Editing(false);
    if (fieldName === 'condition11') setIsCondition11Editing(false);
    if (fieldName === 'condition12') setIsCondition12Editing(false);
    if (fieldName === 'condition13') setIsCondition13Editing(false);
    if (fieldName === 'condition14') setIsCondition14Editing(false);
    if (fieldName === 'condition15') setIsCondition15Editing(false);
    if (fieldName === 'condition16') setIsCondition16Editing(false);
    if (fieldName === 'condition17') setIsCondition17Editing(false);
    if (fieldName === 'condition18') setIsCondition18Editing(false);
    if (fieldName === 'condition19') setIsCondition19Editing(false);
    if (fieldName === 'condition20') setIsCondition20Editing(false);
    if (fieldName === 'data') setIsDataEditing(false);
    if (fieldName === 'unit') setIsUnitEditing(false);
  };

  // const handleKeyDown = event => {
  //   if (event.key === 'Enter') {
  //     event.target.blur();
  //   }
  // };

  const handleKeyDown = event => {
    if (event.key === 'Enter') {
      event.preventDefault();
      // event.target.blur();
    }
  };

  const isNaNStyle = isNaN(proInput.data.replace(/,/g, ''))
    ? {}
    : { textAlign: 'right' };
  const backgroundStyle = {
    backgroundColor: itemColors[proInput._id] || 'white'
  }; // Example new style
  const dataStyle = { ...isNaNStyle, ...backgroundStyle };

  return (
    <tr style={{ backgroundColor: itemColors[proInput._id] || 'white' }}>
      <Modal
        isOpen={isOpen}
        toggle={toggleModal}
        size='lg'
        style={{ maxWidth: '1000px', width: '100%' }}
        className='my-modal'
      >
        <ModalHeader toggle={toggleModal}>Update ProInput</ModalHeader>
        <ModalBody>
          <Form onSubmit={handleSubmit} model='proInput'>
            <Row className='form-group mb-2'>
              <Label htmlFor='date'>date</Label>
              <Col sm={10}>
                <Control.text
                  model='.date'
                  id='date'
                  name='date'
                  defaultValue={proInput.date}
                  className='form-control'
                />
              </Col>
            </Row>
            <Row className='form-group mb-2'>
              <Label htmlFor='place'>place</Label>
              <Col sm={10}>
                <Control.text
                  model='.place'
                  id='place'
                  name='place'
                  defaultValue={proInput.place}
                  className='form-control'
                />
              </Col>
            </Row>
            <Row className='form-group mb-2'>
              <Label htmlFor='person'>person</Label>
              <Col sm={10}>
                <Control.text
                  model='.person'
                  id='person'
                  name='person'
                  defaultValue={proInput.person}
                  className='form-control'
                />
              </Col>
            </Row>
            <Row className='form-group mb-2'>
              <Label htmlFor='subject'>subject</Label>
              <Col sm={10}>
                <Control.text
                  model='.subject'
                  id='subject'
                  name='subject'
                  defaultValue={proInput.subject}
                  className='form-control'
                />
              </Col>
            </Row>
            <Row className='form-group mb-2'>
              <Label htmlFor='reason'>reason</Label>
              <Col sm={10}>
                <Control.textarea
                  model='.reason'
                  id='reason'
                  name='reason'
                  defaultValue={proInput.reason}
                  className='form-control'
                />
              </Col>
            </Row>
            <Row className='form-group mb-2'>
              <Label>condition</Label>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition1'
                  model='.condition1'
                  id='condition1'
                  name='condition1'
                  defaultValue={proInput.condition1}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition2'
                  model='.condition2'
                  id='condition2'
                  name='condition2'
                  defaultValue={proInput.condition2}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition3'
                  model='.condition3'
                  id='condition3'
                  name='condition3'
                  defaultValue={proInput.condition3}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition4'
                  model='.condition4'
                  id='condition4'
                  name='condition4'
                  defaultValue={proInput.condition4}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition5'
                  model='.condition5'
                  id='condition5'
                  name='condition5'
                  defaultValue={proInput.condition5}
                  className='form-control'
                />
              </Col>
            </Row>
            <Row className='form-group mb-2'>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition6'
                  model='.condition6'
                  id='condition6'
                  name='condition6'
                  defaultValue={proInput.condition6}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition7'
                  model='.condition7'
                  id='condition7'
                  name='condition7'
                  defaultValue={proInput.condition7}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition8'
                  model='.condition8'
                  id='condition8'
                  name='condition8'
                  defaultValue={proInput.condition8}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition9'
                  model='.condition9'
                  id='condition9'
                  name='condition9'
                  defaultValue={proInput.condition9}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition10'
                  model='.condition10'
                  id='condition10'
                  name='condition10'
                  defaultValue={proInput.condition10}
                  className='form-control'
                />
              </Col>
            </Row>
            <Row className='form-group mb-2'>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition11'
                  model='.condition11'
                  id='condition11'
                  name='condition11'
                  defaultValue={proInput.condition11}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition12'
                  model='.condition12'
                  id='condition12'
                  name='condition12'
                  defaultValue={proInput.condition12}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition13'
                  model='.condition13'
                  id='condition13'
                  name='condition13'
                  defaultValue={proInput.condition13}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition14'
                  model='.condition14'
                  id='condition14'
                  name='condition14'
                  defaultValue={proInput.condition14}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition15'
                  model='.condition15'
                  id='condition15'
                  name='condition15'
                  defaultValue={proInput.condition15}
                  className='form-control'
                />
              </Col>
            </Row>
            <Row className='form-group mb-2'>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition16'
                  model='.condition16'
                  id='condition16'
                  name='condition16'
                  defaultValue={proInput.condition16}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition17'
                  model='.condition17'
                  id='condition17'
                  name='condition17'
                  defaultValue={proInput.condition17}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition18'
                  model='.condition18'
                  id='condition18'
                  name='condition18'
                  defaultValue={proInput.condition18}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition19'
                  model='.condition19'
                  id='condition19'
                  name='condition19'
                  defaultValue={proInput.condition19}
                  className='form-control'
                />
              </Col>
              <Col sm={2}>
                <Control.text
                  htmlFor='condition20'
                  model='.condition20'
                  id='condition20'
                  name='condition20'
                  defaultValue={proInput.condition20}
                  className='form-control'
                />
              </Col>
            </Row>

            <Row className='form-group mb-2'>
              <Label htmlFor='data'>data</Label>
              <Col sm={4}>
                <Control.text
                  model='.data'
                  id='data'
                  name='data'
                  defaultValue={proInput.data}
                  className='form-control'
                />
              </Col>
              {/* </Row>
              <Row className="form-group mb-2"> */}
              <Label htmlFor='unit'>unit</Label>
              <Col sm={4}>
                <Control.text
                  model='.unit'
                  id='unit'
                  name='unit'
                  defaultValue={proInput.unit}
                  className='form-control'
                />
              </Col>
            </Row>
            <Button type='submit' value='submit' color='primary'>
              Submit
            </Button>
          </Form>
        </ModalBody>
      </Modal>

      <td
        className={'sticky-td'}
        onClick={event => handleClick(event, proInput._id)}
        // style={{
        //   backgroundColor: itemColors[proInput._id] || 'white'
        // }}
      >
        {auth.id === proInput.user ? (
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
      <td
        name='date'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        // style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isDateEditing ? (
          <Input
            name='date'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : (
          proInput.date
        )}
      </td>
      <td
        name='place'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        // style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isPlaceEditing ? (
          <Input
            name='place'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.place.indexOf('http') === 0 ||
          proInput.place.indexOf('/') === 0 ? (
          proInput.place ? (
            proInput.place.indexOf('http') === 0 ? (
              <a
                href={proInput.place}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.place.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {proInput.place.split('//')[1].split('/')[0].split('.')[1]}
                  </span>
                ) : proInput.place.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {proInput.place.split('//')[1].split('/')[0].split('.')[0]}
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.place.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.place.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {proInput.place.split('//')[1].split('/')[0].split('.')[1]}
                  </span>
                ) : (
                  <span>
                    {proInput.place.split('//')[1].split('/')[0].split('.')[0]}
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.place}`}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <code>{proInput.place}</code>
        )}
      </td>
      <td
        name='person'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isPersonEditing ? (
          <Input
            name='person'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : (
          proInput.person
        )}
      </td>
      <td
        name='subject'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isSubjectEditing ? (
          <Input
            name='subject'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : (
          <b>{proInput.subject}</b>
        )}
      </td>
      <td
        name='reason'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isReasonEditing ? (
          <Input
            name='reason'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : (
          <div
            name='reason'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.reason)
            }}
          />
        )}
      </td>

      <td
        name='condition1'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition1Editing ? (
          <Input
            name='condition1'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition1.indexOf('http') === 0 ||
          proInput.condition1.indexOf('/') === 0 ? (
          proInput.condition1 ? (
            proInput.condition1.indexOf('http') === 0 ? (
              <a
                href={proInput.condition1}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition1.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition1
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition1.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition1
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition1.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition1.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {
                      proInput.condition1
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition1
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition1}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          // proInput.condition1
          <div
            name='condition1'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition1)
            }}
          />
        )}
      </td>
      <td
        name='condition2'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition2Editing ? (
          <Input
            name='condition2'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition2.indexOf('http') === 0 ||
          proInput.condition2.indexOf('/') === 0 ? (
          proInput.condition2 ? (
            proInput.condition2.indexOf('http') === 0 ? (
              <a
                href={proInput.condition2}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition2.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition2
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition2.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition2
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition2.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition2.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {
                      proInput.condition2
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition2
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition2}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition2'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition2)
            }}
          />
        )}
      </td>
      <td
        name='condition3'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition3Editing ? (
          <Input
            name='condition3'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition3.indexOf('http') === 0 ||
          proInput.condition3.indexOf('/') === 0 ? (
          proInput.condition3 ? (
            proInput.condition3.indexOf('http') === 0 ? (
              <a
                href={proInput.condition3}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition3.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition3
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition3.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition3
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition3.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition3.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {
                      proInput.condition3
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition3
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition3}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition3'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition3)
            }}
          />
        )}
      </td>
      <td
        name='condition4'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition4Editing ? (
          <Input
            name='condition4'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition4.indexOf('http') === 0 ||
          proInput.condition4.indexOf('/') === 0 ? (
          proInput.condition4 ? (
            proInput.condition4.indexOf('http') === 0 ? (
              <a
                href={proInput.condition4}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition4.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition4
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition4.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition4
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition4.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition4.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {
                      proInput.condition4
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition4
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition4}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition4'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition4)
            }}
          />
        )}
      </td>

      <td
        name='condition5'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition5Editing ? (
          <Input
            name='condition5'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition5.indexOf('http') === 0 ||
          proInput.condition5.indexOf('/') === 0 ? (
          proInput.condition5 ? (
            proInput.condition5.indexOf('http') === 0 ? (
              <a
                href={proInput.condition5}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition5.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition5
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition5.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition5
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition5.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition5.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {
                      proInput.condition5
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition5
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition5}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition5'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition5)
            }}
          />
        )}
      </td>

      <td
        name='condition6'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition6Editing ? (
          <Input
            name='condition6'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition6.indexOf('http') === 0 ||
          proInput.condition6.indexOf('/') === 0 ? (
          proInput.condition6 ? (
            proInput.condition6.indexOf('http') === 0 ? (
              <a
                href={proInput.condition6}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition6.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition6
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition6.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition6
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition6.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition6.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {
                      proInput.condition6
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition6
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition6}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition6'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition6)
            }}
          />
        )}
      </td>

      <td
        name='condition7'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition7Editing ? (
          <Input
            name='condition7'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition7.indexOf('http') === 0 ||
          proInput.condition7.indexOf('/') === 0 ? (
          proInput.condition7 ? (
            proInput.condition7.indexOf('http') === 0 ? (
              <a
                href={proInput.condition7}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition7.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition7
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition7.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition7
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition7.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition7.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {
                      proInput.condition7
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition7
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition7}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition7'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition7)
            }}
          />
        )}
      </td>

      <td
        name='condition8'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition8Editing ? (
          <Input
            name='condition8'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition8.indexOf('http') === 0 ||
          proInput.condition8.indexOf('/') === 0 ? (
          proInput.condition8 ? (
            proInput.condition8.indexOf('http') === 0 ? (
              <a
                href={proInput.condition8}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition8.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition8
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition8.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition8
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition8.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition8.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {
                      proInput.condition8
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition8
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition8}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition8'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition8)
            }}
          />
        )}
      </td>

      <td
        name='condition9'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition9Editing ? (
          <Input
            name='condition9'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition9.indexOf('http') === 0 ||
          proInput.condition9.indexOf('/') === 0 ? (
          proInput.condition9 ? (
            proInput.condition9.indexOf('http') === 0 ? (
              <a
                href={proInput.condition9}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition9.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition9
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition9.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition9
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition9.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition9.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {
                      proInput.condition9
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition9
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition9}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition9'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition9)
            }}
          />
        )}
      </td>

      <td
        name='condition10'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition10Editing ? (
          <Input
            name='condition10'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition10.indexOf('http') === 0 ||
          proInput.condition10.indexOf('/') === 0 ? (
          proInput.condition10 ? (
            proInput.condition10.indexOf('http') === 0 ? (
              <a
                href={proInput.condition10}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition10.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition10
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition10.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition10
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition10.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition10
                    .split('//')[1]
                    .split('/')[0]
                    .split('.')[1].length ? (
                  <span>
                    {
                      proInput.condition10
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition10
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition10}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition10'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition10)
            }}
          />
        )}
      </td>

      <td
        name='condition11'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition11Editing ? (
          <Input
            name='condition11'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition11.indexOf('http') === 0 ||
          proInput.condition11.indexOf('/') === 0 ? (
          proInput.condition11 ? (
            proInput.condition11.indexOf('http') === 0 ? (
              <a
                href={proInput.condition11}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition11.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition11
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition11.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition11
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition11.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition11
                    .split('//')[1]
                    .split('/')[0]
                    .split('.')[1].length ? (
                  <span>
                    {
                      proInput.condition11
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition11
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition11}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition11'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition11)
            }}
          />
        )}
      </td>
      <td
        name='condition12'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition12Editing ? (
          <Input
            name='condition12'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition12.indexOf('http') === 0 ||
          proInput.condition12.indexOf('/') === 0 ? (
          proInput.condition12 ? (
            proInput.condition12.indexOf('http') === 0 ? (
              <a
                href={proInput.condition12}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition12.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition12
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition12.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition12
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition12.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition12
                    .split('//')[1]
                    .split('/')[0]
                    .split('.')[1].length ? (
                  <span>
                    {
                      proInput.condition12
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition12
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition12}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition12'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition12)
            }}
          />
        )}
      </td>

      <td
        name='condition13'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition13Editing ? (
          <Input
            name='condition13'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition13.indexOf('http') === 0 ||
          proInput.condition13.indexOf('/') === 0 ? (
          proInput.condition13 ? (
            proInput.condition13.indexOf('http') === 0 ? (
              <a
                href={proInput.condition13}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition13.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition13
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition13.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition13
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition13.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition13
                    .split('//')[1]
                    .split('/')[0]
                    .split('.')[1].length ? (
                  <span>
                    {
                      proInput.condition13
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition13
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition13}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition13'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition13)
            }}
          />
        )}
      </td>

      <td
        name='condition14'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition14Editing ? (
          <Input
            name='condition14'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition14.indexOf('http') === 0 ||
          proInput.condition14.indexOf('/') === 0 ? (
          proInput.condition14 ? (
            proInput.condition14.indexOf('http') === 0 ? (
              <a
                href={proInput.condition14}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition14.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition14
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition14.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition14
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition14.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition14
                    .split('//')[1]
                    .split('/')[0]
                    .split('.')[1].length ? (
                  <span>
                    {
                      proInput.condition14
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition14
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition14}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition14'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition14)
            }}
          />
        )}
      </td>

      <td
        name='condition15'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition15Editing ? (
          <Input
            name='condition15'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition15.indexOf('http') === 0 ||
          proInput.condition15.indexOf('/') === 0 ? (
          proInput.condition15 ? (
            proInput.condition15.indexOf('http') === 0 ? (
              <a
                href={proInput.condition15}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition15.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition15
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition15.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition15
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition15.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition15
                    .split('//')[1]
                    .split('/')[0]
                    .split('.')[1].length ? (
                  <span>
                    {
                      proInput.condition15
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition15
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition15}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition15'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition15)
            }}
          />
        )}
      </td>
      <td
        name='condition16'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition16Editing ? (
          <Input
            name='condition16'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition16.indexOf('http') === 0 ||
          proInput.condition16.indexOf('/') === 0 ? (
          proInput.condition16 ? (
            proInput.condition16.indexOf('http') === 0 ? (
              <a
                href={proInput.condition16}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition16.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition16
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition16.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition16
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition16.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition16
                    .split('//')[1]
                    .split('/')[0]
                    .split('.')[1].length ? (
                  <span>
                    {
                      proInput.condition16
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition16
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition16}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition16'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition16)
            }}
          />
        )}
      </td>
      <td
        name='condition17'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition17Editing ? (
          <Input
            name='condition17'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition17.indexOf('http') === 0 ||
          proInput.condition17.indexOf('/') === 0 ? (
          proInput.condition17 ? (
            proInput.condition17.indexOf('http') === 0 ? (
              <a
                href={proInput.condition17}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition17.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition17
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition17.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition17
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition17.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition17
                    .split('//')[1]
                    .split('/')[0]
                    .split('.')[1].length ? (
                  <span>
                    {
                      proInput.condition17
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition17
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition17}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition17'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition17)
            }}
          />
        )}
      </td>
      <td
        name='condition18'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition18Editing ? (
          <Input
            name='condition18'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition18.indexOf('http') === 0 ||
          proInput.condition18.indexOf('/') === 0 ? (
          proInput.condition18 ? (
            proInput.condition18.indexOf('http') === 0 ? (
              <a
                href={proInput.condition18}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition18.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition18
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition18.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition18
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition18.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition18
                    .split('//')[1]
                    .split('/')[0]
                    .split('.')[1].length ? (
                  <span>
                    {
                      proInput.condition18
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition18
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition18}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition18'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition18)
            }}
          />
        )}
      </td>

      <td
        name='condition19'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition19Editing ? (
          <Input
            name='condition19'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition19.indexOf('http') === 0 ||
          proInput.condition19.indexOf('/') === 0 ? (
          proInput.condition19 ? (
            proInput.condition19.indexOf('http') === 0 ? (
              <a
                href={proInput.condition19}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition19.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition19
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition19.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition19
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition19.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition19
                    .split('//')[1]
                    .split('/')[0]
                    .split('.')[1].length ? (
                  <span>
                    {
                      proInput.condition19
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition19
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition19}`}
                target='_blank'
                rel='noreferrer'
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition19'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition19)
            }}
          />
        )}
      </td>
      <td
        name='condition20'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isCondition20Editing ? (
          <Input
            name='condition20'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.condition20.indexOf('http') === 0 ||
          proInput.condition20.indexOf('/') === 0 ? (
          proInput.condition20 ? (
            proInput.condition20.indexOf('http') === 0 ? (
              <a
                href={proInput.condition20}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.condition20.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {
                      proInput.condition20
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : proInput.condition20.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {
                      proInput.condition20
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.condition20.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.condition20
                    .split('//')[1]
                    .split('/')[0]
                    .split('.')[1].length ? (
                  <span>
                    {
                      proInput.condition20
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[1]
                    }
                  </span>
                ) : (
                  <span>
                    {
                      proInput.condition20
                        .split('//')[1]
                        .split('/')[0]
                        .split('.')[0]
                    }
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.condition20}`}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <div
            name='condition20'
            onDoubleClick={handleDoubleClick} // Ensure double-click works
            dangerouslySetInnerHTML={{
              __html: DOMPurify.sanitize(proInput.condition20)
            }}
          />
        )}
      </td>

      <td
        name='data'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        // style={
        //   isNaN(proInput.data.replace(/,/g, '')) ? {} : { textAlign: 'right' }
        // }
        onClick={event => handleClick(event, proInput._id)}
        // style={dataStyle}
      >
        {auth.id === proInput.user && isDataEditing ? (
          <Input
            name='data'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : proInput.data.indexOf('http') === 0 ||
          proInput.data.indexOf('/') === 0 ? (
          proInput.data ? (
            proInput.data.indexOf('http') === 0 ? (
              <a
                href={proInput.data}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                {0 ? (
                  // {0 ? (
                  <span className='fa fa-link'></span>
                ) : proInput.data.indexOf('www') !== -1 ? (
                  // If the first word is 'www', use the second word
                  <span>
                    {proInput.data.split('//')[1].split('/')[0].split('.')[1]}
                  </span>
                ) : proInput.data.split('//')[1].split('/')[0].split('.')
                    .length === 2 || 1 ? (
                  // otherwise and if domain consists of 2 words, use the first word
                  <span>
                    {proInput.data.split('//')[1].split('/')[0].split('.')[0]}
                  </span>
                ) : // otherwise use whichever is longer among the first and second words
                proInput.data.split('//')[1].split('/')[0].split('.')[0]
                    .length <
                  proInput.data.split('//')[1].split('/')[0].split('.')[1]
                    .length ? (
                  <span>
                    {proInput.data.split('//')[1].split('/')[0].split('.')[1]}
                  </span>
                ) : (
                  <span>
                    {proInput.data.split('//')[1].split('/')[0].split('.')[0]}
                  </span>
                )}
              </a>
            ) : (
              <a
                href={`file:${proInput.data}`}
                target='_blank'
                rel='noreferrer'
                onClick={handleLinkClick}
              >
                <span className='fa fa-folder-open'></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <code>{proInput.data}</code>
        )}
      </td>
      <td
        name='unit'
        onDoubleClick={handleDoubleClick}
        onBlur={handleBlur}
        className={`${isFullContentShown ? '' : 'ellipsis'}`}
        onKeyDown={handleKeyDown}
        onClick={event => handleClick(event, proInput._id)}
        //style={{ backgroundColor: itemColors[proInput._id] || 'white' }}
      >
        {auth.id === proInput.user && isUnitEditing ? (
          <Input
            name='unit'
            type='text'
            value={tempValue}
            // onBlur={handleBlur}
            onChange={handleChange}
            autoFocus
          />
        ) : (
          proInput.unit
        )}
      </td>
      <td
        className={'sticky-td'}
        onClick={event => handleClick(event, proInput._id)}
        // style={{
        //   backgroundColor: itemColors[proInput._id] || 'white'
        // }}
      >
        {' '}
        {auth.id === proInput.user ? (
          <Button
            outline
            color='danger'
            disabled={isUpdating} // 2023.11.18
            onClick={() => {
              if (window.confirm('Are you sure?')) deleteProInput(proInput._id);
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

export let proInput_num;

export default function ListData (props) {
  const scrollContainerRef = useRef(null); // Define the ref here

  const isFullContentShown = useSelector(
    state => state.fieldButtons.isFullContentShown
  );

  const toggledProInputFieldButton = useSelector(
    state => state.fieldButtons.toggledProInputFieldButton
  );

  const isProInputIdAscending = useSelector(
    state => state.fieldButtons.isProInputIdAscending
  );
  const isProInputDateAscending = useSelector(
    state => state.fieldButtons.isProInputDateAscending
  );
  const isProInputPlaceAscending = useSelector(
    state => state.fieldButtons.isProInputPlaceAscending
  );
  const isProInputPersonAscending = useSelector(
    state => state.fieldButtons.isProInputPersonAscending
  );
  const isProInputSubjectAscending = useSelector(
    state => state.fieldButtons.isProInputSubjectAscending
  );
  const isProInputReasonAscending = useSelector(
    state => state.fieldButtons.isProInputReasonAscending
  );
  const isProInputCondition1Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition1Ascending
  );
  const isProInputCondition2Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition2Ascending
  );
  const isProInputCondition3Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition3Ascending
  );
  const isProInputCondition4Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition4Ascending
  );
  const isProInputCondition5Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition5Ascending
  );
  const isProInputCondition6Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition6Ascending
  );
  const isProInputCondition7Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition7Ascending
  );
  const isProInputCondition8Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition8Ascending
  );
  const isProInputCondition9Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition9Ascending
  );
  const isProInputCondition10Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition10Ascending
  );
  const isProInputCondition11Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition11Ascending
  );
  const isProInputCondition12Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition12Ascending
  );
  const isProInputCondition13Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition13Ascending
  );
  const isProInputCondition14Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition14Ascending
  );
  const isProInputCondition15Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition15Ascending
  );
  const isProInputCondition16Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition16Ascending
  );
  const isProInputCondition17Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition17Ascending
  );
  const isProInputCondition18Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition18Ascending
  );
  const isProInputCondition19Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition19Ascending
  );
  const isProInputCondition20Ascending = useSelector(
    state => state.fieldButtons.isProInputCondition20Ascending
  );
  const isProInputDataAscending = useSelector(
    state => state.fieldButtons.isProInputDataAscending
  );
  const isProInputUnitAscending = useSelector(
    state => state.fieldButtons.isProInputUnitAscending
  );

  const dispatch = useDispatch();
  const toggleIsProInputIdAscending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_ID_ASCENDING' });
  };
  const toggleIsProInputDateAscending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_DATE_ASCENDING' });
  };
  const toggleIsProInputPlaceAscending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_PLACE_ASCENDING' });
  };
  const toggleIsProInputPersonAscending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_PERSON_ASCENDING' });
  };
  const toggleIsProInputSubjectAscending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_SUBJECT_ASCENDING' });
  };
  const toggleIsProInputReasonAscending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_REASON_ASCENDING' });
  };
  const toggleIsProInputCondition1Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION1_ASCENDING' });
  };
  const toggleIsProInputCondition2Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION2_ASCENDING' });
  };
  const toggleIsProInputCondition3Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION3_ASCENDING' });
  };
  const toggleIsProInputCondition4Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION4_ASCENDING' });
  };
  const toggleIsProInputCondition5Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION5_ASCENDING' });
  };
  const toggleIsProInputCondition6Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION6_ASCENDING' });
  };
  const toggleIsProInputCondition7Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION7_ASCENDING' });
  };
  const toggleIsProInputCondition8Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION8_ASCENDING' });
  };
  const toggleIsProInputCondition9Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION9_ASCENDING' });
  };
  const toggleIsProInputCondition10Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION10_ASCENDING' });
  };
  const toggleIsProInputCondition11Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION11_ASCENDING' });
  };
  const toggleIsProInputCondition12Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION12_ASCENDING' });
  };
  const toggleIsProInputCondition13Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION13_ASCENDING' });
  };
  const toggleIsProInputCondition14Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION14_ASCENDING' });
  };
  const toggleIsProInputCondition15Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION15_ASCENDING' });
  };
  const toggleIsProInputCondition16Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION16_ASCENDING' });
  };
  const toggleIsProInputCondition17Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION17_ASCENDING' });
  };
  const toggleIsProInputCondition18Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION18_ASCENDING' });
  };
  const toggleIsProInputCondition19Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION19_ASCENDING' });
  };
  const toggleIsProInputCondition20Ascending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_CONDITION20_ASCENDING' });
  };
  const toggleIsProInputDataAscending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_DATA_ASCENDING' });
  };
  const toggleIsProInputUnitAscending = () => {
    dispatch({ type: 'TOGGLE_IS_PRO_INPUT_UNIT_ASCENDING' });
  };
  const toggleIsFullContentShown = () => {
    dispatch({ type: 'TOGGLE_IS_FULL_CONTENT_SHOWN' });
  };

  const [currentPage, setCurrentPage] = useState(1);
  const [proInputListPerPage] = useState(1000);

  const paginate = pageNumber => setCurrentPage(pageNumber);

  if (props.isLoading) {
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
    // console.log('setIsKeywordChanged is now ', setIsKeywordChanged);

    const keywordAndArray = props.keyword.split('|');
    var keywords = [];
    var exwords = [];
    for (let k = 0; k < keywordAndArray.length; k++) {
      let keywordArray = keywordAndArray[k].split(/[\s\u3000]+/);
      var keywords_temp = [];
      var exwords_temp = [];
      let j = 0;
      let m = 0;
      for (let i = 0; i < keywordArray.length; i++) {
        if ((keywordArray[i] !== ' ') & (keywordArray[i] !== '')) {
          if (keywordArray[i].split('')[0] === '!') {
            if (keywordArray[i].length === 2) {
              exwords_temp[m] = keywordArray[i]
                // .toLowerCase()
                .split('')
                .splice(1)
                .join('');
            } else {
              exwords_temp[m] = keywordArray[i]
                .toLowerCase()
                .split('')
                .splice(1)
                .join('');
            }
            m = m + 1;
          } else {
            if (keywordArray[i].length === 1) {
              keywords_temp[j] = keywordArray[i];
            } else {
              keywords_temp[j] = keywordArray[i].toLowerCase();
            }
            // keywords_temp[j] = keywordArray[i].toLowerCase();
            j = j + 1;
          }
        }
      }
      keywords.push(keywords_temp); // OR演算子で分割した各々のキーワード群
      exwords.push(exwords_temp);
    }
    var foundProInputs = [];
    for (let i = 0; i < keywords.length; i++) {
      //     for (let j = 0; j < keywords[i].length; j++) {
      const foundProInputs_temp = props.proInputs.filter(curr => {
        const test = keywords[i].map(keyword => {
          if (keyword.length === 1) {
            return (
              curr.date.includes(keyword) ||
              curr.place.includes(keyword) ||
              curr.person.includes(keyword) ||
              curr.subject.includes(keyword) ||
              curr.reason.includes(keyword) ||
              curr.condition1.includes(keyword) ||
              curr.condition2.includes(keyword) ||
              curr.condition3.includes(keyword) ||
              curr.condition4.includes(keyword) ||
              curr.condition5.includes(keyword) ||
              curr.condition6.includes(keyword) ||
              curr.condition7.includes(keyword) ||
              curr.condition8.includes(keyword) ||
              curr.condition9.includes(keyword) ||
              curr.condition10.includes(keyword) ||
              curr.condition11.includes(keyword) ||
              curr.condition12.includes(keyword) ||
              curr.condition13.includes(keyword) ||
              curr.condition14.includes(keyword) ||
              curr.condition15.includes(keyword) ||
              curr.condition16.includes(keyword) ||
              curr.condition17.includes(keyword) ||
              curr.condition18.includes(keyword) ||
              curr.condition19.includes(keyword) ||
              curr.condition20.includes(keyword) ||
              curr.data.includes(keyword) ||
              curr.unit.includes(keyword)
            );
          } else {
            return (
              curr.date.toLowerCase().includes(keyword) ||
              curr.place.toLowerCase().includes(keyword) ||
              curr.person.toLowerCase().includes(keyword) ||
              curr.subject.toLowerCase().includes(keyword) ||
              curr.reason.toLowerCase().includes(keyword) ||
              curr.condition1.toLowerCase().includes(keyword) ||
              curr.condition2.toLowerCase().includes(keyword) ||
              curr.condition3.toLowerCase().includes(keyword) ||
              curr.condition4.toLowerCase().includes(keyword) ||
              curr.condition5.toLowerCase().includes(keyword) ||
              curr.condition6.toLowerCase().includes(keyword) ||
              curr.condition7.toLowerCase().includes(keyword) ||
              curr.condition8.toLowerCase().includes(keyword) ||
              curr.condition9.toLowerCase().includes(keyword) ||
              curr.condition10.toLowerCase().includes(keyword) ||
              curr.condition11.toLowerCase().includes(keyword) ||
              curr.condition12.toLowerCase().includes(keyword) ||
              curr.condition13.toLowerCase().includes(keyword) ||
              curr.condition14.toLowerCase().includes(keyword) ||
              curr.condition15.toLowerCase().includes(keyword) ||
              curr.condition16.toLowerCase().includes(keyword) ||
              curr.condition17.toLowerCase().includes(keyword) ||
              curr.condition18.toLowerCase().includes(keyword) ||
              curr.condition19.toLowerCase().includes(keyword) ||
              curr.condition20.toLowerCase().includes(keyword) ||
              curr.data.toLowerCase().includes(keyword) ||
              curr.unit.toLowerCase().includes(keyword)
            );
          }
        });
        return test.every(logic => logic === true);
      });
      foundProInputs = foundProInputs.concat(foundProInputs_temp);
      //     }
    }
    var foundProInputs2 = [];
    for (let i = 0; i < exwords.length; i++) {
      //     for (let j = 0; j < keywords[i].length; j++) {
      const foundProInputs2_temp = foundProInputs.filter(curr => {
        const test = exwords[i].map(exword => {
          if (exword.length === 1) {
            return (
              curr.date.includes(exword) ||
              curr.place.includes(exword) ||
              curr.person.includes(exword) ||
              curr.subject.includes(exword) ||
              curr.reason.includes(exword) ||
              curr.condition1.includes(exword) ||
              curr.condition2.includes(exword) ||
              curr.condition3.includes(exword) ||
              curr.condition4.includes(exword) ||
              curr.condition5.includes(exword) ||
              curr.condition6.includes(exword) ||
              curr.condition7.includes(exword) ||
              curr.condition8.includes(exword) ||
              curr.condition9.includes(exword) ||
              curr.condition10.includes(exword) ||
              curr.condition11.includes(exword) ||
              curr.condition12.includes(exword) ||
              curr.condition13.includes(exword) ||
              curr.condition14.includes(exword) ||
              curr.condition15.includes(exword) ||
              curr.condition16.includes(exword) ||
              curr.condition17.includes(exword) ||
              curr.condition18.includes(exword) ||
              curr.condition19.includes(exword) ||
              curr.condition20.includes(exword) ||
              curr.data.includes(exword) ||
              curr.unit.includes(exword)
            );
          } else {
            return (
              curr.date.toLowerCase().includes(exword) ||
              curr.place.toLowerCase().includes(exword) ||
              curr.person.toLowerCase().includes(exword) ||
              curr.subject.toLowerCase().includes(exword) ||
              curr.reason.toLowerCase().includes(exword) ||
              curr.condition1.toLowerCase().includes(exword) ||
              curr.condition2.toLowerCase().includes(exword) ||
              curr.condition3.toLowerCase().includes(exword) ||
              curr.condition4.toLowerCase().includes(exword) ||
              curr.condition5.toLowerCase().includes(exword) ||
              curr.condition6.toLowerCase().includes(exword) ||
              curr.condition7.toLowerCase().includes(exword) ||
              curr.condition8.toLowerCase().includes(exword) ||
              curr.condition9.toLowerCase().includes(exword) ||
              curr.condition10.toLowerCase().includes(exword) ||
              curr.condition11.toLowerCase().includes(exword) ||
              curr.condition12.toLowerCase().includes(exword) ||
              curr.condition13.toLowerCase().includes(exword) ||
              curr.condition14.toLowerCase().includes(exword) ||
              curr.condition15.toLowerCase().includes(exword) ||
              curr.condition16.toLowerCase().includes(exword) ||
              curr.condition17.toLowerCase().includes(exword) ||
              curr.condition18.toLowerCase().includes(exword) ||
              curr.condition19.toLowerCase().includes(exword) ||
              curr.condition20.toLowerCase().includes(exword) ||
              curr.data.toLowerCase().includes(exword) ||
              curr.unit.toLowerCase().includes(exword)
            );
          }
        });
        return test.every(logic => logic === false);
      });
      foundProInputs2 = foundProInputs2.concat(foundProInputs2_temp);
      //     }
      // props.proInputs.sort((a, b) => {
      //   return a._id.localeCompare(b._id);
      // });

      foundProInputs2.sort((a, b) => {
        return a._id.localeCompare(b._id);
      });
    }

    const conv = proInputDate => {
      let day = proInputDate.split(' ').find(element => element.includes('-'));
      if (day) {
        const len = day.split('-')[0].length;

        if (!day.split('-')[0]) {
          // console.error(`Unable to parse date from "${inputDate}"`);
          return '';
        }

        if (!day.split('-')[1]) {
          // console.error(`Unable to parse date from "${inputDate}"`);
          return '';
        }

        if (!day.split('-')[2]) {
          // console.error(`Unable to parse date from "${inputDate}"`);
          return '';
        }

        const firstnumber = day.split('-')[0].padStart(2, '0');
        const secondnumber = day.split('-')[1].padStart(2, '0');
        const thirdnumber = day.split('-')[2].padStart(2, '0');

        let time = proInputDate
          .split(' ')
          .find(element => element.includes(':'));
        if (!time) {
          if (len === 1 || len === 2) {
            day = `${secondnumber}-${thirdnumber}-${firstnumber} 00:00:00`;
            // console.log('day + time is', `${day} ${time}`);
          } else {
            day = `${firstnumber}-${secondnumber}-${thirdnumber} 00:00:00`;
            // console.log('day + time is', `${day} ${time}`);
          }
        } else {
          const [hour, minute] = time
            .split(':')
            .map(num => num.padStart(2, '0'));
          if (len === 1 || len === 2) {
            day = `${secondnumber}-${thirdnumber}-${firstnumber} ${hour}:${minute}:00`;
            // console.log('day + time is', `${day} ${time}`);
          } else {
            day = `${firstnumber}-${secondnumber}-${thirdnumber} ${hour}:${minute}:00`;
            // console.log('day + time is', `${day} ${time}`);
          }
        }
      }

      // const time = proInputDate
      //   .split(' ')
      //   .find(element => element.includes(':'));

      if (!day) {
        // console.error(`Unable to parse date from "${inputDate}"`);
        return '';
      }

      return day;
    };

    switch (toggledProInputFieldButton) {
      case 'ID':
        if (isProInputIdAscending === false) {
          foundProInputs2.sort((a, b) => {
            return a._id.localeCompare(b._id);
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b._id.localeCompare(a._id);
          });
        }
        break;

      case 'DATE':
        if (isProInputDateAscending === false) {
          foundProInputs2.sort((a, b) => {
            // return a.date.localeCompare(b.date);
            return conv(a.date).localeCompare(conv(b.date));
            // return new Date(conv(a.date)) - new Date(conv(b.date));
          });
        } else {
          foundProInputs2.sort((a, b) => {
            // return b.date.localeCompare(a.date);
            return conv(b.date).localeCompare(conv(a.date));
            // return new Date(conv(b.date)) - new Date(conv(a.date));
          });
        }

        break;
      case 'PLACE':
        if (isProInputPlaceAscending === false) {
          foundProInputs2.sort((a, b) => {
            return a.place.localeCompare(b.place);
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.place.localeCompare(a.place);
          });
        }
        break;
      case 'PERSON':
        if (isProInputPersonAscending === false) {
          foundProInputs2.sort((a, b) => {
            return a.person.localeCompare(b.person);
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.person.localeCompare(a.person);
          });
        }
        break;
      case 'SUBJECT':
        if (isProInputSubjectAscending === false) {
          foundProInputs2.sort((a, b) => {
            return a.subject.localeCompare(b.subject);
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.subject.localeCompare(a.subject);
          });
        }
        break;
      case 'REASON':
        if (isProInputReasonAscending === false) {
          foundProInputs2.sort((a, b) => {
            return a.reason.localeCompare(b.reason);
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.reason.localeCompare(a.reason);
          });
        }
        break;
      case 'CONDITION1':
        if (isProInputCondition1Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition1
              .replaceAll(',', '')
              .localeCompare(b.condition1.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition1
              .replaceAll(',', '')
              .localeCompare(a.condition1.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION2':
        if (isProInputCondition2Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition2
              .replaceAll(',', '')
              .localeCompare(b.condition2.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition2
              .replaceAll(',', '')
              .localeCompare(a.condition2.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION3':
        if (isProInputCondition3Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition3

              .replaceAll(',', '')
              .localeCompare(b.condition3.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition3
              .replaceAll(',', '')
              .localeCompare(a.condition3.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION4':
        if (isProInputCondition4Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition4
              .replaceAll(',', '')
              .localeCompare(b.condition4.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition4
              .replaceAll(',', '')
              .localeCompare(a.condition4.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION5':
        if (isProInputCondition5Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition5
              .replaceAll(',', '')
              .localeCompare(b.condition5.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition5
              .replaceAll(',', '')
              .localeCompare(a.condition5.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION6':
        if (isProInputCondition6Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition6
              .replaceAll(',', '')
              .localeCompare(b.condition6.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition6
              .replaceAll(',', '')
              .localeCompare(a.condition6.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION7':
        if (isProInputCondition7Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition7
              .replaceAll(',', '')
              .localeCompare(b.condition7.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition7
              .replaceAll(',', '')
              .localeCompare(a.condition7.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION8':
        if (isProInputCondition8Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition8
              .replaceAll(',', '')
              .localeCompare(b.condition8.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition8
              .replaceAll(',', '')
              .localeCompare(a.condition8.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION9':
        if (isProInputCondition9Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition9
              .replaceAll(',', '')
              .localeCompare(b.condition9.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition9
              .replaceAll(',', '')
              .localeCompare(a.condition9.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION10':
        if (isProInputCondition10Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition10
              .replaceAll(',', '')
              .localeCompare(b.condition10.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition10
              .replaceAll(',', '')
              .localeCompare(a.condition10.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION11':
        if (isProInputCondition11Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition11
              .replaceAll(',', '')
              .localeCompare(b.condition11.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition11
              .replaceAll(',', '')
              .localeCompare(a.condition11.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION12':
        if (isProInputCondition12Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition12
              .replaceAll(',', '')
              .localeCompare(b.condition12.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition12
              .replaceAll(',', '')
              .localeCompare(a.condition12.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION13':
        if (isProInputCondition13Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition13
              .replaceAll(',', '')
              .localeCompare(b.condition13.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition13
              .replaceAll(',', '')
              .localeCompare(a.condition13.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION14':
        if (isProInputCondition14Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition14
              .replaceAll(',', '')
              .localeCompare(b.condition14.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition14
              .replaceAll(',', '')
              .localeCompare(a.condition14.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION15':
        if (isProInputCondition15Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition15
              .replaceAll(',', '')
              .localeCompare(b.condition15.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition15
              .replaceAll(',', '')
              .localeCompare(a.condition15.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION16':
        if (isProInputCondition16Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition16
              .replaceAll(',', '')
              .localeCompare(b.condition16.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition16
              .replaceAll(',', '')
              .localeCompare(a.condition16.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION17':
        if (isProInputCondition17Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition17
              .replaceAll(',', '')
              .localeCompare(b.condition17.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition17
              .replaceAll(',', '')
              .localeCompare(a.condition17.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION18':
        if (isProInputCondition18Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition18
              .replaceAll(',', '')
              .localeCompare(b.condition18.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition18
              .replaceAll(',', '')
              .localeCompare(a.condition18.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION19':
        if (isProInputCondition19Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition19
              .replaceAll(',', '')
              .localeCompare(b.condition19.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition19
              .replaceAll(',', '')
              .localeCompare(a.condition19.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION20':
        if (isProInputCondition20Ascending === false) {
          foundProInputs2.sort((a, b) => {
            return a.condition20
              .replaceAll(',', '')
              .localeCompare(b.condition20.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.condition20
              .replaceAll(',', '')
              .localeCompare(a.condition20.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'DATA':
        if (isProInputDataAscending === false) {
          foundProInputs2.sort((a, b) => {
            return a.data
              .replaceAll(',', '')
              .localeCompare(b.data.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.data
              .replaceAll(',', '')
              .localeCompare(a.data.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'UNIT':
        if (isProInputUnitAscending === false) {
          foundProInputs2.sort((a, b) => {
            return a.unit.localeCompare(b.unit);
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b.unit.localeCompare(a.unit);
          });
        }
        break;
      default:
        if (isProInputIdAscending === false) {
          foundProInputs2.sort((a, b) => {
            return a._id.localeCompare(b._id);
          });
        } else {
          foundProInputs2.sort((a, b) => {
            return b._id.localeCompare(a._id);
          });
        }
    }

    function onlyUnique (value, index, array) {
      return array.indexOf(value) === index;
    }
    foundProInputs2 = foundProInputs2.filter(onlyUnique);

    const csvData = foundProInputs2;

    const proInputList = foundProInputs2.map(proInput => {
      return (
        <Fragment>
          <RenderProInputTable
            proInput={proInput}
            deleteProInput={props.deleteProInput}
            updateProInput={props.updateProInput}
            resetProInputForm={props.resetProInputForm}
            auth={props.auth}
            isUpdating={props.isUpdating}
            isFullContentShown={isFullContentShown}
            toggleIsFullContentShown={toggleIsFullContentShown}
            saveScrollPosition={props.saveScrollPosition} // Pass saveScrollPosition
            restoreScrollPosition={props.restoreScrollPosition} // Pass restoreScrollPosition
          />
          {/* </div> */}
        </Fragment>
      );
    });

    proInput_num = proInputList.length;

    // Get current posts
    const indexOfLastProInputList = currentPage * proInputListPerPage;
    const indexOfFirstProInputList =
      indexOfLastProInputList - proInputListPerPage;
    const currentProInputList = proInputList
      .reverse()
      .slice(indexOfFirstProInputList, indexOfLastProInputList);

    return (
      <div class='table-responsive'>
        <Card>
          <Row className='form-group'>
            <Col>
              <CardBody>
                <div className='row'>
                  <div className='col-6'>
                    {/* <h5>{proInput_num} items</h5> */}
                    <Button
                      outline
                      color={
                        isProInputIdAscending === false
                          ? 'primary'
                          : 'secondary'
                      }
                      // color='secondary'
                      onClick={toggleIsProInputIdAscending}
                      // style={{ border: 'none' }}
                    >
                      {proInput_num} items
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
                <div
                  class='table-responsive'
                  ref={props.scrollContainerRef} // Attach the ref to the Card
                  onScroll={props.saveScrollPosition} // Attach the onScroll event
                  style={{ overflowX: 'auto', whiteSpace: 'nowrap' }} // Ensure scrolling is enabled
                >
                  <Table
                    bordered
                    hover
                    striped
                    style={{
                      wordWrap: 'break-word', // Enable word wrapping
                      whiteSpace: 'normal' // Allow content to wrap
                    }}
                  >
                    <thead>
                      <tr>
                        <th></th> {/* for Edit */}
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputDateAscending}
                          >
                            date
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputPlaceAscending}
                          >
                            place
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputPersonAscending}
                          >
                            person
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputSubjectAscending}
                          >
                            subject
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputReasonAscending}
                          >
                            reason
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition1Ascending}
                          >
                            c1
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition2Ascending}
                          >
                            c2
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition3Ascending}
                          >
                            c3
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition4Ascending}
                          >
                            c4
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition5Ascending}
                          >
                            c5
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition6Ascending}
                          >
                            c6
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition7Ascending}
                          >
                            c7
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition8Ascending}
                          >
                            c8
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition9Ascending}
                          >
                            c9
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition10Ascending}
                          >
                            c10
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition11Ascending}
                          >
                            c11
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition12Ascending}
                          >
                            c12
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition13Ascending}
                          >
                            c13
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition14Ascending}
                          >
                            c14
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition15Ascending}
                          >
                            c15
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition16Ascending}
                          >
                            c16
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition17Ascending}
                          >
                            c17
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition18Ascending}
                          >
                            c18
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition19Ascending}
                          >
                            c19
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition20Ascending}
                          >
                            c20
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputDataAscending}
                          >
                            data
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputUnitAscending}
                          >
                            unit
                          </Button>
                        </th>
                        <th></th> {/* for Delete */}
                      </tr>
                    </thead>
                    <tbody>{currentProInputList}</tbody>
                  </Table>
                </div>
              </CardBody>
            </Col>
          </Row>
        </Card>
        <Pagination
          proInputListPerPage={proInputListPerPage}
          totalProInputList={proInputList.length}
          paginate={paginate}
        />
      </div>
    );
  } else if (props.proInputs !== null) {
    const proInputList = props.proInputs.map(proInput => {
      return (
        <Fragment>
          <RenderProInputTable
            proInput={proInput}
            deleteProInput={props.deleteProInput}
            updateProInput={props.updateProInput}
            resetProInputForm={props.resetProInputForm}
            auth={props.auth}
            isUpdating={props.isUpdating}
            isFullContentShown={isFullContentShown}
            toggleIsFullContentShown={toggleIsFullContentShown}
            saveScrollPosition={props.saveScrollPosition} // Pass saveScrollPosition
            restoreScrollPosition={props.restoreScrollPosition} // Pass restoreScrollPosition
          />
          {/* </div> */}
        </Fragment>
      );
    });

    // const toggleDateSort = async () => {
    const conv = proInputDate => {
      let day = proInputDate.split(' ').find(element => element.includes('-'));
      if (day) {
        const len = day.split('-')[0].length;

        if (!day.split('-')[0]) {
          // console.error(`Unable to parse date from "${inputDate}"`);
          return '';
        }

        if (!day.split('-')[1]) {
          // console.error(`Unable to parse date from "${inputDate}"`);
          return '';
        }

        if (!day.split('-')[2]) {
          // console.error(`Unable to parse date from "${inputDate}"`);
          return '';
        }

        const firstnumber = day.split('-')[0].padStart(2, '0');
        const secondnumber = day.split('-')[1].padStart(2, '0');
        const thirdnumber = day.split('-')[2].padStart(2, '0');

        let time = proInputDate
          .split(' ')
          .find(element => element.includes(':'));
        if (!time) {
          if (len === 1 || len === 2) {
            day = `${secondnumber}-${thirdnumber}-${firstnumber} 00:00:00`;
            // console.log('day + time is', `${day} ${time}`);
          } else {
            day = `${firstnumber}-${secondnumber}-${thirdnumber} 00:00:00`;
            // console.log('day + time is', `${day} ${time}`);
          }
        } else {
          const [hour, minute] = time
            .split(':')
            .map(num => num.padStart(2, '0'));
          if (len === 1 || len === 2) {
            day = `${secondnumber}-${thirdnumber}-${firstnumber} ${hour}:${minute}:00`;
            // console.log('day + time is', `${day} ${time}`);
          } else {
            day = `${firstnumber}-${secondnumber}-${thirdnumber} ${hour}:${minute}:00`;
            // console.log('day + time is', `${day} ${time}`);
          }
        }
      }

      // const time = proInputDate
      //   .split(' ')
      //   .find(element => element.includes(':'));

      if (!day) {
        // console.error(`Unable to parse date from "${inputDate}"`);
        return '';
      }

      return day;
    };

    switch (toggledProInputFieldButton) {
      case 'ID':
        if (isProInputIdAscending === false) {
          props.proInputs.sort((a, b) => {
            return a._id.localeCompare(b._id);
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b._id.localeCompare(a._id);
          });
        }
        break;

      case 'DATE':
        if (isProInputDateAscending === false) {
          props.proInputs.sort((a, b) => {
            // return a.date.localeCompare(b.date);
            return conv(a.date).localeCompare(conv(b.date));
            // return new Date(conv(a.date)) - new Date(conv(b.date));
          });
        } else {
          props.proInputs.sort((a, b) => {
            // return b.date.localeCompare(a.date);
            return conv(b.date).localeCompare(conv(a.date));
            // return new Date(conv(b.date)) - new Date(conv(a.date));
          });
        }

        break;
      case 'PLACE':
        if (isProInputPlaceAscending === false) {
          props.proInputs.sort((a, b) => {
            return a.place.localeCompare(b.place);
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.place.localeCompare(a.place);
          });
        }
        break;
      case 'PERSON':
        if (isProInputPersonAscending === false) {
          props.proInputs.sort((a, b) => {
            return a.person.localeCompare(b.person);
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.person.localeCompare(a.person);
          });
        }
        break;
      case 'SUBJECT':
        if (isProInputSubjectAscending === false) {
          props.proInputs.sort((a, b) => {
            return a.subject.localeCompare(b.subject);
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.subject.localeCompare(a.subject);
          });
        }
        break;
      case 'REASON':
        if (isProInputReasonAscending === false) {
          props.proInputs.sort((a, b) => {
            return a.reason.localeCompare(b.reason);
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.reason.localeCompare(a.reason);
          });
        }
        break;
      case 'CONDITION1':
        if (isProInputCondition1Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition1
              .replaceAll(',', '')
              .localeCompare(b.condition1.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition1
              .replaceAll(',', '')
              .localeCompare(a.condition1.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION2':
        if (isProInputCondition2Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition2
              .replaceAll(',', '')
              .localeCompare(b.condition2.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition2
              .replaceAll(',', '')
              .localeCompare(a.condition2.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION3':
        if (isProInputCondition3Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition3

              .replaceAll(',', '')
              .localeCompare(b.condition3.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition3
              .replaceAll(',', '')
              .localeCompare(a.condition3.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION4':
        if (isProInputCondition4Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition4
              .replaceAll(',', '')
              .localeCompare(b.condition4.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition4
              .replaceAll(',', '')
              .localeCompare(a.condition4.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION5':
        if (isProInputCondition5Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition5
              .replaceAll(',', '')
              .localeCompare(b.condition5.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition5
              .replaceAll(',', '')
              .localeCompare(a.condition5.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION6':
        if (isProInputCondition6Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition6
              .replaceAll(',', '')
              .localeCompare(b.condition6.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition6
              .replaceAll(',', '')
              .localeCompare(a.condition6.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION7':
        if (isProInputCondition7Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition7
              .replaceAll(',', '')
              .localeCompare(b.condition7.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition7
              .replaceAll(',', '')
              .localeCompare(a.condition7.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION8':
        if (isProInputCondition8Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition8
              .replaceAll(',', '')
              .localeCompare(b.condition8.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition8
              .replaceAll(',', '')
              .localeCompare(a.condition8.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION9':
        if (isProInputCondition9Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition9
              .replaceAll(',', '')
              .localeCompare(b.condition9.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition9
              .replaceAll(',', '')
              .localeCompare(a.condition9.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION10':
        if (isProInputCondition10Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition10
              .replaceAll(',', '')
              .localeCompare(b.condition10.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition10
              .replaceAll(',', '')
              .localeCompare(a.condition10.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION11':
        if (isProInputCondition11Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition11
              .replaceAll(',', '')
              .localeCompare(b.condition11.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition11
              .replaceAll(',', '')
              .localeCompare(a.condition11.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION12':
        if (isProInputCondition12Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition12
              .replaceAll(',', '')
              .localeCompare(b.condition12.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition12
              .replaceAll(',', '')
              .localeCompare(a.condition12.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION13':
        if (isProInputCondition13Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition13
              .replaceAll(',', '')
              .localeCompare(b.condition13.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition13
              .replaceAll(',', '')
              .localeCompare(a.condition13.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION14':
        if (isProInputCondition14Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition14
              .replaceAll(',', '')
              .localeCompare(b.condition14.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition14
              .replaceAll(',', '')
              .localeCompare(a.condition14.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION15':
        if (isProInputCondition15Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition15
              .replaceAll(',', '')
              .localeCompare(b.condition15.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition15
              .replaceAll(',', '')
              .localeCompare(a.condition15.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION16':
        if (isProInputCondition16Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition16
              .replaceAll(',', '')
              .localeCompare(b.condition16.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition16
              .replaceAll(',', '')
              .localeCompare(a.condition16.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION17':
        if (isProInputCondition17Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition17
              .replaceAll(',', '')
              .localeCompare(b.condition17.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition17
              .replaceAll(',', '')
              .localeCompare(a.condition17.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION18':
        if (isProInputCondition18Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition18
              .replaceAll(',', '')
              .localeCompare(b.condition18.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition18
              .replaceAll(',', '')
              .localeCompare(a.condition18.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION19':
        if (isProInputCondition19Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition19
              .replaceAll(',', '')
              .localeCompare(b.condition19.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition19
              .replaceAll(',', '')
              .localeCompare(a.condition19.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'CONDITION20':
        if (isProInputCondition20Ascending === false) {
          props.proInputs.sort((a, b) => {
            return a.condition20
              .replaceAll(',', '')
              .localeCompare(b.condition20.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.condition20
              .replaceAll(',', '')
              .localeCompare(a.condition20.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'DATA':
        if (isProInputDataAscending === false) {
          props.proInputs.sort((a, b) => {
            return a.data
              .replaceAll(',', '')
              .localeCompare(b.data.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.data
              .replaceAll(',', '')
              .localeCompare(a.data.replaceAll(',', ''), undefined, {
                numeric: true
              });
          });
        }
        break;
      case 'UNIT':
        if (isProInputUnitAscending === false) {
          props.proInputs.sort((a, b) => {
            return a.unit.localeCompare(b.unit);
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b.unit.localeCompare(a.unit);
          });
        }
        break;
      default:
        if (isProInputIdAscending === false) {
          props.proInputs.sort((a, b) => {
            return a._id.localeCompare(b._id);
          });
        } else {
          props.proInputs.sort((a, b) => {
            return b._id.localeCompare(a._id);
          });
        }
    }

    proInput_num = proInputList.length;
    const csvData = props.proInputs;

    // Get current posts
    const indexOfLastProInputList = currentPage * proInputListPerPage;
    const indexOfFirstProInputList =
      indexOfLastProInputList - proInputListPerPage;
    const currentProInputList = proInputList
      .reverse()
      .slice(indexOfFirstProInputList, indexOfLastProInputList);

    return (
      <div class='table-responsive'>
        <Card>
          <Row className='form-group'>
            <Col>
              <CardBody>
                <div className='row'>
                  <div className='col-6'>
                    {/* <h5>{proInput_num} items</h5> */}
                    <Button
                      outline
                      color={
                        isProInputIdAscending === false
                          ? 'primary'
                          : 'secondary'
                      }
                      // color='secondary'
                      onClick={toggleIsProInputIdAscending}
                      // style={{ border: 'none' }}
                    >
                      {proInput_num} items
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
                <div
                  class='table-responsive'
                  ref={props.scrollContainerRef} // Attach the ref to the Card
                  onScroll={props.saveScrollPosition} // Attach the onScroll event
                  style={{ overflowX: 'auto', whiteSpace: 'nowrap' }} // Ensure scrolling is enabled
                >
                  <Table
                    bordered
                    hover
                    striped
                    class='table'
                    style={{
                      wordWrap: 'break-word', // Enable word wrapping
                      whiteSpace: 'normal' // Allow content to wrap
                    }}
                  >
                    <thead>
                      <tr>
                        <th></th> {/* for Edit */}
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputDateAscending}
                          >
                            date
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputPlaceAscending}
                          >
                            place
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputPersonAscending}
                          >
                            person
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputSubjectAscending}
                          >
                            subject
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputReasonAscending}
                          >
                            reason
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition1Ascending}
                          >
                            c1
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition2Ascending}
                          >
                            c2
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition3Ascending}
                          >
                            c3
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition4Ascending}
                          >
                            c4
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition5Ascending}
                          >
                            c5
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition6Ascending}
                          >
                            c6
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition7Ascending}
                          >
                            c7
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition8Ascending}
                          >
                            c8
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition9Ascending}
                          >
                            c9
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition10Ascending}
                          >
                            c10
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition11Ascending}
                          >
                            c11
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition12Ascending}
                          >
                            c12
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition13Ascending}
                          >
                            c13
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition14Ascending}
                          >
                            c14
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition15Ascending}
                          >
                            c15
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition16Ascending}
                          >
                            c16
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition17Ascending}
                          >
                            c17
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition18Ascending}
                          >
                            c18
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition19Ascending}
                          >
                            c19
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputCondition20Ascending}
                          >
                            c20
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputDataAscending}
                          >
                            data
                          </Button>
                        </th>
                        <th>
                          <Button
                            outline
                            color='secondary'
                            onClick={toggleIsProInputUnitAscending}
                          >
                            unit
                          </Button>
                        </th>
                        <th></th> {/* for Delete */}
                      </tr>
                    </thead>
                    <tbody>{currentProInputList}</tbody>
                  </Table>
                </div>
              </CardBody>
            </Col>
          </Row>
        </Card>
        <Pagination
          proInputListPerPage={proInputListPerPage}
          totalProInputList={proInputList.length}
          paginate={paginate}
        />
      </div>
    );
  } else {
    return <div></div>;
  }
}
