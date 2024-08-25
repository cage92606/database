import React, { Component, Fragment } from 'react';
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
import { Link } from 'react-router-dom';
import Search from './SearchComponent';

class Header extends Component {
  constructor (props) {
    super(props);
    this.state = {
      isNavOpen: false,
      isModalOpen: false,
      isSignupModalOpen: false,
      isPwChangeModalOpen: false,
      dropdownOpen: false,
      showAll: false,
      view: false
      // keyword: '',
      // kirkNum: 0,
    };
    // To use a method on JSX you have to bind it here.
    this.toggleDropdownOpen = this.toggleDropdownOpen.bind(this);
    this.toggleNav = this.toggleNav.bind(this);
    this.closeNavbar = this.closeNavbar.bind(this);
    this.toggleModal = this.toggleModal.bind(this);
    this.togglePwChangeModal = this.togglePwChangeModal.bind(this);
    this.toggleSignupModal = this.toggleSignupModal.bind(this);
    this.handleLogin = this.handleLogin.bind(this);
    this.handleSignup = this.handleSignup.bind(this);
    this.handleLogout = this.handleLogout.bind(this);
    this.handlePwChange = this.handlePwChange.bind(this);
    this.handleFiles = this.handleFiles.bind(this);
    this.findKirks = this.findKirks.bind(this);
    this.toggleShowAll = this.toggleShowAll.bind(this);
    this.toggleView = this.toggleView.bind(this);
  }

  toggleDropdownOpen () {
    this.setState({
      dropdownOpen: !this.state.dropdownOpen
    });
  }
  toggleNav () {
    this.setState({
      isNavOpen: !this.state.isNavOpen
    });
  }
  closeNavbar () {
    this.setState({
      isNavOpen: false
    });
  }

  toggleModal () {
    this.setState({
      isModalOpen: !this.state.isModalOpen
    });
    if (this.state.isNavOpen) {
      this.toggleNav();
    }
  }

  togglePwChangeModal () {
    this.setState({
      isPwChangeModalOpen: !this.state.isPwChangeModalOpen
    });
  }

  toggleSignupModal () {
    this.setState({
      isSignupModalOpen: !this.state.isSignupModalOpen
    });
  }

  handleLogin (event) {
    this.toggleModal(); // Close the modal once the forms submitted
    // alert(
    //   `Username: ${this.username.value} Password: ${this.password.value} Remember: ${this.remember.checked}`
    // );
    this.props.loginUser({
      username: this.username.value,
      password: this.password.value
    });
    if (this.state.isNavOpen) {
      this.toggleNav();
    }
    event.preventDefault();
  }

  handlePwChange (event) {
    this.togglePwChangeModal(); // Close the modal once the forms submitted
    this.props.pwChangeUser({
      username: this.pwChangeUsername.value,
      oldpassword: this.oldpassword.value,
      newpassword: this.newpassword.value
    });
    if (this.state.isNavOpen) {
      this.toggleNav();
    }
    event.preventDefault();
  }

  handleSignup (event) {
    if (!this.signupEmail.value) {
      alert('No EMAIL');
    } else {
      this.toggleSignupModal(); // Close the modal once the forms submitted
      // alert(
      //   `Username: ${this.username.value} Password: ${this.password.value} Remember: ${this.remember.checked}`
      // );
      this.props.signupUser({
        username: this.signupUsername.value,
        password: this.signupPassword.value,
        email: this.signupEmail.value
      });
      if (this.state.isNavOpen) {
        this.toggleNav();
      }
    }

    event.preventDefault();
  }

  handleLogout () {
    this.props.logoutUser();
    if (this.state.isNavOpen) {
      this.toggleNav();
    }
  }

  handleFiles = files => {
    var reader = new FileReader();
    reader.onload = function (e) {
      // Use reader.result
      alert(reader.result);
    };
    reader.readAsText(files[0]);
  };

  findKirks = keyword => {
    // this.setState({
    //   keyword: this.state.keyword,
    // });
    // const foundKirks = this.props.kirks.filter((curr) =>
    //   curr.subject.includes(keyword)
    // );
    this.props.getKeyword(keyword);
  };

