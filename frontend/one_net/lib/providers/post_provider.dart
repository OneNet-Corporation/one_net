import 'package:flutter/material.dart';
import 'package:one_net/models/post_model.dart';
import 'package:one_net/services/post_service.dart';

class PostProvider with ChangeNotifier {
  final PostService _postService = PostService();
  List<Post> _posts = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> loadPosts() async {
    if (_isLoading) return;
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _posts = await _postService.fetchPosts();
    } catch (error) {
      _errorMessage = error.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
