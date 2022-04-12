import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/consulting/response/hours_location_available_model.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';
import 'package:natural_slim_flutter_library/utils/helpers/http_header_options_helper.dart';
import 'package:natural_slim_flutter_library/utils/http_requests/http_requests.dart';

/// Consulting Service Endpoint Controller
class ConsultingController{
  HttpRequests httpRequests = HttpRequests();

  /// Method to obtain all the necessary information to schedule an appointment (Dates and hours)
  Future<List<HoursLocationAvailableResponse>> getHoursLocationAvailable(int limitDays, int locationId) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();
      
      http.Response response = await httpRequests.get(
        url: '${ApiConstants.baseUrl}/api/consulting/hours-location-available?LimitDays=$limitDays&LocationId=$locationId',
        headers: {
          'Content-Type': 'application/json',
          'x-Time-Zone': timeZone,
          'Authorization': 'Bearer $token'
        }
      );

      if(response.statusCode != 200){
        ExceptionsHelper.validateApiException(response);
      }

      List<HoursLocationAvailableResponse> parsedResponse = hoursLocationAvailableResponseFromJson(response.body);
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }

}