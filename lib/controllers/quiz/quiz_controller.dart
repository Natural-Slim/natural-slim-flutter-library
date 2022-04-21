import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/quiz/responses/adsources_response_model.dart';
import 'package:natural_slim_flutter_library/models/quiz/responses/attributes_response_model.dart';
import 'package:natural_slim_flutter_library/utils/http_requests/http_requests.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';

class QuizController{
  HttpRequests httpRequests = HttpRequests();

  /// Method to get all adsources records
  Future<List<AdsourcesResponseModel>> getAdsources() async{
    try{
      http.Response response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/api/quiz/adsources'),
        headers: {
          'Content-Type':'application/json',
          'ApiKey': ApiConstants.apiKey,
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      List<AdsourcesResponseModel> parsedResponse = AdsourcesResponseModel.adsourcesResponseModelFromJson(response.body);
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }

  /// Method to obtain all the attributes of the Quiz
  Future<List<AttributesResponseModel>> getAttributes(int gid) async{
    try{
      http.Response response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/api/quiz/attributes?Gid=$gid'),
        headers: {
          'Content-Type':'application/json',
          'ApiKey': ApiConstants.apiKey,
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