import { z } from 'zod';

export const registerSchema = z.object({
  username: z.string().min(3).max(30),
  firstName: z.string().min(2).max(50),
  lastName: z.string().min(2).max(50),
  email: z.string().email(),
  password: z.string().min(6, 'Password must be at least 6 characters'),
  gender: z.enum(['Male', 'Female', 'Other']),
});

export const loginSchema = z.object({
  email: z.string().email(),
  password: z.string().min(6),
});
