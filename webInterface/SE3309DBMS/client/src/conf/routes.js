import Home from "../pages/Home";
import Login from "../pages/Login";
import CrimeTrends from "../pages/CrimeTrends";
import EvidenceLog from "../pages/EvidenceLog";

const routes = [
    {path: "/home", name: "home", component: Home},
    {path: "/login", name: "login", component: Login},
    {path: "/trends/crime", name: "crimeTrends", component: CrimeTrends},
    {path: "/evidenceLog", name:"EvidenceLog", component: EvidenceLog}
];

export default routes;