import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/program_guide/response/status_response_model.dart';
import 'package:natural_slim_flutter_library/utils/exceptions_helper.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_token_shared_preferences.dart';

class ProgramGuideController {

  Future<StatusResponse> getStatus() async{
    try{
      Uri url = Uri.parse('${ApiConstants.url}/api/program-guide/status');
      String? token = await UserTokenSharedPreferences().returnSavedToken();

      http.Response response = await http.get(
        url, 
        headers: {
          'Content-Type':'application/json',
          'Authorization' : 'Bearer $token'
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      StatusResponse parsedResponse = StatusResponse.fromJson(jsonDecode(response.body));
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }

}