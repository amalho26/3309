import React, {useEffect} from 'react';
import useState from 'react-usestateref'
import img from '../images/police.jpeg';
import { Container, Form, Row, Col, Image, Button, InputGroup} from 'react-bootstrap';
import moment from 'moment';

const axios = require('axios');

export default function Reports () {

//case ID
const [caseID, setCaseID, caseIDRef] = useState([{}]);

    useEffect(() => {
        axios.get('http://localhost:3005/caseID')
        .then((res) => {
            if (res) {
                setCaseID(res.data);
            }
    });
 }, []); 

 function onChangeText (event){ //method for when caseID is entered
    setCaseID(event.target.value);
}

 //arrival time
 const [arrivalTime, setArrivalTime, arrivalTimeRef] = useState([{}]);

function onChangeTime (event){ //method for when caseID is entered
    setArrivalTime(event.target.value);
}

//time on scene
const [timeOnScene, setTimeOnScene, timeRef] = useState([{}]);


function onChangeNumber (event){ //method for when caseID is entered
    setTimeOnScene(event.target.value);
    }

//city
const [city, setCity] = useState([{}]);
const [selectedCity, setSelectedCity, cityRef] = useState();
const getCity = () => {
    axios.get('http://localhost:3005/trends/crime/')
    .then((res) => {
        if (res) {
            setCity(res.data);
        }
    });       
}

function onChangeOption (event) {
    setSelectedCity(event.target.value);
    //console.log(event.target.value)
}

useEffect(() => {
    getCity();
}, []);

//officerSIN
const [officerSIN, setOfficerSIN, officerRef] = useState([{}]);
const getOfficerSIN = () => {
    axios.get('http://localhost:3005/officer/officerSIN/')
    .then((res) => {
        if (res) {
            setOfficerSIN(res.data);
        }
    });       
}
   useEffect(() => {
   axios.get('http://localhost:3005/officer/officerSIN')
   .then((res) => {
       if (res) {
           setOfficerSIN(res.data);
       }
});
}, []); 
useEffect(() => {
   getOfficerSIN();
}, []);

// function onChangeOS(onChangeOS) //method for when officerSIN is inputed
// {
//    axios.get('http://localhost:3005/officer/officerSIN/')
//    .then((res) => {
//        if (res) {
//            setOfficerSIN(res.data);
//        }
//    })
// }

//submit button
function submit()
{
    let dateTime = new Date();
    //console.log(moment(dateTime).format('YYYY-MM-DD'));
    //console.log(moment(dateTime).format('hh:mm:ss'));

    let currentDate = moment(dateTime).format('YYYY-MM-DD');
    //let curTime = moment(dateTime).format('hh:mm:ss');
    console.log(caseID, currentDate, arrivalTime, timeOnScene, officerSIN, selectedCity);
//     axios.post('http://localhost:3005/report/add',{
//     params: {
        //rcity : selectedCity;
//     rCase: caseID,
//     rDate : currentDate,
//     rTime : curTime,
//     rArrivalTime: arrivalTime,
//     rTimeOnScene : timeOnScene,
//     rOfficerSIN : officerSIN
//     }      
//         }).then ((res) =>
//     {
//     if (res) {
// setOutput(res.data);
// console. log (output)
//    }
// });

}
    return (
        <Container fluid>
            <Row>
                <Col md={6}>
                    <h1>Inserting a new report</h1>
                </Col>
            </Row>
            <Row>
		        <Col md={3}>
                <Form.Group className="mb-3" controlId="formBasicPassword">
                <Form.Label>Enter Case ID</Form.Label>
                <Form.Control type="text" placeholder="case ID" onChange={onChangeText}/>
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
                <Form.Label>Enter time on scene </Form.Label>
                <Form.Control type="text" placeholder="Enter time on scene" onChange={onChangeNumber}/>
                </Form.Group>
                </Col>
                <Col md={3}>
                    <h5>Log New Report</h5>
                    <Button type="submit" class="btn btn-primary" onClick={submit}>
                        Enter
				    </Button>
                </Col>
                <Col md={6}>
                   <Image src={img}/> 
                </Col>
            </Row>
        </Container>
    )
}