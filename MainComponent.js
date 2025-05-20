import React, { useState, useEffect, useRef } from 'react'
import ReactSearchBox from 'react-search-box'
import Kirk from './KirkComponent'
import Data from './DataComponent'
import Pro from './ProComponent'
import Header from './HeaderComponent'
// import Graph from './GraphComponent';
import Chronicle from './ChronicleComponent'
import { Routes, Route } from 'react-router-dom'
import { connect } from 'react-redux'
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
} from '../redux/ActionCreators'
import { actions } from 'react-redux-form'
import ListKirk from './ListKirkComponent'
import ListKirk2 from './ListKirk2Component'
import ListKirkPro from './ListKirkProComponent'
import ListData from './ListDataComponent'
import ListProData from './ListProDataComponent'
import Forgot from './ForgotComponent'
import Reset from './ResetComponent'

const mapStateToProps = state => ({
  kirks: state.kirks,
  auth: state.auth,
  inputs: state.inputs,
  proInputs: state.proInputs
})

const mapDispatchToProps = dispatch => ({
  fetchKirks: () => dispatch(fetchKirks()),
  fetchInputs: () => dispatch(fetchInputs()),
  fetchProInputs: () => dispatch(fetchProInputs()),
  resetKirkForm: () => dispatch(actions.reset('kirk')),
  resetInputForm: () => dispatch(actions.reset('input')),
  resetProInputForm: () => dispatch(actions.reset('proInput')),
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
})

