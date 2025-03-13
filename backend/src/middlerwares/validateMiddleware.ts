import { Request, Response, NextFunction } from 'express';
import { ZodSchema } from 'zod';

// Define a type for schema mapping
interface SchemaMap {
  [key: string]: ZodSchema; // More specific type instead of `ZodType<any, any>`
}

// Middleware to validate request body dynamically based on route
export const validateMiddleware = (schemaMap: SchemaMap) => {
  return (req: Request, res: Response, next: NextFunction): void => {
    try {
      const schema = schemaMap[req.path];

      if (!schema) {
        res
          .status(500)
          .json({ message: 'Validation schema not defined for this route' });
        return;
      }

      const validation = schema.safeParse(req.body);
      if (!validation.success) {
        res.status(400).json({
          message: 'Validation failed',
          errors: validation.error.format(),
        });
        return;
      }

      next(); // Proceed to next middleware/controller if validation passes
    } catch (error) {
      console.error('Validation middleware error:', error);
      res.status(500).json({ message: 'Internal server error' });
    }
  };
};
