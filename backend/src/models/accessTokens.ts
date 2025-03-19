import { Timestamp } from 'firebase-admin/firestore';

export interface AccessToken {
  token: string;
  createdAt: Timestamp;
  expiresAt: Timestamp;
}
