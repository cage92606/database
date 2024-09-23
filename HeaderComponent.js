import React, { useEffect, useState, Fragment } from 'react';
import {
  Navbar,
  Nav,
  NavbarToggler,
  Collapse,
  NavItem,
  Button,
  Modal,
  ModalHeader,
  ModalBody,
  Form,
  FormGroup,
  Label,
  Input,
  NavLink,
  Container
} from 'reactstrap';
import { Link, useLocation } from 'react-router-dom';
import Search from './SearchComponent';

const Header = props => {
  const [isNavOpen, setIsNavOpen] = useState(false);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isSignupModalOpen, setIsSignupModalOpen] = useState(false);
  const [isPwChangeModalOpen, setIsPwChangeModalOpen] = useState(false);
  const [dropdownOpen, setDropdownOpen] = useState(false);
  const [showAll, setShowAll] = useState(false);
  const [view, setView] = useState(true);

  const location = useLocation();
  const isChronicleRoute = location.pathname === '/chronicle';

  useEffect(() => {
    if (!isChronicleRoute) {
      document.body.classList.add('fixed-header');
    } else {
      document.body.classList.remove('fixed-header');
    }
  }, [isChronicleRoute]);

  const toggleDropdownOpen = () => setDropdownOpen(!dropdownOpen);
  const toggleNav = () => setIsNavOpen(!isNavOpen);
  const closeNavbar = () => setIsNavOpen(false);
  const toggleModal = () => setIsModalOpen(!isModalOpen);
  const togglePwChangeModal = () =>
    setIsPwChangeModalOpen(!isPwChangeModalOpen);
  const toggleSignupModal = () => setIsSignupModalOpen(!isSignupModalOpen);

  const handleLogin = event => {
    event.preventDefault();
    toggleModal();
    props.loginUser({
      username: usernameRef.current.value,
      password: passwordRef.current.value
    });
    if (isNavOpen) {
      toggleNav();
    }
  };

  const handlePwChange = event => {
    event.preventDefault();
    togglePwChangeModal();
    props.pwChangeUser({
      username: pwChangeUsernameRef.current.value,
      oldpassword: oldpasswordRef.current.value,
      newpassword: newpasswordRef.current.value
    });
    if (isNavOpen) {
      toggleNav();
    }
  };

  const handleSignup = event => {
    event.preventDefault();
    if (!signupEmailRef.current.value) {
      alert('No EMAIL');
    } else {
      toggleSignupModal();
      props.signupUser({
        username: signupUsernameRef.current.value,
        password: signupPasswordRef.current.value,
        email: signupEmailRef.current.value
      });
      if (isNavOpen) {
        toggleNav();
      }
    }
  };

  const handleLogout = () => {
    props.logoutUser();
    if (isNavOpen) {
      toggleNav();
    }
  };

  const handleFiles = files => {
    var reader = new FileReader();
    reader.onload = function (e) {
      alert(reader.result);
    };
    reader.readAsText(files[0]);
  };

  const findKirks = keyword => {
    props.getKeyword(keyword);
  };

  const toggleShowAll = () => {
    setShowAll(!showAll);
    props.getShowAll(!showAll);
    if (isNavOpen) {
      toggleNav();
    }
  };

  const toggleView = () => {
    setView(!view);
    props.getView(!view);
    if (isNavOpen) {
      toggleNav();
    }
  };

  const usernameRef = React.createRef();
  const passwordRef = React.createRef();
  const pwChangeUsernameRef = React.createRef();
  const oldpasswordRef = React.createRef();
  const newpasswordRef = React.createRef();
  const signupUsernameRef = React.createRef();
  const signupPasswordRef = React.createRef();
  const signupEmailRef = React.createRef();

  const foundKirks = props.kirks.filter(curr =>
    curr.subject.includes(props.keyword)
  );

  return (
    <Fragment>
      <Navbar
        dark
        expand='xl'
        // className={isChronicleRoute ? 'header-unfixed' : 'header-fixed'}
        className='header'
        fixed={isChronicleRoute ? '' : 'top'}

        // fixed='top'
      >
        <Container>
          <div className='container'>
            <div className='row'>
              <div className={isNavOpen ? 'col-6' : 'col-6 align-self-center'}>
                <Search findKirks={findKirks} />
              </div>
              <div className='col-6' align='right'>
                <div className='ml-auto'>
                  <NavbarToggler onClick={toggleNav} />
                  <Collapse isOpen={isNavOpen} navbar className='ml-auto'>
                    <Nav className='ml-auto'>
                      {showAll ? (
                        <Button
                          outline
                          color='primary'
                          onClick={toggleShowAll}
                          className={isNavOpen ? 'header-buttons' : ''}
                        >
                          All
                        </Button>
                      ) : (
                        <Button
                          outline
                          color='secondary'
                          onClick={toggleShowAll}
                          className={isNavOpen ? 'header-buttons' : ''}
                        >
                          Mine
                        </Button>
                      )}
                    </Nav>
                    <Nav className='ml-auto'>
                      {view ? (
                        <Button outline color='primary' onClick={toggleView}>
                          S/S
                        </Button>
                      ) : (
                        <Button outline color='secondary' onClick={toggleView}>
                          List
                        </Button>
                      )}
                    </Nav>
                    <Nav className='ml-auto'>
                      <NavLink tag={Link} to='/kirks' onClick={closeNavbar}>
                        Kirk
                      </NavLink>
                    </Nav>
                    <Nav className='ml-auto'>
                      <NavLink tag={Link} to='/' onClick={closeNavbar}>
                        Data
                      </NavLink>
                    </Nav>
                    <Nav className='ml-auto'>
                      <NavLink tag={Link} to='/proInputs' onClick={closeNavbar}>
                        Pro
                      </NavLink>
                    </Nav>
                    <Nav className='ml-auto'>
                      <NavLink tag={Link} to='/chronicle' onClick={closeNavbar}>
                        Chron
                      </NavLink>
                    </Nav>
                    <Nav className='ml-auto'>
                      <NavItem>
                        {!props.auth.isAuthenticated ? (
                          <Fragment>
                            <Button outline onClick={toggleSignupModal}>
                              <span className='fa fa-sign-in fa-lg'></span>{' '}
                              Signup
                              {props.auth.isFetching ? (
                                <span className='fa fa-spinner fa-pulse fa-fw'></span>
                              ) : null}
                            </Button>{' '}
                            <Button outline onClick={toggleModal}>
                              <span className='fa fa-sign-in fa-lg'></span>{' '}
                              Login
                              {props.auth.isFetching ? (
                                <span className='fa fa-spinner fa-pulse fa-fw'></span>
                              ) : null}
                            </Button>
                          </Fragment>
                        ) : (
                          <Fragment className='navbar-text mr-3 user-info'>
                            {props.auth.user.username}
                            {'  '}
                            <Button outline onClick={handleLogout}>
                              <span className='fa fa-sign-out'></span> Logout
                              {props.auth.isFetching ? (
                                <span className='fa fa-spinner fa-pulse fa-fw'></span>
                              ) : null}
                            </Button>
                            <Button outline onClick={togglePwChangeModal}>
                              <span className='fa fa-key'></span>
                              {props.auth.isFetching ? (
                                <span className='fa fa-spinner fa-pulse fa-fw'></span>
                              ) : null}
                            </Button>
                          </Fragment>
                        )}
                      </NavItem>
                    </Nav>
                  </Collapse>
                </div>
              </div>
            </div>
          </div>
        </Container>
      </Navbar>
      <Modal isOpen={isModalOpen} toggle={toggleModal}>
        <ModalHeader toggle={toggleModal}>Login</ModalHeader>
        <ModalBody>
          <Form onSubmit={handleLogin}>
            <FormGroup>
              <Label htmlFor='username'>Username</Label>
              <Input
                type='text'
                id='username'
                name='username'
                innerRef={usernameRef}
              />
            </FormGroup>
            <FormGroup>
              <Label htmlFor='password'>Password</Label>
              <Input
                type='password'
                id='password'
                name='password'
                innerRef={passwordRef}
              />
            </FormGroup>
            <p className='forgot-password text-right'>
              <Link to={'/users/forgot-password'} onClick={toggleModal}>
                Forgot password?
              </Link>
            </p>
            <Button type='submit' value='submit' color='primary'>
              Login
            </Button>
          </Form>
        </ModalBody>
      </Modal>

      <Modal isOpen={isPwChangeModalOpen} toggle={togglePwChangeModal}>
        <ModalHeader toggle={togglePwChangeModal}>Password Change</ModalHeader>
        <ModalBody>
          <Form onSubmit={handlePwChange}>
            <FormGroup>
              <Label htmlFor='pwChangeUsername'>Username</Label>
              <Input
                type='text'
                id='pwChangeUsername'
                name='pwChangeUsername'
                innerRef={pwChangeUsernameRef}
              />
            </FormGroup>
            <FormGroup>
              <Label htmlFor='oldpassword'>Old Password</Label>
              <Input
                type='password'
                id='oldpassword'
                name='oldpassword'
                innerRef={oldpasswordRef}
              />
            </FormGroup>
            <FormGroup>
              <Label htmlFor='newpassword'>New Password</Label>
              <Input
                type='password'
                id='newpassword'
                name='newpassword'
                innerRef={newpasswordRef}
              />
            </FormGroup>
            <Button type='submit' value='submit' color='primary'>
              Change Password
            </Button>
          </Form>
        </ModalBody>
      </Modal>

      <Modal isOpen={isSignupModalOpen} toggle={toggleSignupModal}>
        <ModalHeader toggle={toggleSignupModal}>Signup</ModalHeader>
        <ModalBody>
          <Form onSubmit={handleSignup}>
            <FormGroup>
              <Label htmlFor='signupUsername'>Username</Label>
              <Input
                type='text'
                id='signupUsername'
                name='signupUsername'
                innerRef={signupUsernameRef}
              />
            </FormGroup>
            <FormGroup>
              <Label htmlFor='signupPassword'>Password</Label>
              <Input
                type='password'
                id='signupPassword'
                name='signupPassword'
                innerRef={signupPasswordRef}
              />
            </FormGroup>
            <FormGroup>
              <Label htmlFor='signupEmail'>Email</Label>
              <Input
                type='email'
                id='signupEmail'
                name='signupEmail'
                innerRef={signupEmailRef}
              />
            </FormGroup>
            <Button type='submit' value='submit' color='primary'>
              Signup
            </Button>
          </Form>
        </ModalBody>
      </Modal>
    </Fragment>
  );
};

export default Header;
