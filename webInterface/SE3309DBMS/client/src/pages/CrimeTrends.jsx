import React from 'react';
import img from '../images/police.jpeg';
import { Container, Form, Row, Col, Badge, Image, Button} from 'react-bootstrap';

export default function CrimeTrends () {

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
                    <Button type="submit" class="btn btn-primary">
					    Submit
				    </Button>
                </Col>
		        <Col md={3}>
			        <Form>
                        <Form.Select aria-label="Default select example">
                            <option>Select...</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
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


	