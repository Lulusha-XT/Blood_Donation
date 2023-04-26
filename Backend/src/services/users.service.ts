import { IUser, IUserDocument, User } from "../models/user.model";
import bcrypt from "bcrypt";
import * as auth from "../middlewares/auth";
import dotenv from "dotenv";
import MONGO_DB_CONFIG from "../config/database";
import { Pagination } from "../types/pagination.types";

// Environment variables
dotenv.config();
const saltRound = process.env.SALT_ROUND as string | number;
const bcryptPassword = process.env.BCRYBT_PASSWORD;

// Signup
export const createUser = async (user: IUser): Promise<IUserDocument> => {
  try {
    const isUserExist = await User.findOne({ email: user.email });
    if (isUserExist) throw new Error("Email Already Registerd");

    const password = user.password;
    const hash = bcrypt.hashSync(
      password + bcryptPassword,
      MONGO_DB_CONFIG.SALT_ROUND
    );

    const newUser = new User({
      ...user,
      password: hash,
    });

    const token = auth.assignAccessToken(newUser.toJSON());
    newUser.token = token;
    await newUser.save();

    return newUser as IUserDocument;
  } catch (error) {
    throw new Error(`Could not create user ${error}`);
  }
};

// Log in
export const logIn = async (email: string, password: string) => {
  try {
    const user = await User.findOne({ email });

    if (
      user &&
      (await bcrypt.compare(password + bcryptPassword, user.password))
    ) {
      const token = auth.assignAccessToken(user);
      console.log(token);
      user.token = token;
      return user as IUserDocument;
    }
    return null;
  } catch (error) {
    throw new Error(`Log in faild ${error}`);
  }
};

// Get all users
export const getAllUser = async (
  pagination: Pagination
): Promise<IUserDocument[]> => {
  try {
    const perPage =
      Math.abs(parseInt(pagination.pageSize!)) || MONGO_DB_CONFIG.PAGE_SIZE;
    const page = (Math.abs(parseInt(pagination.page!)) || 1) - 1;

    const user = await User.find()
      .limit(perPage)
      .skip(page * perPage);
    return user as IUserDocument[];
  } catch (error) {
    throw new Error(`User not found ${error}`);
  }
};

// Get user by id

export const getUserById = async (id: string): Promise<IUserDocument> => {
  try {
    const user = await User.findOne({ id });
    return user as IUserDocument;
  } catch (error) {
    throw new Error(`Retriving user faild`);
  }
};
export const updateUserById = async (
  id: string,
  user: IUser
): Promise<IUser | null> => {
  try {
    const updatedUser = await User.findByIdAndUpdate(id, user, {
      new: true,
    });
    return updatedUser;
  } catch (err) {
    throw new Error(`Updating user failed: ${err}`);
  }
};
// Dellete user
export const deleteUser = async (id: string) => {
  try {
    const user = await User.findById(id).lean();
    return user;
  } catch (error) {
    throw new Error(`Delete failed ${error}`);
  }
};
