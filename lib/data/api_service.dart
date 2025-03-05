import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<dynamic> getPosts() async {
    try {
      Response response = await _dio.get("https://jsonplaceholder.typicode.com/posts");
      return response.data;
    } catch (error) {
      return {"error": error.toString()};
    }
  }
}
