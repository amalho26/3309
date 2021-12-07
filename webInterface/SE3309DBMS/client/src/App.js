import React, { Fragment } from 'react';
import { Navbar, Nav, Container, NavDropdown } from 'react-bootstrap';
import { BrowserRouter, Route, Redirect } from "react-router-dom";
import { useCookies } from 'react-cookie';
import { AiOutlineHome } from "react-icons/ai";
import 'bootstrap/dist/css/bootstrap.min.css';
import './css/App.css';
import routes from './conf/routes';

function App() {
   
    const [cookies, setCookie, removeCookie] = useCookies(['userId']);

    // We need this to reset the max age of our userId
    if (cookies && cookies.userId) {
        setCookie('userId', cookies.userId, {
            path: '/',
            maxAge: process.env.REACT_APP_ENV_COOKIES_MAX_AGE
        });
    }

    // Checks if the user is logged in
    function isLoggedIn() {
        return cookies.userId == 'undefined' || !cookies.userId ? false : true;
        console.log(cookies.userId);
    }

    return (
        <BrowserRouter>
        <Navbar>
            <Container>
                <Navbar.Brand href="/home">
                    <AiOutlineHome size="2rem" />
                </Navbar.Brand>
                {isLoggedIn ?
                <Navbar.Collapse className="justify-content-end">
                <Nav className="ms-auto">
                    <Nav.Link href="/reports">Reports</Nav.Link>
                    <NavDropdown title="Trends" id="basic-nav-dropdown">
                        <NavDropdown.Item href="/trends/crime">Crime Trends</NavDropdown.Item>
                        <NavDropdown.Item href="/trends/evidence">Evidence Trends</NavDropdown.Item>
                    </NavDropdown>
                    <Nav.Link href="/evidenceLog">Evidence</Nav.Link>
                    <Nav.Link href="/evidence">Witness Statements</Nav.Link>
                    <NavDropdown title="Signed in as: Reports" id="basic-nav-dropdown">
                        <NavDropdown.Item onClick={() => {
                                removeCookie('userId');
                            }}>Logout</NavDropdown.Item>
                    </NavDropdown>
                   
                </Nav>
                </Navbar.Collapse>
                :
                <Navbar.Collapse className="justify-content-end">
                    <Nav.Link href="/login">Log In</Nav.Link>
                </Navbar.Collapse>
                }
            </Container>
        </Navbar>
        <Fragment>
            {routes.map( ({ path, component, name}) => {
                return <Route exact path={path} key={name} component={component} />
            })}
        </Fragment>
            
        </BrowserRouter>
    );
}

export default App;