import { Timestamp } from 'firebase-admin/firestore';

export interface Comment {
  commentId: string; // Unique identifier for the comment
  postId: string; // Reference to post being commented on
  userId: string; // Reference to user who made the comment
  text: string; // Comment text
  createdAt: Timestamp;
  updatedAt: Timestamp;
  deletedAt: Timestamp;
}
