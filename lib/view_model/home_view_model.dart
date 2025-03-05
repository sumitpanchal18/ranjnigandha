import 'package:get/get.dart';
import '../data/repository.dart';

class HomeViewModel extends GetxController {
  var isLoading = true.obs;
  var posts = [].obs;
  final Repository _repository = Repository();

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    isLoading(true);
    var data = await _repository.fetchPosts();
    if (data is List) {
      posts.value = data;
    }
    isLoading(false);
  }
}
