import { Request, Response } from 'express';
import bcrypt from 'bcrypt';
import * as userService from '../services/userServices';
import * as authService from '../services/authService';
import logger from '../utils/logger';

interface AuthenticatedRequest extends Request {
  userId?: string;
}

// Register a new user
export const register = async (req: Request, res: Response): Promise<void> => {
  try {
    const { username, firstName, lastName, email, password, gender } = req.body;

    const existingUser = await userService.getUserByEmail(email);
    if (existingUser) {
      res.status(400).json({ message: 'User already exists' });
      logger.error('User already exists');
      return;
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const user = await userService.createUser({
      userId: '',
      username,
      firstName,
      lastName,
      email,
      passwordHash: hashedPassword,
      gender,
      followersCount: 0,
      followingCount: 0,
      totalPosts: 0,
      deletedAt: null,
    });

    if (!user.success) {
      res.status(500).json({ message: user.message });
      return;
    }

    // Get token directly from service (it generates & saves it internally)
    const tokenResult = await authService.saveAccessToken(user.userId!);
    if (!tokenResult) {
      logger.error(`Token generation failed for user ${user.userId}`);
      res.status(500).json({ message: "Token generation failed" });
      return;
    }
    logger.info(tokenResult.token);
    res.status(201).json({ message: 'User registered successfully', accessToken:tokenResult.token });
  } catch (error) {
    console.error('Error in register:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

// Login User
export const login = async (req: Request, res: Response): Promise<void> => {
  try {
    const { email, password } = req.body;

    const user = await userService.getUserByEmail(email);
    if (!user) {
      res.status(400).json({ message: 'Invalid credentials' });
      return;
    }

    const isMatch = await bcrypt.compare(password, user.passwordHash);
    if (!isMatch) {
      res.status(400).json({ message: 'Invalid credentials' });
      return;
    }

    const  tokenResult = await authService.saveAccessToken(user.userId!);
    if (!tokenResult) {
      logger.error(`Token generation failed for user ${user.userId}`);
      res.status(500).json({ message: "Token generation failed" });
      return;
    }
    logger.info(tokenResult);
    res.status(200).json({ message: 'User Logged in successfully', accessToken:tokenResult.token });
  } catch (error) {
    console.error('Error in login:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

// Logout User (Invalidate Token)
export const logout = async (
  req: AuthenticatedRequest,
  res: Response
): Promise<void> => {
  try {
    const userId = req.userId;
    await authService.removeAccessToken(userId!);
    res.status(200).json({ message: 'Logged out successfully' });
  } catch (error) {
    console.log('error while logging out', error);
    res.status(500).json({ message: 'Internal server error' });
  }
};
