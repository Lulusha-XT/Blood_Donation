import express from "express";
import bloodRequest_routes from "../../controllers/blood_request.controller";
const bloodRequestRoutes = express.Router();

bloodRequest_routes(bloodRequestRoutes);

export default bloodRequestRoutes;
