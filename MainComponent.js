import React, { Component, useEffect } from 'react';
import ReactSearchBox from 'react-search-box';
import Kirk from './KirkComponent';
import Data from './DataComponent';
import Pro from './ProComponent';
import Header from './HeaderComponent';
import Graph from './GraphComponent';
import Chronicle from './ChronicleComponent';
import {
  Link,
  BrowserRouter,
  Routes,
  Route,
  Navigate,
  Redirect
} from 'react-router-dom';
import { connect } from 'react-redux';
import {
  postKirk,
  fetchKirks,
  loginUser,
  pwChangeUser,
  signupUser,
  deleteKirk,
  updateKirk,
  logoutUser,
  postInput,
  fetchInputs,
  deleteInput,
  updateInput,
  postProInput,
  fetchProInputs,
  deleteProInput,
  updateProInput,
  forgotPassword
  // showAll,
  // showMine,
  // getSearchWord,
  // updateKirkNum,
  // getKirkNum,
  // updateKirkNum,
} from '../redux/ActionCreators';
import { actions } from 'react-redux-form';
import ListKirk from './ListKirkComponent';
import ListKirk2 from './ListKirk2Component';
import ListKirkPro from './ListKirkProComponent';
import ListData from './ListDataComponent';
import ListProData from './ListProDataComponent';
import { foundKirks } from './SearchComponent';
import Forgot from './ForgotComponent';
import Reset from './ResetComponent';
import { TransitionGroup, CSSTransition } from 'react-transition-group';
// import * as ReactDOM from 'react-dom/client';

const mapStateToProps = state => {
  return {
    kirks: state.kirks,
    auth: state.auth,
    inputs: state.inputs,
    proInputs: state.proInputs
    // kirkNum: state.kirkNum,
  };
};

window.addEventListener('offline', e => {
  console.log('offline');
});

const mapDispatchToProps = dispatch => ({
  fetchKirks: () => {
    dispatch(fetchKirks());
  }, // This is a THUNK
  fetchInputs: () => {
    dispatch(fetchInputs());
  }, // This is a THUNK
  fetchProInputs: () => {
    dispatch(fetchProInputs());
  }, // This is a THUNK
  resetKirkForm: () => {
    dispatch(actions.reset('kirk'));
  }, // This is a THUNK
  resetInputForm: () => {
    dispatch(actions.reset('input'));
  }, // This is a THUNK
  resetProInputForm: () => {
    dispatch(actions.reset('proInput'));
  }, // This is a THUNK
  loginUser: creds => dispatch(loginUser(creds)),
  pwChangeUser: creds => dispatch(pwChangeUser(creds)),
  signupUser: creds => dispatch(signupUser(creds)),
  logoutUser: () => dispatch(logoutUser()),
  forgotPassword: email => dispatch(forgotPassword(email)),
  postKirk: (
    date,
    place,
    person,
    subject,
    reason,
    how,
    data,
    work,
    news,
    buy,
    utilities,
    // symptoms,
    events,
    health,
    foods,
    invests
  ) =>
    dispatch(
      postKirk(
        date,
        place,
        person,
        subject,
        reason,
        how,
        data,
        work,
        news,
        buy,
        utilities,
        // symptoms,
        events,
        health,
        foods,
        invests
      )
    ),
  postInput: (date, place, person, subject, reason, condition, data, unit) =>
    dispatch(
      postInput(date, place, person, subject, reason, condition, data, unit)
    ),
  postProInput: (
    date,
    place,
    person,
    subject,
    reason,
    condition1,
    condition2,
    condition3,
    condition4,
    condition5,
    condition6,
    condition7,
    condition8,
    condition9,
    condition10,
    condition11,
    condition12,
    condition13,
    condition14,
    condition15,
    condition16,
    condition17,
    condition18,
    condition19,
    condition20,
    data,
    unit
  ) =>
    dispatch(
      postProInput(
        date,
        place,
        person,
        subject,
        reason,
        condition1,
        condition2,
        condition3,
        condition4,
        condition5,
        condition6,
        condition7,
        condition8,
        condition9,
        condition10,
        condition11,
        condition12,
        condition13,
        condition14,
        condition15,
        condition16,
        condition17,
        condition18,
        condition19,
        condition20,
        data,
        unit
      )
    ),
  deleteKirk: kirkId => dispatch(deleteKirk(kirkId)),
  deleteInput: inputId => dispatch(deleteInput(inputId)),
  deleteProInput: proInputId => dispatch(deleteProInput(proInputId)),
  updateKirk: (
    kirkId,
    date,
    place,
    person,
    subject,
    reason,
    how,
    data,
    work,
    news,
    buy,
    utilities,
    // symptoms,
    events,
    health,
    foods,
    invests
  ) =>
    dispatch(
      updateKirk(
        kirkId,
        date,
        place,
        person,
        subject,
        reason,
        how,
        data,
        work,
        news,
        buy,
        utilities,
        // symptoms,
        events,
        health,
        foods,
        invests
      )
    ),
  updateInput: (
    inputId,
    date,
    place,
    person,
    subject,
    reason,
    condition,
    data,
    unit
  ) =>
    dispatch(
      updateInput(
        inputId,
        date,
        place,
        person,
        subject,
        reason,
        condition,
        data,
        unit
      )
    ),
  updateProInput: (
    inputId,
    date,
    place,
    person,
    subject,
    reason,
    condition1,
    condition2,
    condition3,
    condition4,
    condition5,
    condition6,
    condition7,
    condition8,
    condition9,
    condition10,
    condition11,
    condition12,
    condition13,
    condition14,
    condition15,
    condition16,
    condition17,
    condition18,
    condition19,
    condition20,
    data,
    unit
  ) =>
    dispatch(
      updateProInput(
        inputId,
        date,
        place,
        person,
        subject,
        reason,
        condition1,
        condition2,
        condition3,
        condition4,
        condition5,
        condition6,
        condition7,
        condition8,
        condition9,
        condition10,
        condition11,
        condition12,
        condition13,
        condition14,
        condition15,
        condition16,
        condition17,
        condition18,
        condition19,
        condition20,
        data,
        unit
      )
    )
});

