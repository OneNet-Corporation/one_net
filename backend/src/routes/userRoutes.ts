import express, { Request, Response } from 'express';
import * as userController from '../controllers/userController';
import { validateMiddleware } from '../middlerwares/validateMiddleware';
import { registerSchema, loginSchema } from '../validators/userValidator';
import { ZodSchema } from 'zod';
import { authenticateUser } from '../middlerwares/authMiddleware';

const router = express.Router();

interface AuthenticatedRequest extends Request {
  userId?: string;
}
// Define route-to-schema mapping
const userValidationSchemas: { [key: string]: ZodSchema } = {
  '/register': registerSchema,
  '/login': loginSchema,
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
