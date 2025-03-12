import { Timestamp } from 'firebase-admin/firestore';

export interface Post {
  postId: string; // Unique post identifier
  userId: string; // Reference to user who created the post
  caption?: string; // Optional text caption
  images?: string[]; // Array of image URLs
  videoUrl?: string; // Optional video URL
  location?: string;
  likesCount: number; // Number of likes
  commentsCount: number; // Number of comments
  hashtags?: string[]; // Array of hashtags for search
  isPublic: boolean; // True = public, False = private post
  createdAt: Timestamp;
  updatedAt: Timestamp;
  deletedAt: Timestamp;
}