const Main = props => {
  const [keyword, setKeyword] = useState('')
  const [showAll, setShowAll] = useState(true)
  const [view, setView] = useState(true)
  const [display, setDisplay] = useState([])

  useEffect(() => {
    props.fetchKirks()
    props.fetchInputs()
    props.fetchProInputs()
  }, [])

  const getKeyword = keyword => setKeyword(keyword)
  const getShowAll = showAll => setShowAll(showAll)
  const getView = view => setView(view)
  const getDisplay = display => setDisplay(display)

  const KirkPage = () => {
    let myKirks = []
    for (let i = 0; i < props.kirks.kirks.length; i++) {
      if (showAll) {
        myKirks = props.kirks.kirks
        break
      } else if (props.kirks.kirks[i].user === props.auth.id) {
        myKirks.push(props.kirks.kirks[i])
      }
    }

    return (
      <div>
        <Kirk
          resetKirkForm={props.resetKirkForm}
          postKirk={props.postKirk}
          isUpdating={props.kirks.isUpdating}
        />
        <div className='col-12 mt-3'>
          <ListKirk
            resetKirkForm={props.resetKirkForm}
            kirks={myKirks}
            isLoading={props.kirks.isLoading}
            errMess={props.kirks.errMess}
            deleteKirk={props.deleteKirk}
            updateKirk={props.updateKirk}
            keyword={keyword}
            auth={props.auth}
            isUpdating={props.kirks.isUpdating}
          />
        </div>
      </div>
    )
  }

  const DataPage = () => {
    let myInputs = []
    for (let i = 0; i < props.inputs.inputs.length; i++) {
      if (showAll) {
        myInputs = props.inputs.inputs
        break
      } else if (props.inputs.inputs[i].user === props.auth.id) {
        myInputs.push(props.inputs.inputs[i])
      }
    }

    const scrollContainerRef = useRef(null)

    // Save the current scroll position
    const saveScrollPosition = () => {
      if (scrollContainerRef.current) {
        const scrollLeft = scrollContainerRef.current.scrollLeft
        // console.log('Saving scroll position:', scrollLeft); // Debug log
        localStorage.setItem('horizontalScrollPosition', scrollLeft)
      } else {
        // console.log('scrollContainerRef.current is null'); // Debug log
      }
    }

    // Restore the saved scroll position
    const restoreScrollPosition = () => {
      const savedScrollPosition = localStorage.getItem(
        'horizontalScrollPosition'
      )
      // console.log('Restoring scroll position:', savedScrollPosition);
      if (scrollContainerRef.current && savedScrollPosition) {
        scrollContainerRef.current.scrollLeft = parseInt(
          savedScrollPosition,
          10
        )
      }
    }

    useEffect(() => {
      // Restore scroll position when the component mounts
      restoreScrollPosition()
    }, [])

    return (
      <div>
        <Data
          resetInputForm={props.resetInputForm}
          postInput={props.postInput}
          isLoading={props.inputs.isLoading}
          isUpdating={props.inputs.isUpdating}
        />
        <div className='col-12 mt-3'>
          {view ? (
            <ListData
              resetInputForm={props.resetInputForm}
              inputs={myInputs}
              isLoading={props.inputs.isLoading}
              errMess={props.inputs.errMess}
              deleteInput={props.deleteInput}
              updateInput={props.updateInput}
              keyword={keyword}
              auth={props.auth}
              getDisplay={getDisplay}
              isUpdating={props.inputs.isUpdating}
              saveScrollPosition={saveScrollPosition} // Pass saveScrollPosition
              restoreScrollPosition={restoreScrollPosition} // Pass restoreScrollPosition
              scrollContainerRef={scrollContainerRef} // Pass scrollContainerRef
            />
          ) : (
            <ListKirk2
              resetKirkForm={props.resetInputForm}
              kirks={myInputs}
              isLoading={props.inputs.isLoading}
              errMess={props.inputs.errMess}
              deleteKirk={props.deleteInput}
              updateKirk={props.updateInput}
              keyword={keyword}
              auth={props.auth}
              isUpdating={props.inputs.isUpdating}
            />
          )}
        </div>
      </div>
    )
  }

  const ProPage = () => {
    let myProInputs = []
    for (let i = 0; i < props.proInputs.proInputs.length; i++) {
      if (showAll) {
        myProInputs = props.proInputs.proInputs
        break
      } else if (props.proInputs.proInputs[i].user === props.auth.id) {
        myProInputs.push(props.proInputs.proInputs[i])
      }
    }

    const scrollContainerRef = useRef(null)

    // Save the current scroll position
    const saveScrollPosition = () => {
      if (scrollContainerRef.current) {
        const scrollLeft = scrollContainerRef.current.scrollLeft
        // console.log('Saving scroll position:', scrollLeft); // Debug log
        localStorage.setItem('horizontalScrollPosition', scrollLeft)
      } else {
        // console.log('scrollContainerRef.current is null'); // Debug log
      }
    }

    // Restore the saved scroll position
    const restoreScrollPosition = () => {
      const savedScrollPosition = localStorage.getItem(
        'horizontalScrollPosition'
      )
      // console.log('Restoring scroll position:', savedScrollPosition);
      if (scrollContainerRef.current && savedScrollPosition) {
        scrollContainerRef.current.scrollLeft = parseInt(
          savedScrollPosition,
          10
        )
      }
    }

    useEffect(() => {
      // Restore scroll position when the component mounts
      restoreScrollPosition()
    }, [])

    return (
      <div>
        <Pro
          resetProInputForm={props.resetProInputForm}
          postProInput={props.postProInput}
          isUpdating={props.proInputs.isUpdating}
        />
        <div className='col-12 mt-3'>
          {view ? (
            <ListProData
              resetProInputForm={props.resetProInputForm}
              proInputs={myProInputs}
              isLoading={props.proInputs.isLoading}
              errMess={props.proInputs.errMess}
              deleteProInput={props.deleteProInput}
              updateProInput={props.updateProInput}
              keyword={keyword}
              auth={props.auth}
              getDisplay={getDisplay}
              isUpdating={props.proInputs.isUpdating}
              saveScrollPosition={saveScrollPosition} // Pass saveScrollPosition
              restoreScrollPosition={restoreScrollPosition} // Pass restoreScrollPosition
              scrollContainerRef={scrollContainerRef} // Pass scrollContainerRef
            />
          ) : (
            <ListKirkPro
              resetKirkForm={props.resetProInputForm}
              kirks={myProInputs}
              isLoading={props.proInputs.isLoading}
              errMess={props.proInputs.errMess}
              deleteKirk={props.deleteProInput}
              updateKirk={props.updateProInput}
              keyword={keyword}
              auth={props.auth}
              isUpdating={props.proInputs.isUpdating}
            />
          )}
        </div>
      </div>
    )
  }

  // const GraphPage = () => <Graph />;

  const ChroniclePage = () => {
    let myProInputs = []
    for (let i = 0; i < props.proInputs.proInputs.length; i++) {
      if (showAll) {
        myProInputs = props.proInputs.proInputs
        break
      } else if (props.proInputs.proInputs[i].user === props.auth.id) {
        myProInputs.push(props.proInputs.proInputs[i])
      }
    }

    return (
      <div>
        <Chronicle proInputs={myProInputs} keyword={keyword} />
      </div>
    )
  }

  const ForgotPasswordPage = () => (
    <div>
      <Forgot forgotPassword={props.forgotPassword} />
    </div>
  )

  return (
    <div>
      <Header
        auth={props.auth}
        loginUser={props.loginUser}
        pwChangeUser={props.pwChangeUser}
        signupUser={props.signupUser}
        logoutUser={props.logoutUser}
        kirks={props.kirks.kirks}
        inputs={props.inputs.inputs}
        getKeyword={getKeyword}
        getShowAll={getShowAll}
        getView={getView}
        display={display}
      />
      <Routes>
        <Route exact path='/' element={<DataPage />} />
        <Route exact path='/inputs' element={<DataPage />} />
        <Route exact path='/kirks' element={<KirkPage />} />
        <Route exact path='/proInputs' element={<ProPage />} />
        {/* <Route exact path='/graph' element={<GraphPage />} /> */}
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
  )
}

export default connect(mapStateToProps, mapDispatchToProps)(Main)
