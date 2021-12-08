import React, {useEffect} from 'react';
import useState from 'react-usestateref';
import { useCookies } from 'react-cookie';
import img from '../images/police.jpeg';
import { Container, Form, Row, Col, Image, Button, InputGroup} from 'react-bootstrap';
import moment from 'moment';
import { Redirect } from "react-router-dom";
import Modal from 'react-bootstrap/Modal';

const axios = require('axios');

export default function Reports () {
    const [displayModal, setDisplayModal]= useState(false);
    const handleClose = () => setDisplayModal(false);
    const handleShow = () => setDisplayModal(true);
    const [cookies, setCookie, removeCookie] = useCookies(['userId']);
    const [sin, setSin] = useState([]);
    const [caseID, setCaseID] = useState([{}]);
    const [insertedCaseID, setInsertedCaseID, caseIDRef] = useState();
    const [arrivalTime, setArrivalTime, arrivalTimeRef] = useState([{}]);
    const [timeOnScene, setTimeOnScene, timeRef] = useState([{}]);
    const [city, setCity] = useState([{}]);
    const [selectedCity, setSelectedCity, cityRef] = useState();
    const [mcaseId, setMCaseId, caseRef] = useState();
    const [mdate, setMDate, dateRef] = useState();
    const [marrival, setMArrival, arrivalRef] = useState();
    const [mtime, setMTime, mtimeRef] = useState();
    const [mcity, setMCity, mcityRef] = useState();
    const [officerSIN, setOfficerSIN, officerRef] = useState([{}]);

    useEffect(() => {//load all sin to cookies, so officer sin can be put into reports
        axios.get('http://localhost:3005/authenticate/sin', {
            params: {
                id: cookies.userId
            }
        })
        .then((res) => {
            if (res) {
                res.data&&res.data.map((record) =>{
                    setSin(record.loginOfficerID)
                });
                
            }
        }); 
    }, []);


    function onChangeText (event){ //method for when caseID is entered to view report
        setInsertedCaseID(Number(event.target.value));
    }
    function onChangeText1 (event){ //method for when caseID is entered to insert report
        setInsertedCaseID(Number(event.target.value));
    }


    function onChangeTime (event){ //method for when caseID is entered
        setArrivalTime(event.target.value);
    }

    function onChangeNumber (event){ //method for when caseID is entered
        setTimeOnScene(event.target.value);
        }

    const getCity = () => {//get all cities
        axios.get('http://localhost:3005/trends/crime/')
        .then((res) => {
            if (res) {
                setCity(res.data);
            }
        });       
    }


    function onChangeOption (event) {//set selected city
        setSelectedCity(event.target.value);
        //console.log(event.target.value)
    }

    useEffect(() => {
        getCity();//set them at the start of page load
    }, []);


    //function to view report
    function viewReport(){
        axios.get('http://localhost:3005/reports/view/',{
            params: {
                caseID : insertedCaseID
            }
        }).then((res) => {
            if (res) {
                res.data&&res.data.map((record) =>{//set all retrieved data
                    setMCaseId(record.caseID);
                    setMDate(record.date);
                    setMArrival(record.arrivalTime);
                    setMTime(record.timeOnScene);
                    setMCity(record.city);
                });

            handleShow();
            }
        });
    }


    //submit button
    function submit()
    {
        
        let dateTime = new Date();
        let currentDate = moment(dateTime).format('YYYY-MM-DD');//format date accordign to sql
        
        axios.post('http://localhost:3005/reports/add',{

            rsin: sin,
            rcity : JSON.stringify(selectedCity),
            rCase: insertedCaseID,
            rDate : JSON.stringify(currentDate),
            rArrivalTime: JSON.stringify(arrivalTime),
            rTimeOnScene : timeOnScene,
            rOfficerSIN : officerSIN
            
        }).then ((res) =>
        {
    });

    
    }

    if (!cookies.userId) {     //if user isn't logged in go to login page  
        return <Redirect to="/login" />
    }

    return (
        <Container fluid>
            <Row>
                <Col md={6}>
                    <h1>Insert Or View a report</h1>
                </Col>
            </Row>
            <Row>
            <Col md={3}>
            <h5>View Existing Report</h5>
                <Form.Group className="mb-3" controlId="formBasicPassword">
                <Form.Label>Enter Case ID</Form.Label>
                <Form.Control type="number" placeholder="case ID" onChange={onChangeText}/>
                </Form.Group>
                </Col>
            <Col md={6}>
                    <Button type="submit" class="btn btn-primary" onClick={viewReport}>
                        View Report
				    </Button>
                </Col>
            </Row>
            <Row>
            <Col md={3}>
            <h5>Log New Report</h5>
            </Col>
		        <Col md={3}>
                <Form.Group className="mb-3" controlId="formBasicPassword">
                <Form.Label>Enter Case ID</Form.Label>
                <Form.Control type="number" placeholder="case ID" onChange={onChangeText1}/>
                </Form.Group>
                </Col>
                <Col md={3}>
			        <Form>
                    <Form.Label>Select city </Form.Label>
                        <Form.Select as="select" onChange={onChangeOption}>
                            <option>Select City</option>
                            {city.length && city.map((item)=> (
                                <option value={item.city}>{item.city}</option>
                            ))}
                        </Form.Select>
                    </Form>
                </Col>
                <Col md={6}>
                <Form.Group className="mb-3" controlId="formBasicPassword">
                <Form.Label>Enter arrival time </Form.Label>
                <Form.Control type="text" placeholder="number collected" onChange={onChangeTime}/>
                </Form.Group>
                </Col>
                <Col md={6}>
                <Form.Group className="mb-3" controlId="formBasicPassword">
                <Form.Label>Enter time on scene in minutes</Form.Label>
                <Form.Control type="number" placeholder="Enter time on scene" onChange={onChangeNumber}/>
                </Form.Group>
                </Col>
                <Col md={3}>
                    <Button type="submit" class="btn btn-primary" onClick={submit}>
                        Insert New Report
				    </Button>
                </Col>
                <Col md={6}>
                   <Image src={img}/> 
                </Col>
            </Row>
            {displayModal?
                <Modal show={displayModal} onHide={handleClose}>
                    <Modal.Header closeButton>
                        <Modal.Title>Report #{caseRef.current}</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <div>Date: {dateRef.current}</div>
                        <div>Arrival Time: {arrivalRef.current}</div>
                        <div>Time on Scene: {mtimeRef.current}</div>
                        <div>City: {mcityRef.current}</div>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button variant="primary" onClick={handleClose}>
                            Close
                        </Button>
                    </Modal.Footer>
                </Modal>
                :
                null
            }
        </Container>
    )
}