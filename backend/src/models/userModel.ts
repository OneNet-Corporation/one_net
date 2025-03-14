import { Timestamp } from 'firebase-admin/firestore';

export interface User {
  userId: string;
  username: string;
  firstName: string;
  lastName: string;
  email: string;
  passwordHash: string;
  avatarUrl?: string | null;
  contactNo?: string | null;
  gender: string;
  bio?: string | null;
  followersCount: number;
  followingCount: number;
  totalPosts: number;
  createdAt: Timestamp;
  updatedAt: Timestamp;
  isUpdated: boolean;
  deletedAt: Timestamp | null;
}
