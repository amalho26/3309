import React, {useEffect} from 'react';
import useState from 'react-usestateref'
import img from '../images/police.jpeg';
import { Container, Form, Row, Col, Image, Button, InputGroup} from 'react-bootstrap';
import Modal from 'react-bootstrap/Modal';

const axios = require('axios');

// function of witness:
//creating a view for the number of witness statements that a specific criminal has made

export default function Witness() {

const [displayModal, setDisplayModal]= useState(false);
const handleClose = () => setDisplayModal(false);
const handleShow = () => setDisplayModal(true);

const [mFName, setMFName, fNameRef] = useState();
const [mLName, setMLName, lNameRef] = useState();
const [mOccNum, setMOccNum, occNumRef] = useState();

//first name
const [fname, setFname] = useState([{}]);
const [insertedFname, setInsertedFname, fnameRef] = useState();
useEffect(() => {
    setFname();
}, []);

 function onChangeTextF (event){ //method for when caseID is entered to view report
    setInsertedFname(JSON.stringify(event.target.value));
}

//last name
const [lname, setLname] = useState([{}]);
const [insertedLname, setInsertedLname, lnameRef] = useState();
useEffect(() => {
    setLname();
    dropView();
}, []);

 function onChangeTextL (event){ //method for when caseID is entered to view report
    setInsertedLname(JSON.stringify(event.target.value));
}

//function to drop view
function dropView(){
    axios.delete('http://localhost:3005/witnessStatements/drop').then((res) => {

    });
}


//function to view report
function viewStatements(){

    axios.get('http://localhost:3005/witnessStatements/view/',{

        fName : insertedFname,
        lName : insertedLname

    }).then((res) => {
        if (res) {
            res.data&&res.data.map((record) =>{
                setMFName(record.fName);
                setMLName(record.lName);
                setMOccNum(record.witnessOccurences);
            });
        handleShow();
        }
    });
}

//function to view report
function createView(){
    axios.post('http://localhost:3005/witnessStatements/create/',{
        
            fName : insertedFname,
            lName : insertedLname
        
    }).then((res) => {
    
    });
}


    return (
        <Container fluid>
            <Row>
                <Col md={6}>
                    <h1>View the number of witness statements that criminal has made</h1>
                </Col>
            </Row>
            <Row>
            <Col md={3}>
                <Form.Group className="mb-3" controlId="formBasicPassword">
                <Form.Label>Enter First Name</Form.Label>
                <Form.Control type="text" placeholder="First Name" onChange={onChangeTextF}/>
                </Form.Group>
                </Col>
                <Col md={3}>
                <Form.Group className="mb-3" controlId="formBasicPassword">
                <Form.Label>Enter Last Name</Form.Label>
                <Form.Control type="text" placeholder="Last Name" onChange={onChangeTextL}/>
                </Form.Group>
                </Col>
            <Col md={6}>
                    <Button type="submit" class="btn btn-primary" onClick={createView}>
                        Create Data
				    </Button>
                    <Button type="submit" class="btn btn-primary" onClick={viewStatements}>
                        View Number of Statements
				    </Button>
                </Col>
                <Col md={6}>
                   <Image src={img}/> 
                </Col>
            </Row>
            {displayModal?
                <Modal show={displayModal} onHide={handleClose}>
                    <Modal.Header closeButton>
                        <Modal.Title>{fNameRef.current} {lNameRef.current}</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <div>Number of Witness Statements: {occNumRef.current}</div>
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