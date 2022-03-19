import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/program_guide/response/status_response_model.dart';
import 'package:natural_slim_flutter_library/models/program_guide/response/steps_response_model.dart';
import 'package:natural_slim_flutter_library/models/program_guide/response/user_program_step_response/user_program_step_response_model.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';
import 'package:natural_slim_flutter_library/utils/helpers/http_header_options.dart';
import 'package:natural_slim_flutter_library/utils/http_requests/http_requests.dart';

class ProgramGuideController {
  HttpRequests httpRequests = HttpRequests();

  Future<StatusResponse> getStatus() async{
    try{
      Uri url = Uri.parse('${ApiConstants.url}/api/program-guide/status');
      String? token = await HttpHeaderOptions().getValidatedToken();
      String timeZone = HttpHeaderOptions.getTimeZoneOffset();

      http.Response response = await http.get(
        url, 
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
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

  Future<ProgramStepsResponse> getSteps(int perPage, int pageNumber) async {
    try{
      Uri url = Uri.parse('${ApiConstants.url}/api/program-guide/steps?PerPage=$perPage&PageNumber=$pageNumber');
      String? token = await HttpHeaderOptions().getValidatedToken();
      String timeZone = HttpHeaderOptions.getTimeZoneOffset();

      http.Response response = await http.get(
        url, 
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization' : 'Bearer $token'
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }
      
      ProgramStepsResponse parsedResponse = ProgramStepsResponse.fromJson(jsonDecode(response.body));
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }

  Future<UserProgramStepResponse> getUserProgramStep(int programStepId) async{
    try{
      http.Response response = await httpRequests.get(
        url: '${ApiConstants.baseUrl}/api/program-guide/step/user-program-step?ProgramStepId=$programStepId',
        headers: {
          'Content-Type':'application/json',
          'accept':'text/plain',
          'x-Time-Zone': HttpHeaderOptions.getTimeZoneOffset(),
          'Authorization':'Bearer ${await HttpHeaderOptions.getToken()}'
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      UserProgramStepResponse parsedResponse = UserProgramStepResponse.fromJson(jsonDecode(response.body));
      
      return parsedResponse;
    } catch (e) {
      rethrow;
    }
  }
}