import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jellycard/utils/constants.dart';

Future<Response> getResponseFromPhotoApis() async {
  var response = await http.get(Uri.parse(photoUrl));
  return response;
}
