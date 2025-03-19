import jwt, { Secret, JwtPayload } from 'jsonwebtoken';
import dotenv from 'dotenv';

dotenv.config();

const JWT_SECRET: Secret = process.env.JWT_SECRET || 'default_secret';
const JWT_EXPIRES_IN: string = process.env.JWT_EXPIRES_IN || '3h';

// Generate JWT token
export const generateToken = (
  userId: string
): { token: string; expiresAt: number } => {
  const expiresAt = Math.floor(Date.now() / 1000) + msToSeconds(JWT_EXPIRES_IN);
  const token = jwt.sign({ userId, exp: expiresAt }, JWT_SECRET);

  return { token, expiresAt: expiresAt * 1000 }; // Convert back to milliseconds
};

// Verify JWT token
export const verifyToken = (token: string): JwtPayload | null => {
  try {
    return jwt.verify(token, JWT_SECRET) as JwtPayload;
  } catch (error) {
    console.error('Error while verifying JWT:', error);
    return null;
  }
};

// Helper function to convert time string to seconds
const msToSeconds = (time: string): number => {
  const duration = time.match(/(\d+)([smhd])/);
  if (!duration) throw new Error('Invalid JWT expiry format');

  const [, value, unit] = duration;
  const timeValue = parseInt(value, 10);

  const multiplier = {
    s: 1, // seconds
    m: 60, // minutes
    h: 60 * 60, // hours
    d: 60 * 60 * 24, // days
  }[unit as 's' | 'm' | 'h' | 'd'];

  return timeValue * multiplier!;
};
