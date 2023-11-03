/* eslint-disable react/jsx-pascal-case */
import React, { useEffect, Fragment } from 'react';
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
  ModalBody,
  Table,
} from 'reactstrap';
import { ListGroup, ListGroupItem } from 'reactstrap';
import { Loading } from './LoadingComponent';
import { Control, Form } from 'react-redux-form';
// import { fetchInputs } from '../redux/ActionCreators';
// import { fetchKirks, fetchInputs } from '../redux/ActionCreators';
import { CSVLink, CSVDownload } from 'react-csv';
import Pagination from './Pagination';

function RenderInputTable({
  input,
  deleteInput,
  updateInput,
  resetInputForm,
  auth,
}) {
  const [isOpen, setIsOpen] = useState(false);
  // const classNameForEditAndDelete = this.props.isMobile ? '' : 'sticky-td';
  const [isMobile, setIsMobile] = useState(window.innerWidth < 1200);

  {
    /* Performs similarly to componentDidMount in classes */
  }
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

  console.log('isMobile: ', isMobile);

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
      resetInputForm();
    }
  };

  return (
    <tr>
      <Modal
        isOpen={isOpen}
        toggle={toggleModal}
        size="lg"
        style={{ maxWidth: '1000px', width: '100%' }}
      >
        <ModalHeader toggle={toggleModal}>Update Input</ModalHeader>
        <ModalBody>
          <Form onSubmit={handleSubmit} model="input">
            <Row className="form-group mb-2">
              <Label htmlFor="date">date</Label>
              <Control.text
                model=".date"
                id="date"
                name="date"
                defaultValue={input.date}
                className="form-control"
              />
            </Row>
            <Row className="form-group mb-2">
              <Label htmlFor="place">place</Label>
              <Control.text
                model=".place"
                id="place"
                name="place"
                defaultValue={input.place}
                className="form-control"
              />
            </Row>
            <Row className="form-group mb-2">
              <Label htmlFor="person">person</Label>
              <Control.text
                model=".person"
                id="person"
                name="person"
                defaultValue={input.person}
                className="form-control"
              />
            </Row>
            <Row className="form-group mb-2">
              <Label htmlFor="subject">subject</Label>
              <Control.text
                model=".subject"
                id="subject"
                name="subject"
                defaultValue={input.subject}
                className="form-control"
              />
            </Row>
            <Row className="form-group mb-2">
              <Label htmlFor="reason">reason</Label>
              <Control.textarea
                model=".reason"
                id="reason"
                name="reason"
                defaultValue={input.reason}
                className="form-control"
              />
            </Row>
            <Row className="form-group mb-2">
              <Label htmlFor="condition">condition</Label>
              <Control.textarea
                model=".condition"
                id="condition"
                name="condition"
                defaultValue={input.condition}
                className="form-control"
              />
            </Row>
            <Row className="form-group mb-2">
              <Label htmlFor="data">data</Label>
              <Control.text
                model=".data"
                id="data"
                name="data"
                defaultValue={input.data}
                className="form-control"
              />
              {/* </Row>
              <Row className="form-group mb-2"> */}
              <Label htmlFor="unit">unit</Label>
              <Control.text
                model=".unit"
                id="unit"
                name="unit"
                defaultValue={input.unit}
                className="form-control"
              />
            </Row>
            <Button type="submit" value="submit" color="primary">
              Submit
            </Button>
          </Form>
        </ModalBody>
      </Modal>

      {/* <td className={classNameForEditAndDelete}> */}

      <td className={`${isMobile ? '' : 'sticky-td'}`}>
        {/* <td className="sticky-td"> */}
        {auth.id === input.user ? (
          <Button outline color="primary" onClick={toggleModal}>
            <span className="fa fa-edit"></span>
          </Button>
        ) : (
          <Button outline color="secondary">
            <span className="fa fa-edit"></span>
          </Button>
        )}
      </td>
      <td>{input.date}</td>
      {/* <td class="text text-truncate"> */}
      <td>
        {input.place.indexOf('http') === 0 || input.place.indexOf('/') === 0 ? (
          input.place ? (
            input.place.indexOf('http') === 0 ? (
              <a href={input.place} target="_blank" rel="noreferrer">
                <span className="fa fa-link"></span>
              </a>
            ) : (
              <a href={`file:${input.place}`} target="_blank" rel="noreferrer">
                <span className="fa fa-folder-open"></span>
              </a>
            )
          ) : (
            ''
          )
        ) : (
          <span>{input.place}</span>
        )}
      </td>
      <td>{input.person}</td>
      <td>
        <b>{input.subject}</b>
      </td>
      <td>{input.reason}</td>
      <td>{input.condition}</td>
      <td>
        {input.data.indexOf('http') === 0 ? (
          input.data ? (
            <a href={input.data} target="_blank" rel="noreferrer">
              {/* <span className="fa fa-link" color="pink"></span> */}
              <span className="fa fa-link" style={{ color: 'crimson' }} />
            </a>
          ) : (
            ''
          )
        ) : (
          <code>{input.data}</code>
        )}
      </td>
      <td>{input.unit}</td>
      <td className={`${isMobile ? '' : 'sticky-td'}`}>
        {/* <td className="sticky-td"> */}
        {auth.id === input.user ? (
          <Button
            outline
            color="danger"
            onClick={() => {
              if (window.confirm('Are you sure?')) deleteInput(input._id);
            }}
          >
            <span className="fa fa-times"></span>
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
console.log('input_num in ListData is ', input_num);

export default function ListData(props) {
  // const searchDone = (display) => {
  //   setDisplay(display);
  // };

  const [isDateAscending, setIsDateAscending] = useState(true);
  const [isPlaceAscending, setIsPlaceAscending] = useState(true);
  const [isPersonAscending, setIsPersonAscending] = useState(true);
  const [isSubjectAscending, setIsSubjectAscending] = useState(true);
  const [isReasonAscending, setIsReasonAscending] = useState(true);
  const [isConditionAscending, setIsConditionAscending] = useState(true);
  const [isDataAscending, setIsDataAscending] = useState(true);
  const [isUnitAscending, setIsUnitAscending] = useState(true);
  const [isAnyFieldBtnPushed, setIsAnyFieldBtnPushed] = useState(false);
  const [isKeywordChanged, setIsKeywordChanged] = useState(true);

  const [isDateBtnPushed, setIsDateBtnPushed] = useState(false);
  const [isPlaceBtnPushed, setIsPlaceBtnPushed] = useState(false);
  const [isPersonBtnPushed, setIsPersonBtnPushed] = useState(false);
  const [isSubjectBtnPushed, setIsSubjectBtnPushed] = useState(false);
  const [isReasonBtnPushed, setIsReasonBtnPushed] = useState(false);
  const [isConditionBtnPushed, setIsConditionBtnPushed] = useState(false);
  const [isDataBtnPushed, setIsDataBtnPushed] = useState(false);
  const [isUnitBtnPushed, setIsUnitBtnPushed] = useState(false);

  const [currentPage, setCurrentPage] = useState(1);
  const [inputListPerPage] = useState(1000);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  // const toggleSort = () => {
  //   setIsAscending(!isAscending);
  //   console.log('isAscending is now ', isAscending);

  //   if (isAscending === false) {
  //     props.inputs.sort((a, b) => {
  //       return a.subject.localeCompare(b.subject);
  //     });
  //   } else {
  //     props.inputs.reverse((a, b) => {
  //       return a.subject.localeCompare(b.subject).reverse();
  //     });
  //   }
  // };

  if (props.isLoading) {
    return (
      <div className="container">
        <div className="row">
          <Loading />
        </div>
      </div>
    );
  } else if (props.errMess) {
    return (
      <div className="container">
        <div className="row">
          <h4>{props.errMess}</h4>
        </div>
      </div>
    );
  } else if (props.keyword !== '') {
    console.log('you are in keyword');
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
      exwords.push(exwords_temp);
    }
    console.log(`keywords is ${keywords}`);
    console.log(`exwords is ${exwords}`);
    var foundInputs = [];
    for (let i = 0; i < keywords.length; i++) {
      //     for (let j = 0; j < keywords[i].length; j++) {
      const foundInputs_temp = props.inputs.filter((curr) => {
        const test = keywords[i].map(
          (keyword) =>
            curr.date.toLowerCase().includes(keyword) ||
            curr.place.toLowerCase().includes(keyword) ||
            curr.person.toLowerCase().includes(keyword) ||
            curr.subject.toLowerCase().includes(keyword) ||
            curr.reason.toLowerCase().includes(keyword) ||
            curr.condition.toLowerCase().includes(keyword) ||
            curr.data.toLowerCase().includes(keyword) ||
            curr.unit.toLowerCase().includes(keyword)
        );
        return test.every((logic) => logic === true);
      });
      foundInputs = foundInputs.concat(foundInputs_temp);
      //     }
    }
    var foundInputs2 = [];
    for (let i = 0; i < exwords.length; i++) {
      //     for (let j = 0; j < keywords[i].length; j++) {
      const foundInputs2_temp = foundInputs.filter((curr) => {
        const test = exwords[i].map(
          (exword) =>
            curr.date.toLowerCase().includes(exword) ||
            curr.place.toLowerCase().includes(exword) ||
            curr.person.toLowerCase().includes(exword) ||
            curr.subject.toLowerCase().includes(exword) ||
            curr.reason.toLowerCase().includes(exword) ||
            curr.condition.toLowerCase().includes(exword) ||
            curr.data.toLowerCase().includes(exword) ||
            curr.unit.toLowerCase().includes(exword)
        );
        return test.every((logic) => logic === false);
      });
      foundInputs2 = foundInputs2.concat(foundInputs2_temp);
      //     }
    }

    // 2023.5.5
    // Field buttons didn't work upon listing search result because it is always
    // overwritten by the sort here. So added this condition to not execute it
    // if one of the buttons are being pushed

    console.log('isAnyFieldBtnPushed is ', isAnyFieldBtnPushed);
    console.log('isPlaceAscending is ', isPlaceAscending);

    if (!isAnyFieldBtnPushed) {
      props.inputs.sort((a, b) => {
        return a._id.localeCompare(b._id);
      });
    } else {
      if (isDateBtnPushed) {
        const conv = (inputDate) => {
          let day = inputDate
            .split(' ')
            .find((element) => element.includes('-'));
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

          const time = inputDate
            .split(' ')
            .find((element) => element.includes(':'));

          return day;
        };
        if (isDateAscending === false) {
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
      } else if (isPlaceBtnPushed) {
        if (isPlaceAscending === false) {
          props.inputs.sort((a, b) => {
            return a.place.localeCompare(b.place);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b.place.localeCompare(a.place);
          });
        }
        // setIsPlaceBtnPushed(false);
      } else if (isPersonBtnPushed) {
        if (isPersonAscending === false) {
          props.inputs.sort((a, b) => {
            return a.person.localeCompare(b.person);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b.person.localeCompare(a.person);
          });
        }
        // setIsPersonBtnPushed(false);
      } else if (isSubjectBtnPushed) {
        if (isSubjectAscending === false) {
          props.inputs.sort((a, b) => {
            return a.subject.localeCompare(b.subject);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b.subject.localeCompare(a.subject);
          });
        }
        // setIsSubjectBtnPushed(false);
      } else if (isReasonBtnPushed) {
        if (isReasonAscending === false) {
          props.inputs.sort((a, b) => {
            return a.reason.localeCompare(b.reason);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b.reason.localeCompare(a.reason);
          });
        }
      } else if (isConditionBtnPushed) {
        if (isConditionAscending === false) {
          props.inputs.sort((a, b) => {
            return a.condition.localeCompare(b.condition);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b.condition.localeCompare(a.condition);
          });
        }
      } else if (isDataBtnPushed) {
        if (isDataAscending === false) {
          props.inputs.sort((a, b) => {
            // foundInputs2.sort((a, b) => {
            return a.data
              .replaceAll(',', '')
              .localeCompare(b.data.replaceAll(',', ''), undefined, {
                numeric: true,
              });
          });
        } else {
          props.inputs.reverse((a, b) => {
            // foundInputs2.reverse((a, b) => {
            return a.data
              .replaceAll(',', '')
              .localeCompare(b.data.replaceAll(',', ''), undefined, {
                numeric: true,
              })
              .reverse();
          });
        }
      } else if (isUnitBtnPushed) {
        if (isUnitAscending === false) {
          props.inputs.sort((a, b) => {
            return a.unit.localeCompare(b.unit);
          });
        } else {
          props.inputs.sort((a, b) => {
            return b.unit.localeCompare(a.unit);
          });
        }
      }
    }

    function onlyUnique(value, index, array) {
      return array.indexOf(value) === index;
    }
    foundInputs2 = foundInputs2.filter(onlyUnique);

    const csvData = foundInputs2;

    const inputList = foundInputs2.map((input) => {
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
          />
          {/* </div> */}
        </Fragment>
      );
    });

    const toggleDateSort = async () => {
      setIsDateAscending(!isDateAscending);
      setIsAnyFieldBtnPushed(true);
      setIsDateBtnPushed(true);
      setIsPlaceBtnPushed(false);
      setIsPersonBtnPushed(false);
      setIsSubjectBtnPushed(false);
      setIsReasonBtnPushed(false);
      setIsConditionBtnPushed(false);
      setIsDataBtnPushed(false);
      setIsUnitBtnPushed(false);
    };

    const togglePlaceSort = () => {
      setIsPlaceAscending(!isPlaceAscending);
      setIsAnyFieldBtnPushed(true);
      setIsDateBtnPushed(false);
      setIsPlaceBtnPushed(true);
      setIsPersonBtnPushed(false);
      setIsSubjectBtnPushed(false);
      setIsReasonBtnPushed(false);
      setIsConditionBtnPushed(false);
      setIsDataBtnPushed(false);
      setIsUnitBtnPushed(false);
    };

    const togglePersonSort = () => {
      setIsPersonAscending(!isPersonAscending);
      setIsAnyFieldBtnPushed(true);
      setIsDateBtnPushed(false);
      setIsPlaceBtnPushed(false);
      setIsPersonBtnPushed(true);
      setIsSubjectBtnPushed(false);
      setIsReasonBtnPushed(false);
      setIsConditionBtnPushed(false);
      setIsDataBtnPushed(false);
      setIsUnitBtnPushed(false);
    };

    const toggleSubjectSort = () => {
      setIsSubjectAscending(!isSubjectAscending);
      setIsAnyFieldBtnPushed(true);
      setIsDateBtnPushed(false);
      setIsPlaceBtnPushed(false);
      setIsPersonBtnPushed(false);
      setIsSubjectBtnPushed(true);
      setIsReasonBtnPushed(false);
      setIsConditionBtnPushed(false);
      setIsDataBtnPushed(false);
      setIsUnitBtnPushed(false);
    };

    const toggleReasonSort = () => {
      setIsReasonAscending(!isReasonAscending);
      setIsAnyFieldBtnPushed(true);
      setIsDateBtnPushed(false);
      setIsPlaceBtnPushed(false);
      setIsPersonBtnPushed(false);
      setIsSubjectBtnPushed(false);
      setIsReasonBtnPushed(true);
      setIsConditionBtnPushed(false);
      setIsDataBtnPushed(false);
      setIsUnitBtnPushed(false);
    };

    const toggleConditionSort = () => {
      setIsConditionAscending(!isConditionAscending);
      setIsAnyFieldBtnPushed(true);
      setIsDateBtnPushed(false);
      setIsPlaceBtnPushed(false);
      setIsPersonBtnPushed(false);
      setIsSubjectBtnPushed(false);
      setIsReasonBtnPushed(false);
      setIsConditionBtnPushed(true);
      setIsDataBtnPushed(false);
      setIsUnitBtnPushed(false);
    };

    const toggleDataSort = () => {
      setIsDataAscending(!isDataAscending);
      setIsAnyFieldBtnPushed(true);
      setIsDateBtnPushed(false);
      setIsPlaceBtnPushed(false);
      setIsPersonBtnPushed(false);
      setIsSubjectBtnPushed(false);
      setIsReasonBtnPushed(false);
      setIsConditionBtnPushed(false);
      setIsDataBtnPushed(true);
      setIsUnitBtnPushed(false);
    };

    const toggleUnitSort = () => {
      setIsUnitAscending(!isUnitAscending);
      setIsAnyFieldBtnPushed(true);
      setIsDateBtnPushed(false);
      setIsPlaceBtnPushed(false);
      setIsPersonBtnPushed(false);
      setIsSubjectBtnPushed(false);
      setIsReasonBtnPushed(false);
      setIsConditionBtnPushed(false);
      setIsDataBtnPushed(false);
      setIsUnitBtnPushed(true);
    };

    input_num = inputList.length;
    console.log('number of inputs found is ', input_num);

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
          <Row className="form-group">
            <Col>
              <CardBody>
                <div className="row">
                  <div className="col-6">
                    <h5>{input_num} items</h5>
                  </div>
                  <div className="col-6">
                    <CSVLink
                      data={csvData}
                      className="fa fa-arrow-down"
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
                          color="secondary"
                          onClick={toggleDateSort}
                        >
                          date
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={togglePlaceSort}
                        >
                          place
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={togglePersonSort}
                        >
                          person
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={toggleSubjectSort}
                        >
                          subject
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={toggleReasonSort}
                        >
                          reason
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={toggleConditionSort}
                        >
                          condition
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={toggleDataSort}
                        >
                          data
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={toggleUnitSort}
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
  } else if (props.inputs !== null) {
    console.log('you are in inputs');
    console.log('keyword is ', props.keyword);

    // this.props.getDisplay(props.inputs);

    const inputList = props.inputs.map((input) => {
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
          />
          {/* </div> */}
        </Fragment>
      );
    });

    const toggleDateSort = async () => {
      const conv = (inputDate) => {
        let day = inputDate.split(' ').find((element) => element.includes('-'));
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

        const time = inputDate
          .split(' ')
          .find((element) => element.includes(':'));

        return day;
      };

      if (isDateAscending === false) {
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
      setIsDateAscending(!isDateAscending);
    };

    const togglePlaceSort = () => {
      setIsPlaceAscending(!isPlaceAscending);

      if (isPlaceAscending === false) {
        props.inputs.sort((a, b) => {
          return a.place.localeCompare(b.place);
        });
      } else {
        props.inputs.reverse((a, b) => {
          return a.place.localeCompare(b.place).reverse();
        });
      }
    };

    const togglePersonSort = () => {
      setIsPersonAscending(!isPersonAscending);

      if (isPersonAscending === false) {
        props.inputs.sort((a, b) => {
          return a.person.localeCompare(b.person);
        });
      } else {
        props.inputs.reverse((a, b) => {
          return a.person.localeCompare(b.person).reverse();
        });
      }
    };

    const toggleSubjectSort = () => {
      setIsSubjectAscending(!isSubjectAscending);

      if (isSubjectAscending === false) {
        props.inputs.sort((a, b) => {
          return a.subject.localeCompare(b.subject);
        });
      } else {
        props.inputs.reverse((a, b) => {
          return a.subject.localeCompare(b.subject).reverse();
        });
      }
    };

    const toggleReasonSort = () => {
      setIsReasonAscending(!isReasonAscending);

      if (isReasonAscending === false) {
        props.inputs.sort((a, b) => {
          return a.reason.localeCompare(b.reason);
        });
      } else {
        props.inputs.reverse((a, b) => {
          return a.reason.localeCompare(b.reason).reverse();
        });
      }
    };

    const toggleConditionSort = () => {
      setIsConditionAscending(!isConditionAscending);

      if (isConditionAscending === false) {
        props.inputs.sort((a, b) => {
          return a.condition.localeCompare(b.condition);
        });
      } else {
        props.inputs.reverse((a, b) => {
          return a.condition.localeCompare(b.condition).reverse();
        });
      }
    };

    const toggleDataSort = () => {
      setIsDataAscending(!isDataAscending);

      if (isDataAscending === false) {
        props.inputs.sort((a, b) => {
          return a.data.replaceAll(',', '').localeCompare(
            b.data.replaceAll(',', ''),
            // 'en-u-kn-true'
            undefined,
            { numeric: true }
            // { ignorePunctuation: true }
          );
        });
      } else {
        props.inputs.reverse((a, b) => {
          return a.data
            .replaceAll(',', '')
            .localeCompare(
              b.data.replaceAll(',', ''),
              // 'en-u-kn-true'
              undefined,
              { numeric: true }
              // { ignorePunctuation: true }
            )
            .reverse();
        });
      }
    };

    const toggleUnitSort = () => {
      setIsUnitAscending(!isUnitAscending);

      if (isUnitAscending === false) {
        props.inputs.sort((a, b) => {
          return a.unit.localeCompare(b.unit);
        });
      } else {
        props.inputs.reverse((a, b) => {
          return a.unit.localeCompare(b.unit).reverse();
        });
      }
    };

    input_num = inputList.length;
    console.log('number of inputs found is ', input_num);
    const csvData = props.inputs;

    // Get current posts
    const indexOfLastInputList = currentPage * inputListPerPage;
    const indexOfFirstInputList = indexOfLastInputList - inputListPerPage;
    const currentInputList = inputList
      .reverse()
      .slice(indexOfFirstInputList, indexOfLastInputList);

    return (
      <div class="table-responsive">
        <Card>
          <Row className="form-group">
            <Col>
              <CardBody>
                <div className="row">
                  <div className="col-6">
                    <h5>{input_num} items</h5>
                  </div>
                  <div className="col-6">
                    <CSVLink
                      data={csvData}
                      className="fa fa-arrow-down"
                    ></CSVLink>
                  </div>
                </div>
                <Table bordered responsive hover striped class="table">
                  <thead>
                    <tr>
                      <th></th> {/* for Edit */}
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={toggleDateSort}
                        >
                          date
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={togglePlaceSort}
                        >
                          place
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={togglePersonSort}
                        >
                          person
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={toggleSubjectSort}
                        >
                          subject
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={toggleReasonSort}
                        >
                          reason
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={toggleConditionSort}
                        >
                          condition
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={toggleDataSort}
                        >
                          data
                        </Button>
                      </th>
                      <th>
                        <Button
                          outline
                          color="secondary"
                          onClick={toggleUnitSort}
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
