import { Timestamp } from 'firebase-admin/firestore';

export interface User {
  userId: string;
  username: string;
  firstName: string;
  lastName: string;
  email: string;
  passwordHash: string;
  avatarUrl?: string;
  contactNo?: string;
  gender: string;
  bio?: string;
  followersCount: number;
  followingCount: number;
  totalPosts: number;
  createdAt: Timestamp;
  updatedAt: Timestamp;
  deletedAt: Timestamp | null;
}
