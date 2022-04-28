import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

import 'environment.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:dartz/dartz.dart';

class API {
  static Either<ErrorResponse, SuccessResponse> _bodyProcessor(
      Response response) {
    var body = jsonDecode(response.body);
    if (body["error"])
      return Left(ErrorResponse.fromResponse(response));
    else
      return Right(SuccessResponse.fromResponse(response));
  }

  static Future<Either<ErrorResponse, SuccessResponse>> get(String url,
      {withToken = false}) async {
    Future<Either<ErrorResponse, SuccessResponse>> send() async {
      Map<String, String> headers = {};
      var token = Hive.box('token');
      if (withToken) {
        headers["Authorization"] = "Bearer ${token.get('accessToken')}";
      }
      return _bodyProcessor(await http.get(Uri.parse(url), headers: headers));
    }

    var response = await send();

    return response.fold((l) async {
      if (l.errorCode.contains("JWT_ERROR")) {
        return (await _fetchAccessToken()).fold((l) => Left(l), (r) => send());
      } else {
        return Left(l);
      }
    }, (r) => Right(r));
  }

  static Future<Either<ErrorResponse, SuccessResponse>> post(
      String url, Map<String, dynamic> body,
      {withToken = false}) async {
    Future<Either<ErrorResponse, SuccessResponse>> send() async {
      var token = Hive.box('token');
      Map<String, String> headers = {"Content-Type": "application/json"};
      if (withToken) {
        headers["Authorization"] = "Bearer ${token.get('accessToken')}";
      }

      return _bodyProcessor(await http.post(Uri.parse(url),
          headers: headers, body: json.encode(body)));
    }

    var response = await send();
    return response.fold((l) async {
      if (l.errorCode.contains("JWT_ERROR")) {
        return (await _fetchAccessToken()).fold((l) => Left(l), (r) => send());
      } else {
        return Left(l);
      }
    }, (r) => Right(r));
  }

  static Future<Either<ErrorResponse, SuccessResponse>> formData(
      String url, Map<String, dynamic> body, MediaType contentType,
      {withToken = false}) async {
    var token = Hive.box('token');
    Future<Either<ErrorResponse, SuccessResponse>> send() async {
      var request = new http.MultipartRequest("POST", Uri.parse(url));
      if (withToken) {
        request.headers['Authorization'] = "Bearer ${token.get('accessToken')}";
      }

      for (var i in body.keys) {
        request.files.add(await http.MultipartFile.fromPath(i, body[i],
            contentType: contentType));
      }

      return _bodyProcessor(
          await http.Response.fromStream(await request.send()));
    }

    var response = await send();
    return response.fold((l) async {
      if (l.errorCode.contains("JWT_ERROR")) {
        return (await _fetchAccessToken()).fold((l) => Left(l), (r) => send());
      } else {
        return Left(l);
      }
    }, (r) => Right(r));
  }

  static Future<Either<ErrorResponse, SuccessResponse>>
      _fetchAccessToken() async {
    var token = Hive.box('token');
    var response = await http.get(Uri.parse(Environment.refreshTokenUrl),
        headers: {"Authorization": "Bearer ${token.get('refreshToken')}"});
    var body = jsonDecode(response.body);
    if (body["error"]) {
      return Left(ErrorResponse.fromResponse(response));
    } else {
      token.put('accessToken', body["results"]["accessToken"]);
      return Right(SuccessResponse.fromResponse(response));
    }
  }

  static responseAlertWhenError(
      {required BuildContext context,
      required Either<ErrorResponse, SuccessResponse> response,
      required Function(SuccessResponse r) whenSuccess,
        String? customErrorMessage
      }) {
    return response.fold((l) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Error!"),
                content: Text(customErrorMessage != null? customErrorMessage : l.message),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]);
          });
    }, whenSuccess);
  }
}

abstract class APIResponse {
  late int code;
  late String message;
  late bool error;

  APIResponse.fromResponse(Response response) {
    var body = jsonDecode(response.body);
    this.code = body["code"];
    this.message = body["message"];
    this.error = body["error"];
  }
}

class ErrorResponse extends APIResponse {
  late List<String> errorCode;

  ErrorResponse.fromResponse(Response response) : super.fromResponse(response) {
    var body = jsonDecode(response.body);
    this.errorCode = (body["errorCode"] as List).map((e) => e as String).toList();
  }
}

class SuccessResponse extends APIResponse {
  late dynamic results;

  SuccessResponse.fromResponse(Response response)
      : super.fromResponse(response) {
    var body = jsonDecode(response.body);
    this.results = body["results"];
  }
}
