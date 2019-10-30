import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

import 'Module/BaseResponse.dart';
final String base_url = 'http://onlinegirlschatmeet.com/api/';

Future callPostApi(String apiurl,String request_parameter)  async {
  // set up POST request arguments
    String url = base_url+apiurl;
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"email": "dummy@ninehertz.com", "password": "12345678", "device_type": "ANDROID", "device_id": "123456789", "address": "Ninehertzindia", "lat": "24.5223", "lng": "75.5666"}';  // make POST request
    Response response = await post(url, headers: headers, body: json);  // check the status code for the result
    int statusCode = response.statusCode;  // this API passes back the id of the new item added to the body
    String body = response.body;
    print(body);
    return body;
}




