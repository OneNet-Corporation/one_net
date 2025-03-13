import { Timestamp } from 'firebase-admin/firestore';

export interface Event {
  eventId: string;
  userId: string; // Reference to user who created the event
  title: string;
  description: string;
  imageUrl: string;
  location: string;
  eventDate: Timestamp;
  isLive: boolean;
  totalAttendees: bigint;
  createdAt: Timestamp;
  updatedAt: Timestamp;
  deletedAt: Timestamp;
}
