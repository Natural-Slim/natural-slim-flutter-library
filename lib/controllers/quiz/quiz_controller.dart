import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/quiz/responses/attributes_response_model.dart';
import 'package:natural_slim_flutter_library/utils/http_requests/http_requests.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';

class QuizController{
  HttpRequests httpRequests = HttpRequests();

  /// Method to get the current status of the user program guide
  Future<List<AttributesResponseModel>> getAttributes(int gid) async{
    try{
      http.Response response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/api/quiz/attributes?Gid=$gid'),
        headers: {
          'Content-Type':'application/json',
          'ApiKey': ApiConstants.apiKey,
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      List<AttributesResponseModel> parsedResponse = AttributesResponseModel.attributesResponseModelFromJson(response.body);
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }

}