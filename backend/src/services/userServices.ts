import { collections } from '../config/firestoreCollections';
import { User } from '../models/userModel';
import { Timestamp } from 'firebase-admin/firestore';

// Fetch user by email
export const getUserByEmail = async (email: string): Promise<User | null> => {
  const snapshot = await collections.users.where('email', '==', email).get();
  return snapshot.empty ? null : (snapshot.docs[0].data() as User);
};

// Create a new user
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
    };

    await userRef.set(newUser);
    return { success: true, message: 'User created successfully', userId };
  } catch (error) {
    console.error('Error creating user:', error);
    return { success: false, message: 'User creation failed' };
  }
};
