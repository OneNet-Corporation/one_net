import { Timestamp } from 'firebase-admin/firestore';
import { z } from 'zod';

export const registerSchema = z.object({
  username: z.string().min(3).max(30),
  firstName: z.string().min(1).max(30),
  lastName: z.string().min(1).max(30),
  email: z.string().email(),
  password: z.string().min(6),
  avatarUrl: z.string().url().nullable().default(null),
  contactNo: z.string().optional(),
  gender: z.enum(['Male', 'Female', 'Other']),
  bio: z.string().nullable().default(null),
  isUpdated: z.boolean().default(false),
  deletedAt: z.instanceof(Timestamp).nullable().default(null),
});

export const loginSchema = z.object({
  email: z.string().email(),
  password: z.string().min(6),
});

export const userSchema = z.object({
  userId: z.string(),
  username: z.string().min(3).max(30),
  firstName: z.string().min(1).max(30),
  lastName: z.string().min(1).max(30),
  email: z.string().email(),
  avatarUrl: z.string().url().nullable(),
  contactNo: z.string().nullable(),
  gender: z.enum(['Male', 'Female', 'Other']),
  bio: z.string().nullable(),
  followersCount: z.number().default(0),
  followingCount: z.number().default(0),
  totalPosts: z.number().default(0),
  createdAt: z
    .instanceof(Timestamp)
    .or(z.string().transform((val) => new Timestamp(parseInt(val), 0))),
  updatedAt: z
    .instanceof(Timestamp)
    .or(z.string().transform((val) => new Timestamp(parseInt(val), 0))),
  isUpdated: z.boolean().default(false),
  deletedAt: z.instanceof(Timestamp).nullable(),
});
