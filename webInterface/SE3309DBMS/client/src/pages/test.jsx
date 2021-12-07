import React, {useState, useEffect} from 'react';
import img from '../images/police.jpeg';
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
import { Pie } from 'react-chartjs-2';
import { Container, Form, Row, Col, Image, Button} from 'react-bootstrap';

const axios = require('axios');
ChartJS.register(ArcElement, Tooltip, Legend);

export default function EvidenceTrends () {
    const [chartData, setChartData] = useState({});
    const [station, setStation] = useState([{}]);
    const [selectedStation, setSelectedStation] = useState();
    const [output, setOutput] = useState();
    const [data, setData] = useState([]);
    
    let evidenceType = [];
    let count = [];



    function submit() {
        axios.get('http://localhost:3005/trends/evidence/station', {
            params: {
                inputStation: selectedStation
            }
        })
            .then((res) => {
                if (res) {
                    const evidence = res.data
                    console.log(evidence)
                    for(const dataObj of evidence){
                        evidenceType.push(dataObj.evidenceType);
                        count.push(dataObj.count);
                    }
                    
                    
                    setOutput(evidence);
                    

                    output&&output.map((record) =>{
                        evidenceType.push(record.evidenceType);
                        count.push(record.count);
                    });
                    setData({
                        Data: {
                          labels: evidenceType,
                          datasets: [
                            {
                                label: "Works",
                                data: count,
                                borderColor: ["#3cb371"],
                                borderWidth: 1,
                                backgroundColor: ["#3cb371"]
                            }
                          ]
                        }
                      });
                }
            });

            console.log(evidenceType, count)
    }

    
        
    useEffect(() => {
        axios.get('http://localhost:3005/trends/evidence/')
            .then((res) => {
                if (res) {
                    setStation(res.data);
                }
            });
    }, []);

    
    function onChangeOption (event) {
        setSelectedStation((Number(event.target.value)+1));
    }

    return (
        <Container fluid>
            <Row>
               
                <Col md={6}>
                    <h1>Evidence Trends</h1>
                </Col>
            </Row>
            <Row>
                <Col md={3}>
                    <h5>Select Station #</h5>
                    <Button type="submit" class="btn btn-primary" onClick={submit}>
                        Enter
				    </Button>
                </Col>
		        <Col md={3}>
			        <Form>
                        <Form.Select as="select" onChange={onChangeOption}>
                            <option>Select...</option>
                            {
                            station && station.map((item, index)=> (
                                <option value={index}>{item.stationNo}</option>
                            ))}
                        </Form.Select>
                    </Form>
                </Col>
                <Col md={6}>
                   <Image src={img}/> 
                </Col>
                {}
            </Row>
            
        </Container>
    )
}



