import 'package:flutter/cupertino.dart';
import 'package:jellycard/models/photo_model/photo_model.dart';
import 'package:jellycard/services/photo_service/photo_service.dart';

class PhotoViewModel extends ChangeNotifier {
  final PhotoService _photoService;
  PhotoViewModel(this._photoService);
  List<PhotoModel> _allPhoto = [];
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<PhotoModel> get allPhoto => _allPhoto;

  Future<void> getData() async {
    debugPrint("Inside get Data");
    _isLoading = true;
    bool _isGetDataFromApi = await _photoService.getDataFromServer();
    debugPrint("get data $_isGetDataFromApi");
    if (_isGetDataFromApi) {
      debugPrint("data get");
      _allPhoto = _photoService.allPhotos();
      _isLoading = false;
      debugPrint("complete");
      notifyListeners();
    } else {
      debugPrint("Some Error");
    }
  }
}