  toggleShowAll () {
    this.setState({
      showAll: !this.state.showAll
    });
    this.props.getShowAll(this.state.showAll);
    // console.log('showAll on child is ', this.state.showAll);
    if (this.state.isNavOpen) {
      this.toggleNav();
    }
  }

  toggleView () {
    this.setState({
      view: !this.state.view
    });
    this.props.getView(this.state.view);
    // console.log('view on child is ', this.state.view);
    if (this.state.isNavOpen) {
      this.toggleNav();
    }
  }

  // prettier-ignore ignore
  render () {
    // const isHamburgerMenu = window.innerWidth <= 1206; // Replace 768 with your actual breakpoint
    // console.log(
    //   `Is the menu currently a hamburger menu? ${isHamburgerMenu} and the width is ${window.innerWidth}`
    // );
    const foundKirks = this.props.kirks.filter(curr =>
      curr.subject.includes(this.state.keyword)
    );
    // const csvData = this.props.inputs;
    // console.log('auth.id on Header is ', this.props.auth.id);
    return (
      <Fragment>
        {/* <Navbar dark expand="lg" className="header mr-auto" fixed="top"> */}
        {/* <Navbar dark expand='xl' className='header mr-auto' fixed='top'> */}
        <Navbar dark expand='xl' className='header ml-auto' fixed='top'>
          <Container>
            <div className='container'>
              <div className='row'>
                <div
                  className={
                    this.state.isNavOpen ? 'col-6' : 'col-6 align-self-center'
                  }
                >
                  <Search
                    findKirks={this.findKirks}
                    // isNavOpen={this.state.isNavOpen}
                  />
                </div>
                <div className='col-6' align='right'>
                  <div className='ml-auto'>
                    <NavbarToggler onClick={this.toggleNav} />
                    <Collapse
                      isOpen={this.state.isNavOpen}
                      navbar
                      className='ml-auto'
                    >
                      <Nav className='ml-auto'>
                        {this.state.showAll ? (
                          <Button
                            outline
                            color='primary'
                            onClick={this.toggleShowAll}
                            className={
                              this.state.isNavOpen ? 'header-buttons' : ''
                            }
                          >
                            All
                          </Button>
                        ) : (
                          <Button
                            outline
                            color='secondary'
                            onClick={this.toggleShowAll}
                            className={
                              this.state.isNavOpen ? 'header-buttons' : ''
                            }
                          >
                            Mine
                          </Button>
                        )}
                      </Nav>
                      <Nav className='ml-auto'>
                        {this.state.view ? (
                          <Button
                            outline
                            color='primary'
                            onClick={this.toggleView}
                          >
                            Spreadsheet
                          </Button>
                        ) : (
                          <Button
                            outline
                            color='secondary'
                            onClick={this.toggleView}
                          >
                            List
                          </Button>
                        )}
                      </Nav>
                      {/* </div> */}
                      <Nav className='ml-auto'>
                        <NavLink
                          tag={Link}
                          to='/kirks'
                          onClick={this.closeNavbar}
                        >
                          Kirk
                        </NavLink>
                      </Nav>
                      <Nav className='ml-auto'>
                        <NavLink tag={Link} to='/' onClick={this.closeNavbar}>
                          Data
                        </NavLink>
                      </Nav>
                      <Nav className='ml-auto'>
                        <NavLink
                          tag={Link}
                          to='/proInputs'
                          onClick={this.closeNavbar}
                        >
                          Pro
                        </NavLink>
                      </Nav>
                      <Nav className='ml-auto'>
                        <NavLink
                          tag={Link}
                          to='/chronicle'
                          onClick={this.closeNavbar}
                        >
                          Chron
                        </NavLink>
                      </Nav>
                      <Nav className='ml-auto'>
                        <NavItem>
                          {!this.props.auth.isAuthenticated ? (
                            <Fragment>
                              <Button outline onClick={this.toggleSignupModal}>
                                <span className='fa fa-sign-in fa-lg'></span>{' '}
                                Signup
                                {this.props.auth.isFetching ? (
                                  <span className='fa fa-spinner fa-pulse fa-fw'></span>
                                ) : null}
                              </Button>{' '}
                              <Button outline onClick={this.toggleModal}>
                                <span className='fa fa-sign-in fa-lg'></span>{' '}
                                Login
                                {this.props.auth.isFetching ? (
                                  <span className='fa fa-spinner fa-pulse fa-fw'></span>
                                ) : null}
                              </Button>
                            </Fragment>
                          ) : (
                            <Fragment className='navbar-text mr-3 user-info'>
                              {this.props.auth.user.username}
                              {'  '}
                              <Button outline onClick={this.handleLogout}>
                                <span className='fa fa-sign-out'></span> Logout
                                {this.props.auth.isFetching ? (
                                  <span className='fa fa-spinner fa-pulse fa-fw'></span>
                                ) : null}
                              </Button>
                              <Button
                                outline
                                onClick={this.togglePwChangeModal}
                              >
                                <span className='fa fa-key'></span>
                                {this.props.auth.isFetching ? (
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
        <Modal isOpen={this.state.isModalOpen} toggle={this.toggleModal}>
          <ModalHeader toggle={this.toggleModal}>Login</ModalHeader>
          <ModalBody>
            <Form onSubmit={this.handleLogin}>
              <FormGroup>
                <Label htmlFor='username'>Username</Label>
                <Input
                  type='text'
                  id='username'
                  name='username'
                  innerRef={input => (this.username = input)}
                />
              </FormGroup>
              <FormGroup>
                <Label htmlFor='password'>Password</Label>
                <Input
                  type='password'
                  id='password'
                  name='password'
                  innerRef={input => (this.password = input)}
                />
              </FormGroup>
              {/* <FormGroup check>
                <Label check>
                  <Input
                    type="checkbox"
                    name="remember"
                    innerRef={(input) => (this.remember = input)}
                  />{' '}
                  Remember me
                </Label>
              </FormGroup> */}
              <p className='forgot-password text-right'>
                <Link to={'/users/forgot-password'} onClick={this.toggleModal}>
                  Forgot password?
                </Link>
              </p>
              <Button type='submit' value='submit' color='primary'>
                Login
              </Button>
            </Form>
          </ModalBody>
        </Modal>

        <Modal
          isOpen={this.state.isPwChangeModalOpen}
          toggle={this.togglePwChangeModal}
        >
          <ModalHeader toggle={this.togglePwChangeModal}>
            Password Change
          </ModalHeader>
          <ModalBody>
            <Form onSubmit={this.handlePwChange}>
              <FormGroup>
                <Label htmlFor='pwChangeUsername'>Username</Label>
                <Input
                  type='text'
                  id='pwChangeUsername'
                  name='pwChangeUsername'
                  innerRef={input => (this.pwChangeUsername = input)}
                />
              </FormGroup>
              <FormGroup>
                <Label htmlFor='oldpassword'>Old Password</Label>
                <Input
                  type='password'
                  id='oldpassword'
                  name='oldpassword'
                  innerRef={input => (this.oldpassword = input)}
                />
              </FormGroup>
              <FormGroup>
                <Label htmlFor='newpassword'>New Password</Label>
                <Input
                  type='password'
                  id='newpassword'
                  name='newpassword'
                  innerRef={input => (this.newpassword = input)}
                />
              </FormGroup>
              <Button type='submit' value='submit' color='primary'>
                Change Password
              </Button>
            </Form>
          </ModalBody>
        </Modal>

        <Modal
          isOpen={this.state.isSignupModalOpen}
          toggle={this.toggleSignupModal}
        >
          <ModalHeader toggle={this.toggleSignupModal}>Signup</ModalHeader>
          <ModalBody>
            <Form onSubmit={this.handleSignup}>
              <FormGroup>
                <Label htmlFor='signupUsername'>Username</Label>
                <Input
                  type='text'
                  id='signupUsername'
                  name='signupUsername'
                  innerRef={input => (this.signupUsername = input)}
                />
              </FormGroup>
              <FormGroup>
                <Label htmlFor='signupPassword'>Password</Label>
                <Input
                  type='password'
                  id='signupPassword'
                  name='signupPassword'
                  innerRef={input => (this.signupPassword = input)}
                />
              </FormGroup>
              <FormGroup>
                <Label htmlFor='signupEmail'>Email</Label>
                <Input
                  type='email'
                  id='signupEmail'
                  name='signupEmail'
                  innerRef={input => (this.signupEmail = input)}
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
  }
}

export default Header;
