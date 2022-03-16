import 'dart:convert';
import 'package:http/http.dart' as http;

class ExceptionsHelper{

  /// Method to handle custom exceptions
  static Exception validateApiException(http.Response response) {
    var responseJson = json.decode(response.body.toString());
    switch (response.statusCode) {
      case 400:
        throw ApiException(responseJson['detail'], responseJson['title'], responseJson['status']);
      case 401:
        throw ApiException(responseJson['detail'], responseJson['title'], responseJson['status']);
      case 404:
        throw ApiException(responseJson['detail'], responseJson['title'], responseJson['status']);
      case 500:
        throw ApiException(responseJson['detail'], responseJson['title'], responseJson['status']);
      default:
        throw ApiException('An error has occured. Please try again later or contact support.');
    }
  }

}

class ApiException implements Exception {

  final int? _code;
  final String? _message;
  final String? _title;

  ApiException([this._message, this._title, this._code]);

  String toString() {
    return "$_code: $_title $_message";
  }

  int get code => _code!;
  String get message => _message!;
  String get title => _title!;

}