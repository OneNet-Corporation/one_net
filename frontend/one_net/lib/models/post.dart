import 'dart:convert';

class Post {
  final String profileImage;
  final String avatarBackColor;
  final String username;
  final String location;
  final String timeAgo;
  final String postText;
  final String? mediaUrl;
  final MediaType mediaType;
  final int likes;
  final int comments;
  final int shares;
  final bool isOnline;

  Post({
    required this.profileImage,
    required this.avatarBackColor,
    required this.username,
    required this.location,
    required this.timeAgo,
    required this.postText,
    this.mediaUrl,
    required this.mediaType,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.isOnline,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      profileImage: json['profileImage'] ?? '',
      avatarBackColor: json['avatarBackColor'] ?? '0xFFFFFFFF',
      username: json['username'] ?? '',
      location: json['location'] ?? '',
      timeAgo: json['timeAgo'] ?? '',
      postText: json['postText'] ?? '',
      mediaUrl: json['mediaUrl'],
      mediaType: json['mediaType'] == "image"
          ? MediaType.image
          : json['mediaType'] == "video"
              ? MediaType.video
              : MediaType.none,
      likes: json['likes'] ?? 0,
      comments: json['comments'] ?? 0,
      shares: json['shares'] ?? 0,
      isOnline: json['isOnline'] ?? false,
    );
  }

  static List<Post> fromJsonList(String jsonString) {
    final List<dynamic> data = json.decode(jsonString);
    return data.map((item) => Post.fromJson(item)).toList();
  }
}

enum MediaType { image, video, none }
