import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:one_net/models/post_model.dart';

class PostService {
  static const String apiUrl =
      "https://localhost:5000/api/v1/post/"; // Replace with actual API URL

  Future<List<Post>> fetchPosts() async {
    try {
      // final response = await http.get(Uri.parse(apiUrl));

      // Mock response data
      final List<Map<String, dynamic>> mockResponse = [
        {
          "profileImage": "assets/images/users/alisha.png",
          "avatarBackColor": "0xFFDBC0DD",
          "username": "Alisha Doe",
          "location": "Los Angeles, CA",
          "timeAgo": "20h ago",
          "postText":
              "Community connections are very important and this platform has all for it.",
          "mediaUrl": "assets/images/posts/dogs.png",
          "mediaType": "image",
          "likes": 12000,
          "comments": 10000,
          "shares": 122,
          "isOnline": true
        },
        {
          "profileImage": "assets/images/users/JohnDoe2.png",
          "avatarBackColor": "0xFFB9CFD0",
          "username": "John Doe",
          "location": "Los Angeles, CA",
          "timeAgo": "20h ago",
          "postText":
              "Lorem ipsum dolor sit amet. Ut molestiaetio in dignissimos et iste dicta aut dolores veniam At one maxime fugiat. Ut internos toquiered consequatur in omnis of esse sed tempore odit ut optio enim!",
          "mediaType": "none",
          "likes": 12000,
          "comments": 10000,
          "shares": 122,
          "isOnline": true
        },
        {
          "profileImage": "assets/images/users/alisha.png",
          "avatarBackColor": "0xFFC2C7B8",
          "username": "Catherine",
          "location": "Los Angeles, CA",
          "timeAgo": "20h ago",
          "postText":
              "Community connections are very important and this platform has all for it.",
          "mediaUrl": "assets/images/posts/woman.png",
          "mediaType": "image",
          "likes": 12000,
          "comments": 10000,
          "shares": 122,
          "isOnline": true
        }
      ];

      if (mockResponse.isNotEmpty) {
        return mockResponse.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      throw Exception("Error fetching posts: $e");
    }
  }
}
