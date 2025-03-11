import { Request, Response } from "express";
import * as userService from "../services/userServices";

// Create a new user
export const createUser = async (req: Request, res: Response) => {
  const userData = req.body;
  const result = await userService.createUser(userData);
  res.status(result.success ? 201 : 400).json(result);
};

// Get a user by ID
export const getUserById = async (req: Request, res: Response) => {
  const { userId } = req.params;
  const user = await userService.getUserById(userId);
  if (user) {
    res.status(200).json(user);
  } else {
    res.status(404).json({ message: "User not found" });
  }
};

// Update user
export const updateUser = async (req: Request, res: Response) => {
  const { userId } = req.params;
  const updateData = req.body;
  const result = await userService.updateUser(userId, updateData);
  res.status(result.success ? 200 : 400).json(result);
};

// Delete user
export const deleteUser = async (req: Request, res: Response) => {
  const { userId } = req.params;
  const result = await userService.deleteUser(userId);
  res.status(result.success ? 200 : 400).json(result);
};