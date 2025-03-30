/* eslint-disable react/jsx-pascal-case */
import React from 'react';
import { useState } from 'react';
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
  ModalBody
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
        value.condition,
        value.data,
        value.unit
        // value.work,
        // value.news,
        // value.buy,
        // value.utilities,
        // // value.symptoms,
        // value.events,
        // value.health,
        // value.foods,
        // value.invests
      );
      // resetKirkForm();
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
          <ModalHeader toggle={toggleModal}>Update Kirk</ModalHeader>
          <ModalBody>
            <Form onSubmit={handleSubmit} model='input'>
              <Row className='form-group mb-2'>
                <Label htmlFor='date'>date</Label>
                <Control.text
                  model='.date'
                  id='date'
                  name='date'
                  defaultValue={kirk.date}
                  className='form-control'
                />
                {/* </Row>
              <Row className="form-group mb-2"> */}
                <Label htmlFor='place'>place</Label>
                <Control.text
                  model='.place'
                  id='place'
                  name='place'
                  defaultValue={kirk.place}
                  className='form-control'
                />
              </Row>
              <Row className='form-group mb-2'>
                <Label htmlFor='person'>person</Label>
                <Control.text
                  model='.person'
                  id='person'
                  name='person'
                  defaultValue={kirk.person}
                  className='form-control'
                />
              </Row>
              <Row className='form-group mb-2'>
                <Label htmlFor='subject'>subject</Label>
                <Control.text
                  model='.subject'
                  id='subject'
                  name='subject'
                  defaultValue={kirk.subject}
                  className='form-control'
                />
              </Row>
              <Row className='form-group mb-2'>
                <Label htmlFor='reason'>reason</Label>
                <Control.textarea
                  model='.reason'
                  id='reason'
                  name='reason'
                  defaultValue={kirk.reason}
                  className='form-control'
                />
              </Row>
              <Row className='form-group mb-2'>
                <Label htmlFor='condition'>condition</Label>
                <Control.textarea
                  model='.condition'
                  id='condition'
                  name='condition'
                  defaultValue={kirk.condition}
                  className='form-control'
                />
              </Row>
              <Row className='form-group mb-2'>
                <Label htmlFor='data'>data</Label>
                <Control.text
                  model='.data'
                  id='data'
                  name='data'
                  defaultValue={kirk.data}
                  className='form-control'
                />
                <Label htmlFor='unit'>unit</Label>
                <Control.text
                  model='.unit'
                  id='unit'
                  name='unit'
                  defaultValue={kirk.unit}
                  className='form-control'
                />
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
                          .length === 2 || 1 ? (
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
        {/* {kirk.reason === '' ? '' : [kirk.reason, <br key='br' />]} */}
        {!kirk.reason ? (
          ''
        ) : (
          <div dangerouslySetInnerHTML={{ __html: kirk.reason }} />
        )}
        {!kirk.condition ? (
          ''
        ) : (
          <div dangerouslySetInnerHTML={{ __html: kirk.condition }} />
        )}
        {/* {kirk.data !== undefined ? (
          kirk.data.indexOf('http') === 0 ? (
            kirk.data ? (
              <a href={kirk.data} target='_blank' rel='noreferrer'>
                <span className='fa fa-link' style={{ color: 'crimson' }} />
              </a>
            ) : (
              ''
            )
          ) : (
            <code>{kirk.data}</code>
          )
        ) : (
          <code>{kirk.data}</code>
        )} */}
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
                          .length === 2 || 1 ? (
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

export default function ListKirk2 (props) {
  // const [kirkNum2, setKirkNum2] = useState(0);

  // props.getKirkNum2(num);

  // useEffect(() => {
  //   // code to run after render goes here
  //   // props.getKirkNum2(kirkNum2);
  //   console.log('you are in useEffect');
  // });

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
    for (let k = 0; k < keywordAndArray.length; k++) {
      let keywordArray = keywordAndArray[k].split(/(\s+)/);
      var keywords_temp = [];
      let j = 0;
      for (let i = 0; i < keywordArray.length; i++) {
        if ((keywordArray[i] !== ' ') & (keywordArray[i] !== '')) {
          keywords_temp[j] = keywordArray[i].toLowerCase();
          j = j + 1;
        }
      }
      keywords.push(keywords_temp);
    }

    var foundKirks2 = [];
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
            curr.condition.toLowerCase().includes(keyword) ||
            curr.data.toLowerCase().includes(keyword) ||
            curr.unit.toLowerCase().includes(keyword)
        );
        return test.every(logic => logic === true);
      });
      foundKirks2 = foundKirks2.concat(foundKirks_temp);
      //     }
    }

    foundKirks2.sort((a, b) => {
      return a._id.localeCompare(b._id);
    });

    function onlyUnique (value, index, array) {
      return array.indexOf(value) === index;
    }
    foundKirks2 = foundKirks2.filter(onlyUnique);

    // const keywordArray = props.keyword.split(/(\s+)/);
    // var keywords = [];
    // let j = 0;
    // for (let i = 0; i < keywordArray.length; i++) {
    //   if (keywordArray[i] !== ' ') {
    //     keywords[j] = keywordArray[i].toLowerCase();
    //     j = j + 1;
    //   }
    // }
    // console.log('keywords is ', keywords);

    // const foundKirks2 = props.kirks.filter((curr) => {
    //   const test = keywords.map(
    //     (keyword) =>
    //       curr.date.toLowerCase().includes(keyword) ||
    //       curr.place.toLowerCase().includes(keyword) ||
    //       curr.person.toLowerCase().includes(keyword) ||
    //       curr.subject.toLowerCase().includes(keyword) ||
    //       curr.reason.toLowerCase().includes(keyword) ||
    //       curr.condition.toLowerCase().includes(keyword) ||
    //       curr.data.toLowerCase().includes(keyword) ||
    //       curr.unit.toLowerCase().includes(keyword)
    //   );
    //   return test.every((logic) => logic === true);
    //   // return test.some((logic) => logic === true);
    // });

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