class Main extends Component {
  constructor (props) {
    super(props);
    this.state = {
      keyword: '',
      showAll: true,
      view: true,
      display: []
      // refresh: false,
      // kirkNum2: 0,
    };
    this.getKeyword = this.getKeyword.bind(this);
    this.getShowAll = this.getShowAll.bind(this);
    this.getView = this.getView.bind(this);
    this.getDisplay = this.getDisplay.bind(this);
  }
  // a lifecycle method, will be called or will be executed just after this component gets mounted into the view of my application.
  componentDidMount () {
    this.props.fetchKirks();
    this.props.fetchInputs();
    this.props.fetchProInputs();
    // console.log('kirkNum on main is ', this.props.kirkNum);
    // window.addEventListener(
    //   'resize',
    //   () => {
    //     this.setState({
    //       isMobile: window.innerWidth < 1200,
    //     });
    //   },
    //   false
    // );
  }

  // componentDidUnmount() {
  //   this.props.dispatch(actions.reset('proInput'));
  // }

  getKeyword (keyword) {
    this.setState({
      keyword: keyword
    });
    // console.log('keyword on main is ', keyword);
    // console.log('this.state.keyword on main is ', this.state.keyword);
  }

  getShowAll (showAll) {
    // console.log('showAll on main is ', showAll);
    this.setState({ showAll: showAll });
  }

  getView (view) {
    // console.log('view on main is ', view);
    this.setState({ view: view });
  }

  getDisplay (display) {
    this.setState({ display: display });
  }

