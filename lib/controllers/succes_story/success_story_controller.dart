
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:natural_slim_flutter_library/models/success_story/response/success_story_records_response_model.dart';
import 'package:natural_slim_flutter_library/models/success_story/response/sucess_story_response_model.dart';

import '../../constants/api_constants.dart';
import '../../models/success_story/resquest/success_story_request_model.dart';
import '../../utils/helpers/exceptions_helper.dart';
import '../../utils/helpers/http_header_options_helper.dart';
import '../../utils/http_requests/http_requests.dart';

class SuccessStoryController {
  
  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();

  /// Get success story by step id
  Future<SuccessStoryResponseModel> getSuccessStory(int stepId) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/success-story?StepId=$stepId', 
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
      );

      // We use the code 201 because we are creating a record
      if(response.statusCode != 200){ 
        ExceptionsHelper.validateApiException(response);
      }

      SuccessStoryResponseModel parsedResponse = SuccessStoryResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

  Future<SuccessStoryRecordsResponseModel> getAllSuccessStory(int perPage, int pageNumber) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/success-stories?PerPage=$perPage&PageNumber=$pageNumber', 
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
      );

      // We use the code 201 because we are creating a record
      if(response.statusCode != 200){ 
        ExceptionsHelper.validateApiException(response);
      }

      SuccessStoryRecordsResponseModel parsedResponse = SuccessStoryRecordsResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

  /// Method used to send information to the api with the success story request 
  Future<SuccessStoryResponseModel> postSuccessStory( SuccesStoryRequestModel succesStory) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.post(
        url: '${apiConstants.baseUrl}/api/success-story', 
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
        body: jsonEncode(succesStory)
      );

      // We use the code 201 because we are creating a record
      if(response.statusCode != 201){ 
        ExceptionsHelper.validateApiException(response);
      }

      SuccessStoryResponseModel parsedResponse = SuccessStoryResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }
  
}