import 'dart:convert';
import 'package:jellycard/apis/posts_data_apis/post_api.dart';
import 'package:jellycard/models/post_model/post_model.dart';

class PostService {
  var res;
  Future<bool> getDataFromServer() async {
    var response = await getResponseFromPostApis();
    if (response.statusCode == 200) {
      res = json.decode(response.body);
      return true;
    }
    return false;
  }

  List<PostModel> allPosts() {
    List<PostModel> allPhoto = [];
    for (var i = 0; i < res.length; i++) {
      var postData = PostModel(
        id: res[i]["id"],
        title: res[i]["title"],
        body: res[i]["body"],
        userId: res[i]["userId"],
      );
      allPhoto.add(postData);
    }
    return allPhoto;
  }
}
