import { usersCollection } from "../config/firebase";
import { User } from "../models/userModel";
import { Timestamp } from "firebase-admin/firestore";

// Create User
export const createUser = async (userData: User) => {
  try {
    const userRef = usersCollection.doc(userData.userId);
    userData.createdAt = Timestamp.now();
    userData.updatedAt = Timestamp.now();
    await userRef.set(userData);
    return { success: true, message: "User created successfully" };
  } catch (error) {
    console.error("Error creating user:", error);
    return { success: false, message: "User creation failed" };
  }
};

// Get User by ID
export const getUserById = async (userId: string) => {
  const userDoc = await usersCollection.doc(userId).get();
  return userDoc.exists ? userDoc.data() : null;
};

// Update User
export const updateUser = async (userId: string, updateData: Partial<User>) => {
  try {
    updateData.updatedAt = Timestamp.now();
    await usersCollection.doc(userId).update(updateData);
    return { success: true, message: "User updated successfully" };
  } catch (error) {
    console.error("Error updating user:", error);
    return { success: false, message: "User update failed" };
  }
};

// Delete User (Soft Delete)
export const deleteUser = async (userId: string) => {
  try {
    await usersCollection.doc(userId).update({ deletedAt: Timestamp.now() });
    return { success: true, message: "User deleted successfully" };
  } catch (error) {
    console.error("Error deleting user:", error);
    return { success: false, message: "User deletion failed" };
  }
};