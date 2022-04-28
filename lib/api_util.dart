import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

import 'environment.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class API {
  static Future<Response?> get(String url, {withToken = false}) async {
    Map<String, String> headers = {};
    var token = Hive.box('token');
    if (withToken) {
      headers["Authorization"] = "Bearer ${token.get('accessToken')}";
    }
    var response = await http.get(Uri.parse(url), headers: headers);
    var body = jsonDecode(response.body);
    if (body["error"] == true && body["message"] == "jwt expired") {
      var accessToken = await _fetchAccessToken();
      if (accessToken == null) {
        return null;
      } else {
        response = await http.get(Uri.parse(url), headers: headers);
      }
    }
    return response;
  }

  static Future<Response?> post(String url, Map<String, dynamic> body,
      {withToken = false}) async {
    var token = Hive.box('token');
    Map<String, String> headers = {"Content-Type": "application/json"};
    if (withToken) {
      headers["Authorization"] = "Bearer ${token.get('accessToken')}";
    }
    var response = await http.post(Uri.parse(url),
        headers: headers, body: json.encode(body));
    var responseBody = jsonDecode(response.body);
    if (responseBody["error"] == true &&
        responseBody["message"] == "jwt expired") {
      var accessToken = await _fetchAccessToken();
      if (accessToken == null) {
        return null;
      } else {
        response = await http.post(Uri.parse(url),
            headers: headers, body: json.encode(body));
      }
    }
    return response;
  }

  static Future<Response?> formData(String url, Map<String, dynamic> body, MediaType contentType, {withToken = false}) async {
    var token = Hive.box('token');
    dynamic send() async {
      var request = new http.MultipartRequest("POST", Uri.parse(url));
      if (withToken) {
        request.headers['Authorization'] = "Bearer ${token.get('accessToken')}";
      }

      for(var i in body.keys){
        request.files.add(await http.MultipartFile.fromPath(i, body[i], contentType: contentType));
      }

      return await http.Response.fromStream(await request.send());
    }

    var response = await send();

    var responseBody = jsonDecode(response.body);
    if (responseBody["error"] == true &&
        responseBody["message"] == "jwt expired") {
      var accessToken = await _fetchAccessToken();
      if (accessToken == null) {
        return null;
      } else {
        response = await send();
      }
    }
    return response;
  }

  static Future<String?> _fetchAccessToken() async {
    var token = Hive.box('token');
    var tempResponse = await http.get(Uri.parse(Environment.refreshTokenUrl),
        headers: {"Authorization": "Bearer ${token.get('refreshToken')}"});
    var tempBody = jsonDecode(tempResponse.body);
    if (tempBody["error"] == true && tempBody["message"] == "jwt expired") {
      return null;
    }
    token.put('accessToken', tempBody["results"]["accessToken"]);
    return tempBody["results"]["accessToken"];
  }
}
