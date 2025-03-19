import { db } from './firebase';

// Centralized Firestore Collection References
export const collections = {
  users: db.collection('users'),
  posts: db.collection('posts'),
  comments: (postId: string) => db.collection(`posts/${postId}/comments`),
  likes: (postId: string) => db.collection(`posts/${postId}/likes`),
  events: db.collection('events'),
};
