import '../data/api_service.dart';

class Repository {
  final ApiService _apiService = ApiService();

  Future<dynamic> fetchPosts() async {
    return await _apiService.getPosts();
  }
}
