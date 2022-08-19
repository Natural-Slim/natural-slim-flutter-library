
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:natural_slim_flutter_library/models/success_story/response/sucess_story_response_model.dart';

import '../../constants/api_constants.dart';
import '../../models/success_story/resquest/success_story_request_model.dart';
import '../../utils/helpers/exceptions_helper.dart';
import '../../utils/helpers/http_header_options_helper.dart';
import '../../utils/http_requests/http_requests.dart';

class SuccessStoryController {
  
  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();

    /// Method to consult the API if the username and password is correct to be able to enter the app
  Future<SuccesStoryResponseModel?> postSuccessStory( SuccesStoryRequestModel succesStory) async {
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

      if(response.statusCode != 201){ 
        ExceptionsHelper.validateApiException(response);
      }

      SuccesStoryResponseModel parsedResponse = SuccesStoryResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }
  
}