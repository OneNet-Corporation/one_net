import admin from 'firebase-admin';
import { initializeApp, cert, App } from 'firebase-admin/app';
import { getAuth } from 'firebase-admin/auth';
import { getFirestore } from 'firebase-admin/firestore';
import path from 'path';
import logger from '../utils/logger';
// this is firebase config
// Load Firebase Admin SDK credentials
const serviceAccountPath = path.join(__dirname, 'firebase-admin-sdk.json');

let firebaseApp: App;
try {
  firebaseApp = initializeApp({
    credential: cert(serviceAccountPath),
    storageBucket: process.env.FIREBASE_STORAGE_BUCKET,
  });
  logger.info('Firebase Admin Initialized Successfully.');
} catch (error) {
  logger.error('Firebase Admin Initialization Failed:', error);
  process.exit(1);
}

const db = getFirestore(firebaseApp);
const auth = getAuth(firebaseApp);

export const handleFirestoreError = (
  error: unknown
): { success: boolean; message: string; code: string } => {
  if (error instanceof Error) {
    logger.error('Firestore Error:', error.message);
    return {
      success: false,
      message: error.message || 'Firestore operation failed.',
      code: 'firestore_error',
    };
  }
  return {
    success: false,
    message: 'Unknown Firestore error',
    code: 'unknown',
  };
};

export const handleAuthError = (
  error: unknown
): { success: boolean; message: string; code: string } => {
  if (error instanceof Error) {
    logger.error('Firebase Auth Error:', error.message);
    return {
      success: false,
      message: error.message || 'Authentication error.',
      code: 'auth_error',
    };
  }
  return {
    success: false,
    message: 'Unknown Firebase Auth error',
    code: 'unknown',
  };
};


export { admin, db, auth };
