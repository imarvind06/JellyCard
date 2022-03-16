import 'package:flutter/cupertino.dart';
import 'package:jellycard/models/post_model/post_model.dart';
import 'package:jellycard/services/posts_service/post_service.dart';

class PostViewModel extends ChangeNotifier {
  final PostService _PostService;
  PostViewModel(this._PostService);
  List<PostModel> _allPost = [];
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<PostModel> get allPost => _allPost;

  Future<void> getData() async {
    debugPrint("Inside get Data po");
    _isLoading = true;
    bool _isGetDataFromApi = await _PostService.getDataFromServer();
    debugPrint("get data po $_isGetDataFromApi");

    if (_isGetDataFromApi) {
      debugPrint("data get po");
      _allPost = _PostService.allPosts();
      _isLoading = false;
      debugPrint("complete");
      notifyListeners();
    } else {
      debugPrint("Some Error");
    }
  }
}
