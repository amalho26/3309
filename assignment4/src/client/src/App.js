import React, { Fragment, useEffect } from 'react';
import useState from 'react-usestateref';
import { Navbar, Nav, Container, NavDropdown } from 'react-bootstrap';
import { BrowserRouter, Route, Redirect } from "react-router-dom";
import { useCookies } from 'react-cookie';
import { AiOutlineHome } from "react-icons/ai";
import 'bootstrap/dist/css/bootstrap.min.css';
import './css/App.css';
import routes from './conf/routes';
const axios = require('axios');

function App() {
   
    const [cookies, setCookie, removeCookie] = useCookies(['userId']);
    const [fName, setFName, fNameRef] = useState();
    const [lName, setLName, lNameRef] = useState();


    
    if (cookies && cookies.userId) {
        setCookie('userId', cookies.userId, {
            path: '/home',
            maxAge: process.env.REACT_APP_ENV_COOKIES_MAX_AGE
        });
    }

    useEffect(() => {
        axios.get('http://localhost:3005/authenticate/name', {
            params: {
                id: cookies.userId
            }
        })
        .then((res) => {
            if (res) {
                res.data&&res.data.map((record) =>{
                    setFName(record.fname);
                    setLName(record.lname);
                });
                
            }
        });    
    }, []);

    function isLoggedIn() {
            if (cookies.userId == 'undefined' || !cookies.userId)
                return false;
            else 
                return true;      
    }

    return (
        <BrowserRouter>
        <Navbar>
            <Container>
                <Navbar.Brand href="/home">
                    <AiOutlineHome size="2rem" />
                </Navbar.Brand>
                {isLoggedIn() ?
                <Navbar.Collapse className="justify-content-end">
                <Nav className="ms-auto">
                    <Nav.Link href="/reports">Reports</Nav.Link>
                    <NavDropdown title="Trends" id="basic-nav-dropdown">
                        <NavDropdown.Item href="/trends/crime">Crime Trends</NavDropdown.Item>
                        <NavDropdown.Item href="/trends/evidence">Evidence Trends</NavDropdown.Item>
                    </NavDropdown>
                    <Nav.Link href="/Witness">Witness Statements</Nav.Link>
                    <NavDropdown title={`Signed in as: ${fName + " " + lName}`} id="basic-nav-dropdown">
                        <NavDropdown.Item onClick={() => {
                            console.log(cookies.userId)
                                removeCookie('userId', { path: '/home' });
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