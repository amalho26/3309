import React, { useState, useEffect } from 'react';
import { Line } from 'react-chartjs-2';

const EvidenceTrends = () => {
    const [chartData, setChartData] = useState({});


    const chart = () => {
        setChartData({
            labels: ['monday', 'tuesday', 'wednesday', 'thursday', 'friday'],
            datasets: [{
                label: 'My First Dataset',
                data: [65, 59, 80, 81, 56],
                fill: false,
                borderColor: 'rgb(75, 192, 192)',
                tension: 0.1
            }]
        })
    }
    useEffect(() => {
        chart();

    }, []);
    return (
        <div>

            {
                chartData ? <Line data={chartData} /> : null
            }

        </div>
    )
}
export default EvidenceTrends;
