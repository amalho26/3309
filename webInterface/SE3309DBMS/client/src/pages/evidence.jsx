import React, {useState, useEffect} from 'react';
import img from '../images/police.jpeg';
import { Container, Form, Row, Col, Image, Button} from 'react-bootstrap';

const axios = require('axios');

export default function evidence () {
    const [evidenceType, date, time, noOfEvidenceCollected, description, logType, officerSIN, caseID] = useState([{}]);
    const getCaseID = () => {
        axios.get('http://localhost:3005/reports/caseID/')
        .then((res) => {
            if (res) {
                setCaseID(res.data);
            }
        });       
    }

    const show = async () => {
        if (true) { 
            axios.get('http://localhost:3005/reports/caseID/1', {
                params: {
                    caseID: ""
                  }
            })
            .then(async (res) => {
                await getCaseID();
                setCaseID(null);
            });
        }       

        
    }


    useEffect(() => {
        getCity();
    }, []);


    return (
        <Container fluid>
            <Row>
                <Col md={6}>
                    <h1>Crime Trends</h1>
                </Col>
            </Row>
            <Row>
                <Col md={3}>
                    <h5>Select City</h5>
                    <Button type="submit" class="btn btn-primary" onClick={show}>
                        Enter
				    </Button>
                </Col>
		        <Col md={3}>
			        <Form>
                        <Form.Select as="insert">
                            <option>Insert...</option>
                            {city.length && city.map((item, index)=> (
                                <option value={index}>{item.city}</option>
                            ))}
                        </Form.Select>
                    </Form>
                </Col>
                <Col md={6}>
                   <Image src={img}/> 
                </Col>
            </Row>
        </Container>
    )
}