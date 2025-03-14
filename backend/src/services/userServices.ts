import { collections } from '../config/firestoreCollections';
import { User } from '../models/userModel';
import { Timestamp } from 'firebase-admin/firestore';
import logger from '../utils/logger';
import { userSchema } from '../validators/userValidator';

// Fetch user by email
export const getUserByEmail = async (email: string): Promise<User | null> => {
  const snapshot = await collections.users.where('email', '==', email).get();
  return snapshot.empty ? null : (snapshot.docs[0].data() as User);
};

export const getUserById = async (userId: string) => {
  try {
    const userDoc = await collections.users.doc(userId).get();
    if (!userDoc.exists) return null;

    const userData = userDoc.data();
    if (!userData) return null;

    // Validate & Parse user data using Zod to ensure alignment
    return userSchema.parse(userData);
  } catch (error) {
    logger.error(`Error fetching user by ID: ${userId}`, error);
    return null;
  }
};

export const createUser = async (
  userData: Omit<User, 'createdAt' | 'updatedAt'>
): Promise<{ success: boolean; message: string; userId?: string }> => {
  try {
    const userRef = collections.users.doc();
    const userId = userRef.id;
    const now = Timestamp.now();

    const newUser: User = {
      ...userData,
      userId,
      createdAt: now,
      updatedAt: now,
      isUpdated: false,
      deletedAt: null,
    };

    await userRef.set(newUser);
    return { success: true, message: 'User created successfully', userId };
  } catch (error) {
    logger.error('Error creating user:', error);
    return { success: false, message: 'User creation failed' };
  }
};
