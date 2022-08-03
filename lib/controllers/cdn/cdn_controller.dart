import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/google_cloud/requests/image_request_model.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';
import 'package:natural_slim_flutter_library/utils/helpers/http_header_options_helper.dart';
import 'package:natural_slim_flutter_library/utils/http_requests/http_requests.dart';

class CDNController {
  
  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();

  Future<List<String>> postImages(ImageRequestModel images) async {
    
    String? token = await HttpHeaderOptionsHelper.getValidatedToken();
    String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

    try{
      http.Response response = await httpRequests.post(
        url: '${apiConstants.baseUrl}/api/cdn/images',
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
        body: jsonEncode(images),
      );

      if(response.statusCode != 201) {
        ExceptionsHelper.validateApiException(response);
      }

      List<String> parsedResponse = List<String>.from(jsonDecode(response.body));
      return parsedResponse;
    } catch (e) {
      rethrow;
    }
  }

}