  render () {
    const ForgotPasswordPage = () => {
      return (
        <div>
          <Forgot forgotPassword={this.props.forgotPassword} />
        </div>
      );
    };
    const ResetPasswordPage = () => {
      return (
        <div>
          <Reset />
        </div>
      );
    };
    const KirkPage = () => {
      let myKirks = [];
      // console.log('showAll on main is ', this.props.showAll.value);
      // console.log('showAll on DataPage of main is ', this.state.showAll);
      for (let i = 0; i < this.props.kirks.kirks.length; i++) {
        if (this.state.showAll === true) {
          myKirks = this.props.kirks.kirks;
          break;
        } else if (this.props.kirks.kirks[i].user === this.props.auth.id) {
          myKirks.push(this.props.kirks.kirks[i]);
        } else {
          // meaning if the data is someone else's, go on next.
          continue;
        }
      }
      return (
        <div>
          <Kirk
            resetKirkForm={this.props.resetKirkForm}
            postKirk={this.props.postKirk}
            isUpdating={this.props.kirks.isUpdating} // 2023.11.18

            // fetchKirks={this.props.fetchKirks}
          />

          <div className='col-12 mt-3'>
            <ListKirk
              resetKirkForm={this.props.resetKirkForm}
              // kirks={this.props.kirks.kirks}
              kirks={myKirks}
              isLoading={this.props.kirks.isLoading}
              errMess={this.props.kirks.errMess}
              deleteKirk={this.props.deleteKirk}
              updateKirk={this.props.updateKirk}
              keyword={this.state.keyword}
              auth={this.props.auth}
              isUpdating={this.props.kirks.isUpdating} // 2023.11.18
              // kirkNum2={this.props.kirkNum2}
              // getKirkNum2={this.getKirkNum2}
            />
          </div>
        </div>
      );
    };

    const DataPage = () => {
      let myInputs = [];
      for (let i = 0; i < this.props.inputs.inputs.length; i++) {
        if (this.state.showAll === true) {
          myInputs = this.props.inputs.inputs;
          break;
        } else if (this.props.inputs.inputs[i].user === this.props.auth.id) {
          myInputs.push(this.props.inputs.inputs[i]);
        } else {
          continue;
        }
      }

      return (
        <div>
          <Data
            resetInputForm={this.props.resetInputForm}
            postInput={this.props.postInput}
            isLoading={this.props.inputs.isLoading} // 2023.11.18
            isUpdating={this.props.inputs.isUpdating} // 2023.11.18
          />
          <div className='col-12 mt-3'>
            {this.state.view ? (
              <ListData
                resetInputForm={this.props.resetInputForm}
                inputs={myInputs}
                isLoading={this.props.inputs.isLoading}
                errMess={this.props.inputs.errMess}
                deleteInput={this.props.deleteInput}
                updateInput={this.props.updateInput}
                keyword={this.state.keyword}
                auth={this.props.auth}
                getDisplay={this.getDisplay}
                // isMobile={this.props.isMobile}
                isUpdating={this.props.inputs.isUpdating} // 2023.11.18
              />
            ) : (
              <ListKirk2
                resetKirkForm={this.props.resetInputForm}
                kirks={myInputs}
                isLoading={this.props.inputs.isLoading}
                errMess={this.props.inputs.errMess}
                deleteKirk={this.props.deleteInput}
                updateKirk={this.props.updateInput}
                keyword={this.state.keyword}
                auth={this.props.auth}
                isUpdating={this.props.inputs.isUpdating} // 2023.11.18
              />
            )}
          </div>
        </div>
      );
    };

    const ProPage = () => {
      let myProInputs = [];
      for (let i = 0; i < this.props.proInputs.proInputs.length; i++) {
        if (this.state.showAll === true) {
          myProInputs = this.props.proInputs.proInputs;
          break;
        } else if (
          this.props.proInputs.proInputs[i].user === this.props.auth.id
        ) {
          myProInputs.push(this.props.proInputs.proInputs[i]);
        } else {
          continue;
        }
      }
      return (
        <div>
          <Pro
            resetProInputForm={this.props.resetProInputForm}
            postProInput={this.props.postProInput}
            isUpdating={this.props.proInputs.isUpdating} // 2023.11.18
          />
          <div className='col-12 mt-3'>
            {this.state.view ? (
              <ListProData
                resetProInputForm={this.props.resetProInputForm}
                proInputs={myProInputs}
                isLoading={this.props.proInputs.isLoading}
                errMess={this.props.proInputs.errMess}
                deleteProInput={this.props.deleteProInput}
                updateProInput={this.props.updateProInput}
                keyword={this.state.keyword}
                auth={this.props.auth}
                getDisplay={this.getDisplay}
                isUpdating={this.props.proInputs.isUpdating} // 2023.11.18
              />
            ) : (
              <ListKirkPro
                resetKirkForm={this.props.resetProInputForm}
                kirks={myProInputs}
                isLoading={this.props.proInputs.isLoading}
                errMess={this.props.proInputs.errMess}
                deleteKirk={this.props.deleteProInput}
                updateKirk={this.props.updateProInput}
                keyword={this.state.keyword}
                auth={this.props.auth}
                isUpdating={this.props.proInputs.isUpdating} // 2023.11.18
              />
            )}
          </div>
        </div>
      );
    };

    const GraphPage = () => {
      return (
        <div>
          <Graph />
        </div>
      );
    };

    const ChroniclePage = () => {
      let myProInputs = [];
      for (let i = 0; i < this.props.proInputs.proInputs.length; i++) {
        if (this.state.showAll === true) {
          myProInputs = this.props.proInputs.proInputs;
          break;
        } else if (
          this.props.proInputs.proInputs[i].user === this.props.auth.id
        ) {
          myProInputs.push(this.props.proInputs.proInputs[i]);
        } else {
          continue;
        }
      }
      return (
        <div>
          <Chronicle proInputs={myProInputs} />
        </div>
      );
    };

    return (
      <div>
        <Header
          auth={this.props.auth}
          loginUser={this.props.loginUser}
          pwChangeUser={this.props.pwChangeUser}
          signupUser={this.props.signupUser}
          logoutUser={this.props.logoutUser}
          kirks={this.props.kirks.kirks}
          inputs={this.props.inputs.inputs}
          getKeyword={this.getKeyword}
          getShowAll={this.getShowAll}
          getView={this.getView}
          display={this.state.display}
        />
        <Routes>
          {/* <Route path="/inputs" element={ <Navigate to="/inputs" /> } /> */}
          <Route exact path='/' element={<DataPage />} />
          <Route exact path='/inputs' element={<DataPage />} />
          <Route exact path='/kirks' element={<KirkPage />} />
          <Route exact path='/proInputs' element={<ProPage />} />
          <Route exact path='/graph' element={<GraphPage />} />
          <Route exact path='/chronicle' element={<ChroniclePage />} />
          <Route
            exact
            path='/users/forgot-password'
            element={<ForgotPasswordPage />}
          />
        </Routes>
        <div className='row justify-content-center'>
          <div className='col-auto'>
            <p>© 2022-2023 Keiji Harada</p>
          </div>
        </div>
      </div>
    );
  }
}
export default connect(mapStateToProps, mapDispatchToProps)(Main);
