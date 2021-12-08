import Home from "../pages/Home";
import Login from "../pages/Login";
import CrimeTrends from "../pages/CrimeTrends";
import EvidenceTrends from "../pages/EvidenceTrends";
import EvidenceLog from "../pages/EvidenceLog";
import Reports from "../pages/Reports";
import Witness from "../pages/Witness"
const routes = [
    {path: "/home", name: "home", component: Home},
    {path: "/login", name: "login", component: Login},
    {path: "/trends/crime", name: "crimeTrends", component: CrimeTrends},
    {path: "/trends/evidence", name: "evidenceTrends", component: EvidenceTrends},
    {path: "/evidenceLog", name:"EvidenceLog", component: EvidenceLog},
    {path: "/reports", name:"reports", component: Reports},
    {path: "/Witness", name:"Witness", component: Witness}
];

export default routes;