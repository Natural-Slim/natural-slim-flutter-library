import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/program_guide/requests/answers_request_model.dart';
import 'package:natural_slim_flutter_library/models/program_guide/responses/status_response_model.dart';
import 'package:natural_slim_flutter_library/models/program_guide/responses/steps_response_model.dart';
import 'package:natural_slim_flutter_library/models/program_guide/responses/user_program_step_response/user_program_step_response_model.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';
import 'package:natural_slim_flutter_library/utils/helpers/http_header_options_helper.dart';
import 'package:natural_slim_flutter_library/utils/http_requests/http_requests.dart';

class ProgramGuideController {
  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();

  /// Method to get the current status of the user program guide
  Future<StatusResponseModel> getStatus() async{
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/program-guide/status',
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      StatusResponseModel parsedResponse = StatusResponseModel.fromJson(jsonDecode(response.body));
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }

  /// Method to get the list of steps and the current status of each one
  Future<ProgramStepsResponseModel> getSteps(int perPage, int pageNumber) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/program-guide/steps?PerPage=$perPage&PageNumber=$pageNumber',
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }
      
      ProgramStepsResponseModel parsedResponse = ProgramStepsResponseModel.fromJson(jsonDecode(response.body));
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }

  /// Method to obtain the information to draw each of the steps and the data of each one.
  Future<UserProgramStepResponseModel> getUserProgramStep(int programStepId) async{
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/program-guide/user-program-step?ProgramStepId=$programStepId',
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

      UserProgramStepResponseModel parsedResponse = UserProgramStepResponseModel.fromJson(jsonDecode(response.body));
      return parsedResponse;
    } catch (e) {
      rethrow;
    }
  }

  /// Method to save the answers of a certain step
  Future<void> postAnswers(AnswerRequestModel request) async {
    try{
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();

      http.Response response = await httpRequests.post(
        url: '${apiConstants.baseUrl}/api/program-guide/steps/answers', 
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
  Future<UserProgramStepResponseModel> putUserProgramStep(int programStepId) async{
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();
      UserProgramStepResponseModel userProgramStepResponse = await getUserProgramStep(programStepId);

      http.Response response = await httpRequests.put(
        url: '${apiConstants.baseUrl}/api/program-guide/user-program-step?ProgramStepId=$programStepId',
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

      UserProgramStepResponseModel parsedResponse = UserProgramStepResponseModel.fromJson(jsonDecode(response.body));
      return parsedResponse;
    } catch (e) {
      rethrow;
    }
  }
}