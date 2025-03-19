import express, { Request, Response } from 'express';
import * as userController from '../controllers/userController';
import { validateMiddleware } from '../middlerwares/validateMiddleware';
import { registerSchema, loginSchema } from '../validators/userValidator';
import { ZodSchema } from 'zod';
import { authenticateUser } from '../middlerwares/authMiddleware';
import * as postController from '../controllers/postController';

const router = express.Router();

interface AuthenticatedRequest extends Request {
  userId?: string;
}
// Define route-to-schema mapping
const userValidationSchemas: { [key: string]: ZodSchema } = {
  '/register': registerSchema,
  '/login': loginSchema,
  '/posts': loginSchema,
  '/refresh-token': loginSchema,
};

// Apply middleware dynamically based on route
router.post(
  '/register',
  validateMiddleware(userValidationSchemas),
  userController.register
);
router.post(
  '/login',
  validateMiddleware(userValidationSchemas),
  userController.login
);

// Refresh token route
router.post('/refresh-token',
  validateMiddleware({ '/refresh-token': loginSchema }),
  userController.refreshToken);

// Testing route for refreshToken
// router.get('/refresh-token', userController.refreshToken);

// Posts route
router.get('/posts',
  validateMiddleware(userValidationSchemas), 
  postController.getPosts);

// Future routes
// router.post('/posts', authenticateUser, userController.createPost);
// router.get('/posts/:postId', authenticateUser, userController.getPost);
// router.put('/posts/:postId', authenticateUser, userController.updatePost);
// router.delete('/posts/:postId', authenticateUser, userController.deletePost);

router.post('/logout', authenticateUser, userController.logout);

//  added for testing authenticated route containing jwt token
router.get(
  '/profile',
  authenticateUser,
  (req: AuthenticatedRequest, res: Response) => {
    res.json({ message: 'Authenticated', userId: req.userId });
  }
);

export default router;
