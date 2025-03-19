import { Request, Response, NextFunction } from 'express';
import { verifyToken } from '../utils/jwt';
import { getUserAccessToken } from '../services/authService';

interface AuthenticatedRequest extends Request {
  userId?: string;
}

// Middleware to verify JWT token
export const authenticateUser = async (
  req: AuthenticatedRequest,
  res: Response,
  next: NextFunction
): Promise<void> => {
  const token = req.headers.authorization?.split(' ')[1];

  if (!token) {
    res.status(401).json({ message: 'Unauthorized: No token provided' });
    return;
  }

  try {
    const decoded = verifyToken(token) as { userId: string } | null;

    if (!decoded || !decoded.userId) {
      res.status(401).json({ message: 'Unauthorized: Invalid token' });
      return;
    }

    const storedToken = await getUserAccessToken(decoded.userId);
    if (storedToken !== token) {
      res.status(401).json({ message: 'Unauthorized: Token mismatch' });
      return;
    }

    req.userId = decoded.userId; // Properly typed userId
    next();
  } catch (error) {
    console.error('JWT Verification Error:', error);
    res
      .status(401)
      .json({ message: 'Unauthorized: Token verification failed' });
    return;
  }
};
