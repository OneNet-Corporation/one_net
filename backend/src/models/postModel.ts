import { Timestamp } from 'firebase-admin/firestore';

export interface Post {
  postId: string; // Unique post identifier (Firestore document ID)
  userId: string; // Firestore reference path to the user (e.g., "/users/userId")
  text?: string; // Optional text content
  image?: string; // Image URL (string) (Assuming only one image per post)
  video?: string; // Video URL (optional)
  location?: string; // Location of the post
  likeCount: number; // Number of likes
  commentsCount: number; // Number of comments
  createdAt: Timestamp; // Timestamp when the post was created
  updatedAt: Timestamp; // Timestamp when the post was last updated
  deletedAt?: Timestamp; // Timestamp when the post was deleted (optional)
}

export interface Like {
  likeId: string; // Unique identifier for the like (Firestore document ID)
  userId: string; // Firestore reference path to the user (e.g., "/users/userId")
  isLiked: boolean; // Boolean flag (true when the user likes the post)
  createdAt: Timestamp; // Timestamp when the like was added
}


export interface Comment {
  commentId: string; // Unique identifier for the comment (Firestore document ID)
  userId: string; // Firestore reference path to the user (e.g., "/users/userId")
  text: string; // The comment text
  createdAt: Timestamp; // Timestamp when the comment was created
  updatedAt?: Timestamp; // Timestamp if the comment was edited
  deletedAt?: Timestamp; // Timestamp if the comment was deleted
}