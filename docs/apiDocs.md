# API Documentation

This document provides details about the available API endpoints, their parameters, and expected responses.

## Authentication

Most API endpoints require authentication via JWT (JSON Web Token). Include the token in the Authorization header:

```
Authorization: Bearer <your_jwt_token>
```

## Login APIs

### Login User
**Endpoint:** `/api/auth/login`  
**Method:** POST  
**Description:** Authenticates a user and returns a JWT token.

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "yourpassword"
}
```

**Success Response:**
```json
{
  "status": "success",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "userId": "user123"
}
```

**Error Response:**
```json
{
  "status": "error",
  "message": "Invalid email or password"
}
```

## Register APIs

### Register New User
**Endpoint:** `/api/auth/register`  
**Method:** POST  
**Description:** Creates a new user account.

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "user@example.com",
  "password": "securepassword"
}
```

**Success Response:**
```json
{
  "status": "success",
  "message": "User registered successfully",
  "userId": "user123"
}
```

**Error Response:**
```json
{
  "status": "error",
  "message": "Email already in use"
}
```

## Events APIs

### Get All Events
**Endpoint:** `/api/events`  
**Method:** GET  
**Description:** Retrieves a list of events.

**Query Parameters:**
- `page` (optional): Page number for pagination
- `limit` (optional): Number of events per page
- `category` (optional): Filter by event category

**Success Response:**
```json
{
  "status": "success",
  "count": 25,
  "data": [
    {
      "id": "event123",
      "title": "Community Meetup",
      "description": "Join us for our monthly community gathering",
      "date": "2023-12-15T18:00:00Z",
      "location": "City Center",
      "organizer": "user456"
    },
    // More events...
  ]
}
```

### Create Event
**Endpoint:** `/api/events`  
**Method:** POST  
**Description:** Creates a new event.

**Request Body:**
```json
{
  "title": "Community Meetup",
  "description": "Join us for our monthly community gathering",
  "date": "2023-12-15T18:00:00Z",
  "location": "City Center"
}
```

**Success Response:**
```json
{
  "status": "success",
  "eventId": "event123"
}
```

### Get Event Details
**Endpoint:** `/api/events/:id`  
**Method:** GET  
**Description:** Retrieves details for a specific event.

**Success Response:**
```json
{
  "status": "success",
  "data": {
    "id": "event123",
    "title": "Community Meetup",
    "description": "Join us for our monthly community gathering",
    "date": "2023-12-15T18:00:00Z",
    "location": "City Center",
    "organizer": {
      "id": "user456",
      "name": "Jane Smith"
    },
    "attendees": [
      {
        "id": "user789",
        "name": "Bob Johnson"
      }
      // More attendees...
    ]
  }
}
```

## Posts APIs

### Get All Posts
**Endpoint:** `/api/posts`  
**Method:** GET  
**Description:** Retrieves a list of posts.

**Query Parameters:**
- `page` (optional): Page number for pagination
- `limit` (optional): Number of posts per page
- `userId` (optional): Filter by user ID

**Success Response:**
```json
{
  "status": "success",
  "count": 42,
  "data": [
    {
      "id": "post123",
      "title": "My First Post",
      "content": "This is the content of my post",
      "author": {
        "id": "user456",
        "name": "Jane Smith"
      },
      "createdAt": "2023-11-05T14:48:00Z",
      "likes": 15
    },
    // More posts...
  ]
}
```

### Create Post
**Endpoint:** `/api/posts`  
**Method:** POST  
**Description:** Creates a new post.

**Request Body:**
```json
{
  "title": "My First Post",
  "content": "This is the content of my post"
}
```

**Success Response:**
```json
{
  "status": "success",
  "postId": "post123"
}
```

### Get Post Details
**Endpoint:** `/api/posts/:id`  
**Method:** GET  
**Description:** Retrieves details for a specific post.

**Success Response:**
```json
{
  "status": "success",
  "data": {
    "id": "post123",
    "title": "My First Post",
    "content": "This is the content of my post",
    "author": {
      "id": "user456",
      "name": "Jane Smith"
    },
    "createdAt": "2023-11-05T14:48:00Z",
    "likes": 15,
    "comments": [
      {
        "id": "comment456",
        "content": "Great post!",
        "author": "Bob Johnson",
        "createdAt": "2023-11-05T15:30:00Z"
      }
      // More comments...
    ]
  }
}
```

### Error Handling

All API endpoints use standard HTTP status codes:
- 200: Success
- 400: Bad request (invalid input data)
- 401: Unauthorized (authentication required)
- 403: Forbidden (insufficient permissions)
- 404: Not found
- 500: Server error

Error responses follow this format:
```json
{
  "status": "error",
  "message": "Description of what went wrong"
}
```