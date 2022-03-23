import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/program_guide/requests/answers_request.dart';
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
      String? token = await HttpHeaderOptions().getValidatedToken();
      String timeZone = HttpHeaderOptions.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${ApiConstants.baseUrl}/api/program-guide/status',
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
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
      String? token = await HttpHeaderOptions().getValidatedToken();
      String timeZone = HttpHeaderOptions.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${ApiConstants.baseUrl}/api/program-guide/steps?PerPage=$perPage&PageNumber=$pageNumber',
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
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
      String? token = await HttpHeaderOptions().getValidatedToken();
      String timeZone = HttpHeaderOptions.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${ApiConstants.baseUrl}/api/program-guide/user-program-step?ProgramStepId=$programStepId',
        headers: {
          'Content-Type':'application/json',
          'accept':'text/plain',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
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

  /// Method to save the answers of a certain step
  Future<void> postAnswers(AnswerRequest request) async {
    try{
      String timeZone = HttpHeaderOptions.getTimeZoneOffset();
      String? token = await HttpHeaderOptions().getValidatedToken();

      http.Response response = await httpRequests.post(
        url: '${ApiConstants.baseUrl}/api/program-guide/steps/answers', 
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
        body: jsonEncode(request)
      );

      if(response.statusCode != 201){
        ExceptionsHelper.validateApiException(response);
      }
    } catch (e){
      rethrow;
    }
  }

  /// Method that updates the state of a step and sets it to isCompleted = true
  Future<UserProgramStepResponse> putUserProgramStep(int programStepId) async{
    try{
      String? token = await HttpHeaderOptions().getValidatedToken();
      String timeZone = HttpHeaderOptions.getTimeZoneOffset();
      UserProgramStepResponse userProgramStepResponse = await getUserProgramStep(programStepId);

      http.Response response = await httpRequests.put(
        url: '${ApiConstants.baseUrl}/api/program-guide/user-program-step?ProgramStepId=$programStepId',
        headers: {
          'Content-Type':'application/json',
          'accept':'text/plain',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
        body: jsonEncode(userProgramStepResponse)
      );

      if(response.statusCode != 201) {
        ExceptionsHelper.validateApiException(response);
      }

      var res = response;

      UserProgramStepResponse parsedResponse = UserProgramStepResponse.fromJson(jsonDecode(response.body));
      return parsedResponse;
    } catch (e) {
      rethrow;
    }
  }
}