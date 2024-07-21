/* eslint-disable react/jsx-pascal-case */
import React, { useEffect, Fragment } from 'react';
import { useState } from 'react';
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
  Fade
} from 'reactstrap';
import { ListGroup, ListGroupItem } from 'reactstrap';
import { Loading } from './LoadingComponent';
import { Control, Form } from 'react-redux-form';
import { CSVLink, CSVDownload } from 'react-csv';
import Pagination from './Pagination';

function RenderKirkItem ({
  kirk,
  deleteKirk,
  updateKirk,
  resetKirkForm,
  auth,
  isUpdating
}) {
  const [isOpen, setIsOpen] = useState(false);

  const toggleModal = () => {
    setIsOpen(!isOpen);
  };

  const handleSubmit = (value, event) => {
    toggleModal();
    if (window.confirm('OK to change data?')) {
      updateKirk(
        kirk._id,
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
      // resetProInputForm();
    }
  };

  return (
    <ListGroup>
      <ListGroupItem>
        {auth.id === kirk.user ? (
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
                    defaultValue={kirk.date}
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
                    defaultValue={kirk.place}
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
                    defaultValue={kirk.person}
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
                    defaultValue={kirk.subject}
                    className='form-control'
                  />
                </Col>
              </Row>
              <Row className='form-group mb-2'>
                <Label htmlFor='reason'>reason</Label>
                <Col sm={10}>
                  <Control.text
                    model='.reason'
                    id='reason'
                    name='reason'
                    defaultValue={kirk.reason}
                    className='form-control'
                  />
                </Col>
              </Row>
              <Row className='form-group mb-2'>
                <Label>condition</Label>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition1'
                    model='.condition1'
                    id='condition1'
                    name='condition1'
                    defaultValue={kirk.condition1}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition2'
                    model='.condition2'
                    id='condition2'
                    name='condition2'
                    defaultValue={kirk.condition2}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition3'
                    model='.condition3'
                    id='condition3'
                    name='condition3'
                    defaultValue={kirk.condition3}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition4'
                    model='.condition4'
                    id='condition4'
                    name='condition4'
                    defaultValue={kirk.condition4}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition5'
                    model='.condition5'
                    id='condition5'
                    name='condition5'
                    defaultValue={kirk.condition5}
                    className='form-control'
                    rows='1'
                  />
                </Col>
              </Row>
              <Row className='form-group mb-2'>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition6'
                    model='.condition6'
                    id='condition6'
                    name='condition6'
                    defaultValue={kirk.condition6}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition7'
                    model='.condition7'
                    id='condition7'
                    name='condition7'
                    defaultValue={kirk.condition7}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition8'
                    model='.condition8'
                    id='condition8'
                    name='condition8'
                    defaultValue={kirk.condition8}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition9'
                    model='.condition9'
                    id='condition9'
                    name='condition9'
                    defaultValue={kirk.condition9}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition10'
                    model='.condition10'
                    id='condition10'
                    name='condition10'
                    defaultValue={kirk.condition10}
                    className='form-control'
                    rows='1'
                  />
                </Col>
              </Row>
              <Row className='form-group mb-2'>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition11'
                    model='.condition11'
                    id='condition11'
                    name='condition11'
                    defaultValue={kirk.condition11}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition12'
                    model='.condition12'
                    id='condition12'
                    name='condition12'
                    defaultValue={kirk.condition12}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition13'
                    model='.condition13'
                    id='condition13'
                    name='condition13'
                    defaultValue={kirk.condition13}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition14'
                    model='.condition14'
                    id='condition14'
                    name='condition14'
                    defaultValue={kirk.condition14}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition15'
                    model='.condition15'
                    id='condition15'
                    name='condition15'
                    defaultValue={kirk.condition15}
                    className='form-control'
                    rows='1'
                  />
                </Col>
              </Row>
              <Row className='form-group mb-2'>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition16'
                    model='.condition16'
                    id='condition16'
                    name='condition16'
                    defaultValue={kirk.condition16}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition17'
                    model='.condition17'
                    id='condition17'
                    name='condition17'
                    defaultValue={kirk.condition17}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition18'
                    model='.condition18'
                    id='condition18'
                    name='condition18'
                    defaultValue={kirk.condition18}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition19'
                    model='.condition19'
                    id='condition19'
                    name='condition19'
                    defaultValue={kirk.condition19}
                    className='form-control'
                    rows='1'
                  />
                </Col>
                <Col sm={10}>
                  <Control.textarea
                    htmlFor='condition20'
                    model='.condition20'
                    id='condition20'
                    name='condition20'
                    defaultValue={kirk.condition20}
                    className='form-control'
                    rows='1'
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
                    defaultValue={kirk.data}
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
                    defaultValue={kirk.unit}
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
        {`  ${kirk.date} `}
        {auth.id === kirk.user ? (
          <Button
            outline
            color='danger'
            disabled={isUpdating} // 2023.11.18
            onClick={() => {
              if (window.confirm('Are you sure?')) deleteKirk(kirk._id);
            }}
            style={{ float: 'right', border: 'none' }}
          >
            <span className='fa fa-times'></span>
          </Button>
        ) : (
          <span></span>
        )}
        <br />
        {kirk.place === ''
          ? ''
          : [
              kirk.place.indexOf('http') === 0 ||
              kirk.place.indexOf('/') === 0 ? (
                kirk.place ? (
                  kirk.place.indexOf('http') === 0 ? (
                    <a href={kirk.place} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.place.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.place
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.place.split('//')[1].split('/')[0].split('.')
                          .length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.place
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.place.split('//')[1].split('/')[0].split('.')[0]
                          .length <
                        kirk.place.split('//')[1].split('/')[0].split('.')[1]
                          .length ? (
                        <span>
                          {
                            kirk.place
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.place
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.place}`}
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
                <code>{kirk.place}</code>
              ),
              <br key='br' />
            ]}
        {kirk.person === '' ? '' : [kirk.person, <br key='br' />]}
        {kirk.subject === '' ? '' : [<b>{kirk.subject}</b>, <br key='br' />]}
        {/* <b>{kirk.subject} </b>
        <br /> */}
        {kirk.reason === '' ? '' : [kirk.reason, <br key='br' />]}
        {kirk.condition1 === ''
          ? ''
          : [
              kirk.condition1.indexOf('http') === 0 ||
              kirk.condition1.indexOf('/') === 0 ? (
                kirk.condition1 ? (
                  kirk.condition1.indexOf('http') === 0 ? (
                    <a href={kirk.condition1} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition1.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition1
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition1
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition1
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition1.split('//')[1].split('/')[0].split('.')[0]
                          .length <
                        kirk.condition1
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition1
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition1
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition1}`}
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
                kirk.condition1
              ),
              <br key='br' />
            ]}
        {kirk.condition2 === ''
          ? ''
          : [
              kirk.condition2.indexOf('http') === 0 ||
              kirk.condition2.indexOf('/') === 0 ? (
                kirk.condition2 ? (
                  kirk.condition2.indexOf('http') === 0 ? (
                    <a href={kirk.condition2} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition2.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition2
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition2
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition2
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition2.split('//')[1].split('/')[0].split('.')[0]
                          .length <
                        kirk.condition2
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition2
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition2
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition2}`}
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
                kirk.condition2
              ),
              <br key='br' />
            ]}

        {kirk.condition3 === ''
          ? ''
          : [
              kirk.condition3.indexOf('http') === 0 ||
              kirk.condition3.indexOf('/') === 0 ? (
                kirk.condition3 ? (
                  kirk.condition3.indexOf('http') === 0 ? (
                    <a href={kirk.condition3} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition3.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition3
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition3
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition3
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition3.split('//')[1].split('/')[0].split('.')[0]
                          .length <
                        kirk.condition3
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition3
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition3
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition3}`}
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
                kirk.condition3
              ),
              <br key='br' />
            ]}
        {kirk.condition4 === ''
          ? ''
          : [
              kirk.condition4.indexOf('http') === 0 ||
              kirk.condition4.indexOf('/') === 0 ? (
                kirk.condition4 ? (
                  kirk.condition4.indexOf('http') === 0 ? (
                    <a href={kirk.condition4} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition4.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition4
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition4
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition4
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition4.split('//')[1].split('/')[0].split('.')[0]
                          .length <
                        kirk.condition4
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition4
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition4
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition4}`}
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
                kirk.condition4
              ),
              <br key='br' />
            ]}

        {kirk.condition5 === ''
          ? ''
          : [
              kirk.condition5.indexOf('http') === 0 ||
              kirk.condition5.indexOf('/') === 0 ? (
                kirk.condition5 ? (
                  kirk.condition5.indexOf('http') === 0 ? (
                    <a href={kirk.condition5} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition5.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition5
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition5
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition5
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition5.split('//')[1].split('/')[0].split('.')[0]
                          .length <
                        kirk.condition5
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition5
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition5
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition5}`}
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
                kirk.condition5
              ),
              <br key='br' />
            ]}

        {kirk.condition6 === ''
          ? ''
          : [
              kirk.condition6.indexOf('http') === 0 ||
              kirk.condition6.indexOf('/') === 0 ? (
                kirk.condition6 ? (
                  kirk.condition6.indexOf('http') === 0 ? (
                    <a href={kirk.condition6} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition6.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition6
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition6
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition6
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition6.split('//')[1].split('/')[0].split('.')[0]
                          .length <
                        kirk.condition6
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition6
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition6
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition6}`}
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
                kirk.condition6
              ),
              <br key='br' />
            ]}

        {kirk.condition7 === ''
          ? ''
          : [
              kirk.condition7.indexOf('http') === 0 ||
              kirk.condition7.indexOf('/') === 0 ? (
                kirk.condition7 ? (
                  kirk.condition7.indexOf('http') === 0 ? (
                    <a href={kirk.condition7} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition7.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition7
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition7
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition7
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition7.split('//')[1].split('/')[0].split('.')[0]
                          .length <
                        kirk.condition7
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition7
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition7
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition7}`}
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
                kirk.condition7
              ),
              <br key='br' />
            ]}

        {kirk.condition8 === ''
          ? ''
          : [
              kirk.condition8.indexOf('http') === 0 ||
              kirk.condition8.indexOf('/') === 0 ? (
                kirk.condition8 ? (
                  kirk.condition8.indexOf('http') === 0 ? (
                    <a href={kirk.condition8} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition8.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition8
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition8
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition8
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition8.split('//')[1].split('/')[0].split('.')[0]
                          .length <
                        kirk.condition8
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition8
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition8
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition8}`}
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
                kirk.condition8
              ),
              <br key='br' />
            ]}

        {kirk.condition9 === ''
          ? ''
          : [
              kirk.condition9.indexOf('http') === 0 ||
              kirk.condition9.indexOf('/') === 0 ? (
                kirk.condition9 ? (
                  kirk.condition9.indexOf('http') === 0 ? (
                    <a href={kirk.condition9} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition9.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition9
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition9
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition9
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition9.split('//')[1].split('/')[0].split('.')[0]
                          .length <
                        kirk.condition9
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition9
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition9
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition9}`}
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
                kirk.condition9
              ),
              <br key='br' />
            ]}

        {kirk.condition10 === ''
          ? ''
          : [
              kirk.condition10.indexOf('http') === 0 ||
              kirk.condition10.indexOf('/') === 0 ? (
                kirk.condition10 ? (
                  kirk.condition10.indexOf('http') === 0 ? (
                    <a href={kirk.condition10} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition10.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition10
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition10
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition10
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition10
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[0].length <
                        kirk.condition10
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition10
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition10
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition10}`}
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
                kirk.condition10
              ),
              <br key='br' />
            ]}

        {kirk.condition11 === ''
          ? ''
          : [
              kirk.condition11.indexOf('http') === 0 ||
              kirk.condition11.indexOf('/') === 0 ? (
                kirk.condition11 ? (
                  kirk.condition11.indexOf('http') === 0 ? (
                    <a href={kirk.condition11} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition11.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition11
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition11
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition11
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition11
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[0].length <
                        kirk.condition11
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition11
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition11
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition11}`}
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
                kirk.condition11
              ),
              <br key='br' />
            ]}
        {kirk.condition12 === ''
          ? ''
          : [
              kirk.condition12.indexOf('http') === 0 ||
              kirk.condition12.indexOf('/') === 0 ? (
                kirk.condition12 ? (
                  kirk.condition12.indexOf('http') === 0 ? (
                    <a href={kirk.condition12} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition12.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition12
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition12
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition12
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition12
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[0].length <
                        kirk.condition12
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition12
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition12
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition12}`}
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
                kirk.condition12
              ),
              <br key='br' />
            ]}

        {kirk.condition13 === ''
          ? ''
          : [
              kirk.condition13.indexOf('http') === 0 ||
              kirk.condition13.indexOf('/') === 0 ? (
                kirk.condition13 ? (
                  kirk.condition13.indexOf('http') === 0 ? (
                    <a href={kirk.condition13} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition13.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition13
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition13
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition13
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition13
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[0].length <
                        kirk.condition13
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition13
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition13
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition13}`}
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
                kirk.condition13
              ),
              <br key='br' />
            ]}
        {kirk.condition14 === ''
          ? ''
          : [
              kirk.condition14.indexOf('http') === 0 ||
              kirk.condition14.indexOf('/') === 0 ? (
                kirk.condition14 ? (
                  kirk.condition14.indexOf('http') === 0 ? (
                    <a href={kirk.condition14} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition14.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition14
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition14
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition14
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition14
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[0].length <
                        kirk.condition14
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition14
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition14
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition14}`}
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
                kirk.condition14
              ),
              <br key='br' />
            ]}

        {kirk.condition15 === ''
          ? ''
          : [
              kirk.condition15.indexOf('http') === 0 ||
              kirk.condition15.indexOf('/') === 0 ? (
                kirk.condition15 ? (
                  kirk.condition15.indexOf('http') === 0 ? (
                    <a href={kirk.condition15} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition15.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition15
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition15
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition15
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition15
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[0].length <
                        kirk.condition15
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition15
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition15
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition15}`}
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
                kirk.condition15
              ),
              <br key='br' />
            ]}

        {kirk.condition16 === ''
          ? ''
          : [
              kirk.condition16.indexOf('http') === 0 ||
              kirk.condition16.indexOf('/') === 0 ? (
                kirk.condition16 ? (
                  kirk.condition16.indexOf('http') === 0 ? (
                    <a href={kirk.condition16} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition16.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition16
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition16
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition16
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition16
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[0].length <
                        kirk.condition16
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition16
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition16
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition16}`}
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
                kirk.condition16
              ),
              <br key='br' />
            ]}

        {kirk.condition17 === ''
          ? ''
          : [
              kirk.condition17.indexOf('http') === 0 ||
              kirk.condition17.indexOf('/') === 0 ? (
                kirk.condition17 ? (
                  kirk.condition17.indexOf('http') === 0 ? (
                    <a href={kirk.condition17} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition17.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition17
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition17
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition17
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition17
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[0].length <
                        kirk.condition17
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition17
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition17
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition17}`}
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
                kirk.condition17
              ),
              <br key='br' />
            ]}

        {kirk.condition18 === ''
          ? ''
          : [
              kirk.condition18.indexOf('http') === 0 ||
              kirk.condition18.indexOf('/') === 0 ? (
                kirk.condition18 ? (
                  kirk.condition18.indexOf('http') === 0 ? (
                    <a href={kirk.condition18} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition18.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition18
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition18
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition18
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition18
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[0].length <
                        kirk.condition18
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition18
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition18
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition18}`}
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
                kirk.condition18
              ),
              <br key='br' />
            ]}

        {kirk.condition19 === ''
          ? ''
          : [
              kirk.condition19.indexOf('http') === 0 ||
              kirk.condition19.indexOf('/') === 0 ? (
                kirk.condition19 ? (
                  kirk.condition19.indexOf('http') === 0 ? (
                    <a href={kirk.condition19} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition19.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition19
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition19
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition19
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition19
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[0].length <
                        kirk.condition19
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition19
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition19
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition19}`}
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
                kirk.condition19
              ),
              <br key='br' />
            ]}

        {kirk.condition20 === ''
          ? ''
          : [
              kirk.condition20.indexOf('http') === 0 ||
              kirk.condition20.indexOf('/') === 0 ? (
                kirk.condition20 ? (
                  kirk.condition20.indexOf('http') === 0 ? (
                    <a href={kirk.condition20} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.condition20.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {
                            kirk.condition20
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : kirk.condition20
                          .split('//')[1]
                          .split('/')[0]
                          .split('.').length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {
                            kirk.condition20
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.condition20
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[0].length <
                        kirk.condition20
                          .split('//')[1]
                          .split('/')[0]
                          .split('.')[1].length ? (
                        <span>
                          {
                            kirk.condition20
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[1]
                          }
                        </span>
                      ) : (
                        <span>
                          {
                            kirk.condition20
                              .split('//')[1]
                              .split('/')[0]
                              .split('.')[0]
                          }
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.condition20}`}
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
                kirk.condition20
              ),
              <br key='br' />
            ]}

        {kirk.data === ''
          ? ''
          : [
              kirk.data.indexOf('http') === 0 ||
              kirk.data.indexOf('/') === 0 ? (
                kirk.data ? (
                  kirk.data.indexOf('http') === 0 ? (
                    <a href={kirk.data} target='_blank' rel='noreferrer'>
                      {0 ? (
                        <span className='fa fa-link'></span>
                      ) : kirk.data.indexOf('www') !== -1 ? (
                        // If the first word is 'www', use the second word
                        <span>
                          {kirk.data.split('//')[1].split('/')[0].split('.')[1]}
                        </span>
                      ) : kirk.data.split('//')[1].split('/')[0].split('.')
                          .length === 2 ? (
                        // otherwise and if domain consists of 2 words, use the first word
                        <span>
                          {kirk.data.split('//')[1].split('/')[0].split('.')[0]}
                        </span>
                      ) : // otherwise use whichever is longer among the first and second words
                      kirk.data.split('//')[1].split('/')[0].split('.')[0]
                          .length <
                        kirk.data.split('//')[1].split('/')[0].split('.')[1]
                          .length ? (
                        <span>
                          {kirk.data.split('//')[1].split('/')[0].split('.')[1]}
                        </span>
                      ) : (
                        <span>
                          {kirk.data.split('//')[1].split('/')[0].split('.')[0]}
                        </span>
                      )}
                    </a>
                  ) : (
                    <a
                      href={`file:${kirk.data}`}
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
                <code>{kirk.data}</code>
              )
            ]}

        {kirk.unit + ' '}
        {/* {auth.id === kirk.user ? (
          <Button
            outline
            color='danger'
            disabled={isUpdating} // 2023.11.18
            onClick={() => {
              if (window.confirm('Are you sure?')) deleteKirk(kirk._id);
            }}
          >
            <span className='fa fa-times'></span>
          </Button>
        ) : (
          <span></span>
        )} */}
      </ListGroupItem>
    </ListGroup>
    //   </div>
    // </div>
  );
}

export let num;

export default function ListKirkPro (props) {
  const [currentPage, setCurrentPage] = useState(1);
  const [kirkListPerPage] = useState(1000);

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
      exwords.push(exwords_temp);
    }

    var foundKirks = [];
    for (let i = 0; i < keywords.length; i++) {
      //     for (let j = 0; j < keywords[i].length; j++) {
      const foundKirks_temp = props.kirks.filter(curr => {
        const test = keywords[i].map(
          keyword =>
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
        return test.every(logic => logic === true);
      });
      foundKirks = foundKirks.concat(foundKirks_temp);
      //     }
    }

    var foundKirks2 = [];
    for (let i = 0; i < exwords.length; i++) {
      //     for (let j = 0; j < keywords[i].length; j++) {
      const foundKirks2_temp = foundKirks.filter(curr => {
        const test = exwords[i].map(
          exword =>
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
        return test.every(logic => logic === false);
      });
      foundKirks2 = foundKirks2.concat(foundKirks2_temp);
      //     }
      props.kirks.sort((a, b) => {
        return a._id.localeCompare(b._id);
      });
    }

    // foundKirks2.sort((a, b) => {
    //   return a._id.localeCompare(b._id);
    // });

    // function onlyUnique (value, index, array) {
    //   return array.indexOf(value) === index;
    // }
    // foundKirks2 = foundKirks2.filter(onlyUnique);

    const csvData = foundKirks2;

    const kirkList = foundKirks2.map(kirk => {
      return (
        <div key={kirk._id}>
          <RenderKirkItem
            kirk={kirk}
            deleteKirk={props.deleteKirk}
            updateKirk={props.updateKirk}
            resetKirkForm={props.resetKirkForm}
            auth={props.auth} // added on 2022.12.13
            isUpdating={props.isUpdating}
          />
        </div>
      );
    });

    num = kirkList.length;
    // props.getKirkNum2(num);

    // console.log('number of kirks found is ', num);
    // setKirkNum(num);
    // props.getKirkNum2(num);
    // setKirkNum2(num);

    // Get current posts
    const indexOfLastKirkList = currentPage * kirkListPerPage;
    const indexOfFirstKirkList = indexOfLastKirkList - kirkListPerPage;
    const currentKirkList = kirkList
      .reverse()
      .slice(indexOfFirstKirkList, indexOfLastKirkList);

    return (
      <div>
        <Card>
          <Row className='form-group'>
            <Col>
              <CardBody>
                <div className='row'>
                  <div className='col-6'>
                    <h5>{num} items</h5>
                  </div>
                  <div className='col-6'>
                    <CSVLink
                      data={csvData}
                      className='fa fa-arrow-down'
                    ></CSVLink>
                  </div>
                </div>
                {currentKirkList}
                {/* {kirkList.reverse()} */}
              </CardBody>
            </Col>
          </Row>
        </Card>
        <Pagination
          inputListPerPage={kirkListPerPage}
          totalInputList={kirkList.length}
          paginate={paginate}
        />
      </div>
    );
  } else if (props.kirks !== null) {
    const kirkList = props.kirks.map(kirk => {
      return (
        <div key={kirk._id}>
          <RenderKirkItem
            kirk={kirk}
            deleteKirk={props.deleteKirk}
            updateKirk={props.updateKirk}
            resetKirkForm={props.resetKirkForm}
            auth={props.auth}
            isUpdating={props.isUpdating}
          />
        </div>
      );
    });

    num = kirkList.length;
    // props.getKirkNum2(num);
    // setKirkNum(num);
    // props.getKirkNum(num);
    // props.getKirkNum2(num);
    // setKirkNum2(num);

    const csvData = props.kirks;

    // Get current posts
    const indexOfLastKirkList = currentPage * kirkListPerPage;
    const indexOfFirstKirkList = indexOfLastKirkList - kirkListPerPage;
    const currentKirkList = kirkList
      .reverse()
      .slice(indexOfFirstKirkList, indexOfLastKirkList);

    return (
      <div>
        <Card>
          <Row className='form-group'>
            <Col>
              <CardBody>
                <div className='row'>
                  <div className='col-6'>
                    <h5>{num} items</h5>
                  </div>
                  <div className='col-6'>
                    <CSVLink
                      data={csvData}
                      className='fa fa-arrow-down'
                    ></CSVLink>
                  </div>
                </div>
                {currentKirkList}
                {/* {kirkList.reverse()} */}
              </CardBody>
            </Col>
          </Row>
        </Card>
        <Pagination
          inputListPerPage={kirkListPerPage}
          totalInputList={kirkList.length}
          paginate={paginate}
        />
      </div>
    );
  } else {
    return <div></div>;
  }
}

// export default ListKirk;
