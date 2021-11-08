import 'dart:convert';
import 'dart:io';
import 'package:flutter_mvvm_architecture/utils/app_log.dart';
import 'package:flutter_mvvm_architecture/core/model.dart';
import 'package:flutter_mvvm_architecture/objects/user.dart';
import 'package:flutter_mvvm_architecture/widgets/custom_snack_bar.dart';
import 'package:http/http.dart' as http;

abstract class HttpServices {
  static String get _baseUrl => "http://192.168.1.6:1337/";

  static Map<String, String> get defaultHeader {
    Map<String, String> map = {"Authorization": "Bearer ${User.token}"};
    return map;
  }

  static Uri _url({required String endpoint}) {
    return Uri.parse(_baseUrl + endpoint);
  }

  static Future<void> _request<T extends Model>(
      {required Future<http.Response> futureResponse,
      required String requestName,
      Function(T data)? onSuccess,
      Function(int errorCode)? onError,
      Function()? onConnectionError}) async {
    try {
      T? model;
      http.Response response = await futureResponse;
      if (response.statusCode == 200) {
        AppLog.httpSuccess(requestName: requestName, response: response);
        model?.fromJson(jsonDecode(response.body));
        if (onSuccess != null) onSuccess(model!);
      } else {
        AppLog.httpError(requestName: requestName, response: response);
        if (onError != null) onError(response.statusCode);
      }
    } on SocketException catch (e) {
      AppLog.error("connection error : $e");
      if (onConnectionError != null) {
        onConnectionError();
      } else {
        CustomSnackBar.show(message: "check your internet connection");
      }
    }
  }

  static Future<void> get<T extends Model>(
      {required String endpoint,
      required String requestName,
      required Model model,
      Map<String, String>? headers,
      Function(T data)? onSuccess,
      Function(int)? onError,
      Function()? onConnectionError}) async {
    headers ??= defaultHeader;

    await _request<T>(
        futureResponse: http.get(_url(endpoint: endpoint), headers: headers),
        requestName: requestName,
        onSuccess: onSuccess,
        onConnectionError: onConnectionError,
        onError: onError);
  }

  static Future<void> post<T extends Model>(
      {required String endpoint,
      required String requestName,
      required Model model,
      Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      Function(T data)? onSuccess,
      Function(int)? onError,
      Function()? onConnectionError}) async {
    await _request<T>(
        futureResponse: http.post(_url(endpoint: endpoint),
            headers: headers, body: body, encoding: encoding),
        requestName: requestName,
        onError: onError,
        onConnectionError: onConnectionError,
        onSuccess: onSuccess);
  }

  static Future<void> put<T extends Model>(
      {required String endpoint,
      required String requestName,
      required Model model,
      Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      Function(T data)? onSuccess,
      Function(int)? onError,
      Function()? onConnectionError}) async {
    headers ??= defaultHeader;

    await _request<T>(
      futureResponse: http.put(_url(endpoint: endpoint),
          headers: headers, body: body, encoding: encoding),
      requestName: requestName,
      onSuccess: onSuccess,
      onConnectionError: onConnectionError,
      onError: onError,
    );
  }

  static Future<void> delete<T extends Model>(
      {required String endpoint,
      required String requestName,
      required Model model,
      Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      Function(T data)? onSuccess,
      Function(int)? onError,
      Function()? onConnectionError}) async {
    headers ??= defaultHeader;

    await _request<T>(
      futureResponse: http.delete(_url(endpoint: endpoint),
          headers: headers, body: body, encoding: encoding),
      requestName: requestName,
      onSuccess: onSuccess,
      onConnectionError: onConnectionError,
      onError: onError,
    );
  }
}
