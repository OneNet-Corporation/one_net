import { collections } from '../config/firestoreCollections';
import { Timestamp } from 'firebase-admin/firestore';
import { generateToken } from '../utils/jwt';
import { AccessToken } from '../models/accessTokens';
import logger from '../utils/logger';

// Save Access Token in Firestore with Sync Expiry
export const saveAccessToken = async (
  userId: string
): Promise<{ token: string } | null> => {
  try {
    const { token, expiresAt } = generateToken(userId);

    if (!token) {
      logger.error(`Token generation failed for user ${userId}`);
      return null;
    }

    const accessTokenData: AccessToken = {
      token,
      createdAt: Timestamp.now(),
      expiresAt: Timestamp.fromMillis(expiresAt),
    };

    await collections.users
      .doc(userId)
      .collection('tokens')
      .doc('accessToken')
      .set(accessTokenData);

    return { token };
  } catch (error) {
    logger.error(`Error saving access token for user ${userId}:`, error);
    return null;
  }
};

// Get Access Token & Check Expiry
export const getUserAccessToken = async (
  userId: string
): Promise<string | null> => {
  try {
    const tokenDoc = await collections.users
      .doc(userId)
      .collection('tokens')
      .doc('accessToken')
      .get();

    if (!tokenDoc.exists) return null;

    const data = tokenDoc.data() as AccessToken;
    if (!data) return null;

    if (data.expiresAt.toMillis() < Date.now()) {
      await removeAccessToken(userId);
      return null;
    }

    return data.token;
  } catch (error) {
    logger.error(`Error retrieving access token for user ${userId}:`, error);
    return null;
  }
};

// Remove Access Token (Logout)
export const removeAccessToken = async (userId: string): Promise<void> => {
  try {
    await collections.users
      .doc(userId)
      .collection('tokens')
      .doc('accessToken')
      .delete();
  } catch (error) {
    logger.error(`Error removing access token for user ${userId}:`, error);
  }
};
