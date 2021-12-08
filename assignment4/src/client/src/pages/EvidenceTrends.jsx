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
    const [timeStart, setStartTime] = useState();
    const [timeEnd, setEndTime] = useState();
    const [displayChart, setDisplayChart]= useState(false);//display bar graph default false, until data is submitted then retrieved from db
    const[evidenceType, setEvidenceType, evidenceTypeRef] = useState();
    const[count, setCount, countRef] = useState();
    ChartJS.register(CategoryScale,LinearScale,BarElement,Title,Tooltip,Legend);
    let c = [];
    const e = [];

    function submit() {//on button submit, get evidence trends with station and date input
        axios.get('http://localhost:3005/trends/evidence/station', {
            params: {
                inputStation: selectedStation,
                startTime: timeStart,
                endTime: timeEnd
            }
        })
            .then((res) => {//set up all the states
                if (res) {
                res.data&&res.data.map((record) =>{
                    e.push(record.evidenceType);
                    c.push(record.count);
                });

                setEvidenceType(e)
                setCount(c)
                setDisplayChart(true);//set display bar chart = true
                
                }
            });

    }
     
    useEffect(() => {//on first page load, retrieve all station numbers form backend
        axios.get('http://localhost:3005/trends/evidence/')
            .then((res) => {
                if (res) {
                    setStation(res.data);
                }
            });
    }, []);

    
    function onChangeOption (event) {//update everytime user changes station number
        setSelectedStation((Number(event.target.value)+1));
    }

    function onChangeStartTime (event) {//update everytime user changes station number
        setStartTime(JSON.stringify(event.target.value));
    }

    function onChangeEndTime (event) {//update everytime user changes station number
        setEndTime(JSON.stringify(event.target.value));
    }
    
    const options = {//options for bar chart
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
      


    const chartData = {//set chart data

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
                        <Form.Label>Start Time</Form.Label>
                        <Form.Control type="text" placeholder="start time" onChange={onChangeStartTime}/>
                        <Form.Label>End Time</Form.Label>
                        <Form.Control type="text" placeholder="end time" onChange={onChangeEndTime}/>
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