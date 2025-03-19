import { Request, Response } from 'express';
import logger from '../utils/logger';
// userId
import { getUserId } from '../services/authService';

// Get all posts based on user_id
export const getPosts = async (req: Request, res: Response): Promise<void> => {
    try {
      // Log headers to debug
      console.log('Headers:', req.headers);
  
      // Ensure correct casing of userId in headers
      const userIdFromHeader = req.headers['userid'] || req.headers['userId']; // Case insensitive check
  
      if (!userIdFromHeader) {
        console.log('UserId not found in headers');
        res.status(400).json({ message: 'User ID is required in headers' });
        return;
      }
  
      // Simulating getUserId function (ensure it's properly handling input)
      const userId = getUserId({ userId: userIdFromHeader as string });
  
      console.log('Extracted userId:', userId); // Debug log
  
      res.status(200).json({ message: 'Get all posts based on user_id', userId });
    } catch (error) {
      logger.error('Error in getPosts:', error);
      res.status(500).json({ message: 'Internal server error' });
    }
  };

// Testing route for getPosts
// export const getPosts = async (req: Request, res: Response): Promise<void> => {
//   try {
//     res.status(200).json({ message: 'Get all posts' });
//   } catch (error) {
//     logger.error('Error in getPosts:', error);
//     res.status(500).json({ message: 'Internal server error' });
//   }
// };

// Get all post
export const getPost = async (req: Request, res: Response): Promise<void> => {
  try {
    res.status(200).json({ message: 'Get all post' });
  } catch (error) {
    logger.error('Error in getPost:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
};

// // Create a post
// export const createPost = async (req: Request, res: Response): Promise<void> => {
//   try {
//     res.status(200).json({ message: 'Create a post' });
//   } catch (error) {
//     logger.error('Error in createPost:', error);
//     res.status(500).json({ message: 'Internal server error' });
//   }
// }

// // Get a post by id
// export const getPost = async (req: Request, res: Response): Promise<void> => {
//   try {
//     res.status(200).json({ message: 'Get a post by id' });
//   } catch (error) {
//     logger.error('Error in getPost:', error);
//     res.status(500).json({ message: 'Internal server error' });
//   }
// }

// // Update a post by id
// export const updatePost = async (req: Request, res: Response): Promise<void> => {
//   try {
//     res.status(200).json({ message: 'Update a post by id' });
//   } catch (error) {
//     logger.error('Error in updatePost:', error);
//     res.status(500).json({ message: 'Internal server error' });
//   }
// }

// // Delete a post by id
// export const deletePost = async (req: Request, res: Response): Promise<void> => {
//   try {
//     res.status(200).json({ message: 'Delete a post by id' });
//   } catch (error) {
//     logger.error('Error in deletePost:', error);
//     res.status(500).json({ message: 'Internal server error' });
//   }
// }