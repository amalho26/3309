import React, {useEffect} from 'react';
import useState from 'react-usestateref'
import img from '../images/police.jpeg';
import {Chart as ChartJS,CategoryScale,LinearScale,BarElement,Title,Tooltip,Legend} from 'chart.js';
  import { Bar } from 'react-chartjs-2';

import { Container, Form, Row, Col, Image, Button} from 'react-bootstrap';

const axios = require('axios');


export default function EvidenceTrends () {
    const [station, setStation] = useState([{}]);
    const [selectedStation, setSelectedStation] = useState();
    const [displayChart, setDisplayChart]= useState(false);
    const[evidenceType, setEvidenceType, evidenceTypeRef] = useState();
    const[count, setCount, countRef] = useState();
    ChartJS.register(CategoryScale,LinearScale,BarElement,Title,Tooltip,Legend);
    let c = [];
    const e = [];

    function submit() {
        axios.get('http://localhost:3005/trends/evidence/station', {
            params: {
                inputStation: selectedStation
            }
        })
            .then((res) => {
                if (res) {
                console.log(res.data)
                res.data&&res.data.map((record) =>{
                    e.push(record.evidenceType);
                    c.push(record.count);
                });

                setEvidenceType(e)
                setCount(c)
                console.log(evidenceTypeRef.current)
                console.log(countRef.current)
                setDisplayChart(true);
                
                }
            });

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
    
    const options = {
        responsive: true,
        plugins: {
          legend: {
            position: 'top',
          },
          title: {
            display: true,
            text: 'Evidence',
          },
        },
    };
      


    const chartData = {

        labels: evidenceTypeRef.current,
        datasets: [
            {
            label: 'Occurance',
            data: countRef.current,
            backgroundColor: 'green',
            },
        ],

    
    };
  
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
            {displayChart? 
                <Bar options={options} data={chartData} />
                :
                null
            }
        </Container>
    )
}