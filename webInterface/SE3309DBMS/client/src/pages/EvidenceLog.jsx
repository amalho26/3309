import React, {useState, useEffect} from 'react';
import img from '../images/police.jpeg';
import { Container, Form, Row, Col, Image, Button, InputGroup} from 'react-bootstrap';
import moment from 'moment';

const axios = require('axios');

export default function EvidenceLog () {

//case ID
const [caseID, setCaseID] = useState([{}]);

    useEffect(() => {
        axios.get('http://localhost:3005/caseID')
        .then((res) => {
            if (res) {
                setCaseID(res.data);
            }
    });
 }, []); 

 function onChangeText (event){ //method for when caseID is entered
    return(event.target.value);
}

 //Evidence Type -- done select menu
 const [ET, setET] = useState([{}]);
 const getET = () => {
     axios.get('http://localhost:3005/evidenceLog/ET/')
     .then((res) => {
         if (res) {
             setET(res.data);
         }
     });       
 }
    useEffect(() => {
    axios.get('http://localhost:3005/evidenceLog/ET')
    .then((res) => {
        if (res) {
            setET(res.data);
        }
});
}, []); 
useEffect(() => {
    getET();
}, []);

function onChangeET(onChangeET) //method for when evidenceType is selected
{
    axios.get('http://localhost:3005/evidenceLog/ET/')
    .then((res) => {
        if (res) {
            setET(res.data);
        }
    })
}

//date

// date = moment.toDate();


//time
//const time = moment.toTime();

//no of evidence collected
const [noOfEvidenceCollected, setNoOfEvidenceCollected] = useState([{}]);
useEffect(() => {
    axios.get('http://localhost:3005/evidenceLog')
    .then((res) => {
        if (res) {
            setNoOfEvidenceCollected(res.data);
        }
});
}, []); 

function onChangeNumber (event){ //method for when caseID is entered
return(event.target.value);
}
//description
const [description, setDescription] = useState([{}]);
useEffect(() => {
    axios.get('http://localhost:3005/evidenceLog')
    .then((res) => {
        if (res) {
            setDescription(res.data);
        }
});
}, []); 

function onChangeEvidence (event){ //method for when caseID is entered
return(event.target.value);}

//log type -- done select menu
const [logType, setLogType] = useState([{}]);
const getLogType = () => {
    axios.get('http://localhost:3005/evidenceLog/LT/')
    .then((res) => {
        if (res) {
            setLogType(res.data);
        }
    });       
}
   useEffect(() => {
   axios.get('http://localhost:3005/evidenceLog/LT')
   .then((res) => {
       if (res) {
           setLogType(res.data);
       }
});
}, []); 
useEffect(() => {
   getLogType();
}, []);
function onChangeLT(onChangeLT) //method for when evidenceType is selected
{
    axios.get('http://localhost:3005/evidenceLog/LT/')
    .then((res) => {
        if (res) {
            setLogType(res.data);
        }
    })
}

//officerSIN
const [officerSIN, setOfficerSIN] = useState([{}]);
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

function onChangeOS(onChangeOS) //method for when officerSIN is inputed
{
   axios.get('http://localhost:3005/officer/officerSIN/')
   .then((res) => {
       if (res) {
           setOfficerSIN(res.data);
       }
   })
}

//submit button
function submit()
{
    let currentDate = new Date();
    console.log(moment(currentDate).format('YYYY-MM-DD'));
    console.log(moment(currentDate).format('hh:mm:ss'));
    //console.log(selectedET, currentDate, currentTime, InputedNoOfEviCol, InputedDescription, selectedLogType, SelectedOfficerSIN, InputedCaseID);
    //axios.post('http://localhost:3005/evidenceLog/addEvidence',{
    //params: {
    // ET: selectedET,
    // cDate : currentDate,
    // noOfEC : InputedNoOfEviCol,
    // desc : InputedDescription,
    // selectedLT : selectedLogType,
    // offSIN : SelectedOfficerSIN,
    // inputCI : InputedCaseID

    //}      
//         }).then ((res) =>
//     {
//     if (res) {
// setOutput(res.data);
// console. log (output)
//     }
// });
//
}
    //viewing= get
    //update= put
    //adding new things = post

    return (
        <Container fluid>
            <Row>
                <Col md={6}>
                    <h1>Evidence Log</h1>
                </Col>
            </Row>
            <Row>
		        <Col md={3}>
                <Form.Group className="mb-3" controlId="formBasicPassword">
                <Form.Label>Enter Case ID</Form.Label>
                <Form.Control type="text" placeholder="case ID" onChange={onChangeText}/>
                </Form.Group>
                <Col md={1}>
                </Col>
                <Form>
                <Form.Label>Select evidence type</Form.Label>
                        <Form.Select as="select">
                            <option>Select Evidence Type</option>
                            {ET.length && ET.map((item, index)=> (
                                <option value={index}>{item.evidenceType}</option>
                            ))}
                        </Form.Select>
                    </Form>
                </Col>
                <Col>
                <Form>
                <Form.Label>Select log type</Form.Label>
                        <Form.Select as="select">
                            <option>Select Log Type</option>
                            {logType.length && logType.map((item, index)=> (
                                <option value={index}>{item.logType}</option>
                            ))}
                        </Form.Select>
                    </Form>
                </Col>
                <Form.Group className="mb-3" controlId="formBasicPassword">
                <Form.Label>Enter Number of Evidence Collected </Form.Label>
                <Form.Control type="text" placeholder="number collected" onChange={onChangeNumber}/>
                </Form.Group>
                <Col md={6}>
                </Col>
                <Form.Group className="mb-3" controlId="formBasicPassword">
                <Form.Label>Enter Evidence Description </Form.Label>
                <Form.Control type="text" placeholder="Enter description" onChange={onChangeEvidence}/>
                </Form.Group>
                <Col md={6}>
                <Col md={3}>
                    <h5>Log New Evidence</h5>
                    <Button type="submit" class="btn btn-primary" onClick={submit}>
                        Enter
				    </Button>
                </Col>
                   <Image src={img}/> 
                </Col>
            </Row>
        </Container>
    )
}