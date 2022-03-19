import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class HttpRequests{
  Future<http.Response> get({required String url, required Map<String, String> headers}) async {
    try{
      Uri _url = Uri.parse(url);
      
      HttpClient client = HttpClient();

      // only when necessary
      if(kDebugMode || kReleaseMode){
        // This allows make queries an api running on localhost
        client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
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
}