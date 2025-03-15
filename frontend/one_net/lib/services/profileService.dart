import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:one_net/models/userModel.dart';

class ProfileService {
  static Future<UserModel> getUserProfile(String userId, String token) async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/users/$userId'), // Dynamic userId
      headers: {
        'Authorization': 'Bearer $token', // Add Bearer Token here
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch user profile.');
    }
  }
}

