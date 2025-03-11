import { Timestamp } from "firebase-admin/firestore";

export interface Like {
  likeId: string;
  postId: string;   // Reference to the liked post
  userId: string;   // Reference to user who liked the post
  createdAt: Timestamp;
  updatedAt: Timestamp;
  deletedAt: Timestamp;
}