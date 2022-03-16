import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jellycard/utils/constants.dart';

Future<Response> getResponseFromPostApis() async {
  var response = await http.get(Uri.parse(postUrl));
  return response;
}
