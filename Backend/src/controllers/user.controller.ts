import { Request, Response, Router } from "express";
import { IUser, User } from "../models/user.model";
import * as userServices from "../services/users.service";
import { Pagination } from "../types/pagination.types";

const createUser = async (req: Request, res: Response, next: Function) => {
  try {
    const user: IUser = {
      fullName: req.body.fullName,
      email: req.body.email,
      password: req.body.password,
      phoneNo: req.body.phoneNo,
      bloodType: req.body.bloodType,
    };

    const newUser = await userServices.createUser(user);
    return res.json({ message: "Success", data: newUser });
  } catch (error) {
    return next(error);
  }
};

const getAllUser = async (req: Request, res: Response, next: Function) => {
  try {
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

const userLogin = async (req: Request, res: Response, next: Function) => {
  try {
    const { email, password } = req.body;

    const token = await userServices.logIn(email, password);

    if (token) {
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

const user_routes = (router: Router) => {
  router.route("/").get(getAllUser);
  router.route("/register").post(createUser);
  router.route("/login").post(userLogin);
  router.route("/:id").delete(deleteUser);
};

export default user_routes;