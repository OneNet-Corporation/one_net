class UserModel {
  final String userId;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String? avatarUrl;
  final String? contactNo;
  final String gender;
  final String? bio;
  final int followersCount;
  final int followingCount;
  final int totalPosts;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isUpdated;
  final DateTime? deletedAt;

  UserModel({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.avatarUrl,
    this.contactNo,
    required this.gender,
    this.bio,
    required this.followersCount,
    required this.followingCount,
    required this.totalPosts,
    required this.createdAt,
    required this.updatedAt,
    required this.isUpdated,
    this.deletedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as String,
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      contactNo: json['contactNo'] as String?,
      gender: json['gender'] as String,
      bio: json['bio'] as String?,
      followersCount: json['followersCount'] as int,
      followingCount: json['followingCount'] as int,
      totalPosts: json['totalPosts'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          json['createdAt']['_seconds'] * 1000),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
          json['updatedAt']['_seconds'] * 1000),
      isUpdated: json['isUpdated'] as bool,
      deletedAt: json['deletedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              json['deletedAt']['_seconds'] * 1000)
          : null,
    );
  }
}
