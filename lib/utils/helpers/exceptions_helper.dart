import 'dart:convert';
import 'package:http/http.dart' as http;

/// Exception handling helper class
class ExceptionsHelper{

  /// Method to handle custom exceptions.
  /// This method only covers the most common exceptions.
  /// Any other exception that is not covered will return an exception with a default message.
  static Exception validateApiException(http.Response response) {
    var responseJson = json.decode(response.body.toString());
    switch (response.statusCode) {
      case 400:
        throw ApiException(responseJson['detail'], responseJson['title'], responseJson['status']);
      case 401:
        throw ApiException(responseJson['detail'], responseJson['title'], responseJson['status']);
      case 404:
        throw ApiException(responseJson['detail'], responseJson['title'], responseJson['status']);
      default:
        throw ApiException('An error has occured. Please try again later or contact support.');
    }
  }
}

/// Class for custom exceptions.
/// Each exception is made up of a code [code], message [message] and title [title].
/// Each exception should be as clear and concise as possible.
class ApiException implements Exception {

  final int? _code;
  final String? _message;
  final String? _title;

  ApiException([this._message, this._title, this._code]);

  @override
  String toString() {
    return "$_code: $_title ${_message ?? ""}";
  }

  /// Error code
  int get code => _code!;
  
  /// Error message
  String get message => _message!;
  
  /// Error title
  String get title => _title!;

}