import Home from "../pages/Home";
import Login from "../pages/Login";
import CrimeTrends from "../pages/CrimeTrends";
import EvidenceTrends from "../pages/EvidenceTrends";

const routes = [
    {path: "/home", name: "home", component: Home},
    {path: "/login", name: "login", component: Login},
    {path: "/trends/crime", name: "crimeTrends", component: CrimeTrends},
    {path: "/trends/evidence", name: "evidenceTrends", component: EvidenceTrends},
];

export default routes;