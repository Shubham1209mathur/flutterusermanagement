import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Module/LoginResponse.dart';
final String base_url = 'http://onlinegirlschatmeet.com/';
/*Future<Stream<LoginResponse>> call() async {

  callapi(url+"login");

}*/
Future callapi (String url) async {

  final client = new http.Client();
  final streamedRest = await client.send(
      http.Request('get', Uri.parse(base_url+url))
  );

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => LoginResponse.fromJSON(data));
}

