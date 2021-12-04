import React, {useState, useEffect} from 'react';
import img from '../images/police.jpeg';
import { Container, Form, Row, Col, Image, Button} from 'react-bootstrap';

const axios = require('axios');

export default function CrimeTrends () {

    
    const [city, setCity] = useState([{}]);

    const getCity = () => {
        axios.get('http://localhost:3005/trends/crime/')
        .then((res) => {
            if (res) {
                setCity(res.data);
            }
        });       
    }

    const show = async () => {
        if (true) { 
            axios.get('http://localhost:3005/trends/crime/1', {
                params: {
                    city: "Ajax"
                  }
            })
            .then(async (res) => {
                await getCity();
                setCity(null);
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
                        <Form.Select as="select">
                            <option>Select...</option>
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