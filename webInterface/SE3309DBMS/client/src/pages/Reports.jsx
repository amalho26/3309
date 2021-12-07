import React, {useEffect} from 'react';
import useState from 'react-usestateref'
import img from '../images/police.jpeg';
import { Container, Form, Row, Col, Image, Button, InputGroup} from 'react-bootstrap';
import moment from 'moment';

const axios = require('axios');

export default function Reports () {

//case ID
const [caseID, setCaseID] = useState([{}]);
const [insertedCaseID, setInsertedCaseID, caseIDRef] = useState();
    useEffect(() => {
        axios.get('http://localhost:3005/caseID')
        .then((res) => {
            if (res) {
                setCaseID(res.data);
            }
    });
 }, []); 

 function onChangeText (event){ //method for when caseID is entered to view report
    setInsertedCaseID(Number(event.target.value));
}
function onChangeText1 (event){ //method for when caseID is entered to insert report
    setInsertedCaseID(Number(event.target.value));
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
//

//function to view report
function viewReport(){
    console.log(insertedCaseID);
    axios.get('http://localhost:3005/reports/view/',{
        params: {
            caseID : insertedCaseID
            //caseID : 29312
        }
    }).then((res) => {
        if (res) {
        console.log(res.data);
        console.log("server response!");
        }
        else
        console.log("no response from server!");
    });
}

//submit button
function submit()
{
    let dateTime = new Date();

    let currentDate = moment(dateTime).format('YYYY-MM-DD');
    console.log(caseID, currentDate, arrivalTime, timeOnScene, officerSIN, selectedCity);
//     axios.post('http://localhost:3005/report/add',{
//     params: {
        //rcity : JSON.stringify(selectedCity);
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
                    <h1>Insert Or View a report</h1>
                </Col>
            </Row>
            <Row>
            <Col md={3}>
            <h5>View Existing Report</h5>
                <Form.Group className="mb-3" controlId="formBasicPassword">
                <Form.Label>Enter Case ID</Form.Label>
                <Form.Control type="text" placeholder="case ID" onChange={onChangeText}/>
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
                <Form.Control type="text" placeholder="case ID" onChange={onChangeText1}/>
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
                    <Button type="submit" class="btn btn-primary" onClick={submit}>
                        Insert New Report
				    </Button>
                </Col>
                <Col md={6}>
                   <Image src={img}/> 
                </Col>
            </Row>
        </Container>
    )
}