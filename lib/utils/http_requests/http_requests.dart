import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:natural_slim_flutter_library/constants/api_constants.dart';

class HttpRequests{

  /// Method to consume an endpoint GET in the production API or on localhost
  Future<http.Response> get({required String url, required Map<String, String> headers}) async {
    try{
      Uri _url = Uri.parse(url);
      
      HttpClient client = HttpClient();

      // only when necessary
      if(ApiConstants.useLocalhost){
        if(kDebugMode || kReleaseMode){
          // This allows make queries an api running on localhost
          client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
        }
      }

      IOClient ioClient = IOClient(client);

      http.Response response = await ioClient.get(
        _url, 
        headers: headers
      );

      return response;
    }catch(e){
      rethrow;
    }
  }

  // Method to consume an endpoint POST in the production API or on localhost
  Future<http.Response> post({required String url, required Map<String, String> headers, Object? body}) async {
    try{
      Uri _url = Uri.parse(url);
      
      HttpClient client = HttpClient();

      // only when necessary
      if(ApiConstants.useLocalhost){
        if(kDebugMode || kReleaseMode){
          // This allows make queries an api running on localhost
          client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
        }
      }

      IOClient ioClient = IOClient(client);

      http.Response response = await ioClient.post(
        _url, 
        headers: headers,
        body: body
      );

      return response;
    }catch(e){
      rethrow;
    }
  }
  
  // Method to consume an endpoint PUT in the production API or on localhost
  Future<http.Response> put({required String url, required Map<String, String> headers, Object? body}) async {
    try{
      Uri _url = Uri.parse(url);
      
      HttpClient client = HttpClient();

      // only when necessary
      if(ApiConstants.useLocalhost){
        if(kDebugMode || kReleaseMode){
          // This allows make queries an api running on localhost
          client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
        }
      }

      IOClient ioClient = IOClient(client);

      http.Response response = await ioClient.put(
        _url, 
        headers: headers,
        body: body
      );

      return response;
    }catch(e){
      rethrow;
    }
  }
}