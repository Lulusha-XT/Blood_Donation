import { Request, Response, Router } from "express";
import { IBloodRequest } from "../models/blood_request.model";
import * as BloodRequestServie from "../services/blood_request.service";
import { Pagination } from "../types/pagination.types";
import { verifyToken } from "../middlewares/auth";
import { IRequest } from "../interface/user.interface";

const createBloodRequest = async (
  req: IRequest,
  res: Response,
  next: Function
) => {
  try {
    const bloodRequest: IBloodRequest = {
      bloodType: req.body.bloodType,
      reason: req.body.reason,
      unitRequired: req.body.unitRequired,
      deadLine: req.body.deadLine,
      hospital: req.body.hospital,
      personInCharge: req.body.personInCharge,
      contactNumber: req.body.contactNumber,
      patientName: req.body.patientName,
      userId: req.user!.userId,
    };

    const newBloodRequest = await BloodRequestServie.createBloodRequest(
      bloodRequest
    );
    return res.json({ message: "Success", data: newBloodRequest });
  } catch (error) {
    return next(error);
  }
};
const getAllBloodReques = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const pagination: Pagination = {
      page: req.query.page?.toString(),
      pageSize: req.query.pageSize?.toString(),
    };

    const allBloodRequest = await BloodRequestServie.getAllBloodRequest(
      pagination
    );
    return res.json({ message: "Success", data: allBloodRequest });
  } catch (error) {
    return next(error);
  }
};

const bloodRequest_routes = (router: Router) => {
  router.get("/:id", getAllBloodReques);
  router.post("/", verifyToken, createBloodRequest);
};

export default bloodRequest_routes;
