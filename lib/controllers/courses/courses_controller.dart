import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:natural_slim_flutter_library/models/courses/response/courses_response_model.dart';

import '../../constants/api_constants.dart';
import '../../utils/helpers/exceptions_helper.dart';
import '../../utils/helpers/http_header_options_helper.dart';
import '../../utils/http_requests/http_requests.dart';

class CoursesController {
  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();

  /// Method to obtain the information to draw each of the steps and the data of each one.
  Future<List<CoursesResponseModel>> getCourses() async{
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/courses',
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      List<CoursesResponseModel> parsedResponse = CoursesResponseModel.coursesResponseModelFromJson(response.body);
      return parsedResponse;
    } catch (e) {
      rethrow;
    }
  }
  
}