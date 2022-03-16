import 'dart:convert';
import 'package:jellycard/apis/photo_data_apis/photo_api.dart';
import 'package:jellycard/models/photo_model/photo_model.dart';

class PhotoService {
  var res;
  Future<bool> getDataFromServer() async {
    var response = await getResponseFromPhotoApis();
    if (response.statusCode == 200) {
      res = json.decode(response.body);
      return true;
    }
    return false;
  }

  List<PhotoModel> allPhotos() {
    List<PhotoModel> allPhoto = [];
    for (var i = 0; i < res.length; i++) {
      var photoData = PhotoModel(
          albumId: res[i]["albumId"],
          id: res[i]["id"],
          title: res[i]["title"],
          url: res[i]["url"],
          thumbnailUrl: res[i]["thumbnailUrl"]);
      allPhoto.add(photoData);
    }
    return allPhoto;
  }
}
