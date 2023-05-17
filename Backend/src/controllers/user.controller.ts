import { Request, Response, Router, NextFunction } from "express";
import { IUser, User } from "../models/user.model";
import * as userServices from "../services/users.service";
import { Pagination } from "../types/pagination.types";
import { verifyToken } from "../middlewares/auth";
import { IRequest } from "../interface/user.interface";
import uploadProfilePicture from "../middlewares/user.upload";

const createUser = async (req: Request, res: Response, next: Function) => {
  try {
    const user: IUser = {
      fullName: req.body.fullName,
      email: req.body.email,
      password: req.body.password,
      phoneNo: req.body.phoneNo,
      bloodType: req.body.bloodType,
    };
    console.log(user);
    const newUser = await userServices.createUser(user);
    return res.json({ message: "Success", data: newUser });
  } catch (error) {
    return next(error);
  }
};

const getAllUser = async (req: Request, res: Response, next: Function) => {
  try {
    console.log("GetAllUser Executed");
    const pagination: Pagination = {
      page: req.query.page?.toString(),
      pageSize: req.query.pageSize?.toString(),
    };

    const allUsers = await userServices.getAllUser(pagination);
    return res.json({ message: "Success", data: allUsers });
  } catch (error) {
    return next(error);
  }
};

const getUserById = async (req: Request, res: Response, next: Function) => {
  try {
    console.log("GetUserById Executed");
    console.log(req.params.id);
    const userWithId = await userServices.getUserById(
      req.params.id!.toString()
    );
    return res.json({ message: "Success", data: userWithId });
  } catch (error) {
    return next(error);
  }
};

const userLogin = async (req: Request, res: Response, next: Function) => {
  try {
    const { email, password } = req.body;

    const token = await userServices.logIn(email, password);

    if (token) {
      console.log(token);
      res.json({ message: "Success", data: token });
    } else {
      res
        .status(401)
        .json({ message: "error", error: `Invalid email or password` });
    }
  } catch (error) {
    return next(error);
  }
};

const deleteUser = async (req: Request, res: Response, next: Function) => {
  try {
    const deletedUser = await userServices.deleteUser(req.params.id);
    return res.json({ message: "Success", data: deletedUser });
  } catch (error) {
    return next(error);
  }
};

const updatedUserById = async (
  req: IRequest,
  res: Response,
  next: NextFunction
) => {
  try {
    const profile_picture_path = req.file?.path?.replace(/\\/g, "/") || "";
    console.log(`Profile ${profile_picture_path}`);
    const id = req.user?.userId;
    const user: IUser = {
      fullName: req.body.fullName,
      email: req.body.email,
      password: req.body.password,
      phoneNo: req.body.phoneNo,
      bloodType: req.body.bloodType,
      profilePicture: profile_picture_path,
    };

    const updatedUser = await userServices.updateUserById(
      id?.toString()!,
      user
    );
    return res.json({ message: "Success", data: updatedUser });
  } catch (error) {
    return next(error);
  }
};

const getUserByToken = async (req: Request, res: Response, next: Function) => {
  try {
    const tokenValue = req.body.tokenValue;
    console.log(`TokenValue ${tokenValue}`);
    const userWithId = await userServices.getUserByToken(tokenValue);
    return res.json({ message: "Success", data: userWithId });
  } catch (error) {
    return next(error);
  }
};
const useAndRomeveToken = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const tokenValue = req.body.tokenValue;
    const userId = req.body.userId;
    console.log(`TokenValue ${tokenValue}`);
    const userWithId = await userServices.useAndRomeveToken(userId, tokenValue);
    return res.json({ message: "Success", data: userWithId });
  } catch (error) {
    return next(error);
  }
};

const user_routes = (router: Router) => {
  router.get("/", getAllUser);
  router.get("/token", getUserByToken);
  router.post("/token/use", useAndRomeveToken);
  router.get("/:id", getUserById);
  router.post("/register", createUser);
  router.post("/login", userLogin);
  router.put(
    "/update",
    verifyToken,
    uploadProfilePicture.single("profilePicture"),
    updatedUserById
  );
  router.delete("/:id", deleteUser);
};

export default user_routes;
