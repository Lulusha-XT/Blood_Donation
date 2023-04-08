import MONGO_DB_CONFIG from "../config/database";
import {
  IBloodRequest,
  IBloodRequestDocument,
  BloodRequest,
} from "../models/blood_request.model";
import { Pagination } from "../types/pagination.types";

export const createBloodRequest = async (
  bloodRequest: IBloodRequest
): Promise<IBloodRequestDocument> => {
  try {
    const newBloodRequest = new BloodRequest({
      bloodRequest,
    });
    newBloodRequest.save();
    return newBloodRequest as IBloodRequestDocument;
  } catch (error) {
    throw new Error(`Could not create user ${error}`);
  }
};

export const getAllBloodRequest = async (
  pagination: Pagination
): Promise<IBloodRequestDocument[]> => {
  try {
    const perPage =
      Math.abs(parseInt(pagination.pageSize!)) || MONGO_DB_CONFIG.PAGE_SIZE;
    const page = (Math.abs(parseInt(pagination.page!)) || 1) - 1;

    const user = await BloodRequest.find()
      .limit(perPage)
      .skip(page * perPage);
    return user as IBloodRequestDocument[];
  } catch (error) {
    throw new Error(`Request not found ${error}`);
  }
};
