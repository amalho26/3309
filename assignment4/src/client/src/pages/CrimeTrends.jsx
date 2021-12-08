import React, {useEffect} from 'react';
import useState from 'react-usestateref'
import img from '../images/police.jpeg';
import { useCookies } from 'react-cookie';
import { Redirect } from "react-router-dom";
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
import { Pie } from 'react-chartjs-2';
import { Container, Form, Row, Col, Image, Button} from 'react-bootstrap';

const axios = require('axios');
ChartJS.register(ArcElement, Tooltip, Legend);

export default function CrimeTrends () {
    const [cookies, setCookie, removeCookie] = useCookies(['userId']);
    const [selectedCity, setSelectedCity] = useState();
    const [displayChart, setDisplayChart]= useState(false);
    const[crimeType, setCrimeType, crimeTypeRef] = useState();
    const[count, setCount, countRef] = useState();
    ChartJS.register(ArcElement, Tooltip, Legend);
    const [city, setCity] = useState([{}]);
    let c = [];
    const cr = [];

    //setting chart values and chart settings
    const chartData = {
        labels: crimeTypeRef.current,
        datasets: [
            {
            label: 'Crime',
            data: countRef.current,
            backgroundColor: ['red', 'blue', 'yellow', 'white', 'brown', 'green', 'purple', 'orange', 'black', 'grey'],
            borderColor: ['rgba(255, 159, 64, 1)', ],
            borderWidth: 1,
            },
        ],
        };
        //when button is clicked, get crime info with selected city and return as pie chart
    function submit() {
        console.log(selectedCity)
        axios.get('http://localhost:3005/trends/crime/city', {
            params: {
                inputCity: JSON.stringify(selectedCity)
            }
            
        })
            .then((res) => {
                if (res) {
                console.log(res.data)
                res.data&&res.data.map((record) =>{
                    cr.push(record.Crime);
                    c.push(record.Occurance);
                });

                setCrimeType(cr)
                setCount(c)
                console.log(crimeTypeRef.current)//ref current is used because file doesn't get a chance to re-render
                console.log(countRef.current)
                setDisplayChart(true);//when rendering, display pie chart
                
                }
            });

    }

    function onChangeOption (event) {//everytime user changes the city value, update use state
        setSelectedCity(event.target.value);
        console.log(event.target.value)
    }

    useEffect(() => {//get city data from backend on display of page
        axios.get('http://localhost:3005/trends/crime/')
        .then((res) => {
            if (res) {
                setCity(res.data);
            }
        });  
    }, []);

    if (!cookies.userId) {   // if user isn't logged in, go back to login page    
        return <Redirect to="/login" />
    }

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
                    <Button type="submit" class="btn btn-primary" onClick={submit}>
                        Enter
				    </Button>
                </Col>
		        <Col md={3}>
			        <Form>
                        <Form.Select as="select" onChange={onChangeOption}>
                            <option>Select...</option>
                            {city.length && city.map((item)=> (
                                <option value={item.city}>{item.city}</option>
                            ))}
                        </Form.Select>
                    </Form>
                </Col>
                <Col md={6}>
                   <Image src={img}/> 
                </Col>
            </Row>
            {displayChart? 
                <Pie data={chartData} />
                :
                null
            }
        </Container>
    )
}