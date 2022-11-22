import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:natural_slim_flutter_library/models/glucose_tracking/request/glucose_tracking_request_model.dart';
import 'package:natural_slim_flutter_library/models/glucose_tracking/response/recorded_glucose_tracking_response_model.dart';

import '../../constants/api_constants.dart';
import '../../utils/helpers/exceptions_helper.dart';
import '../../utils/helpers/http_header_options_helper.dart';
import '../../utils/http_requests/http_requests.dart';

class GlucoseController {

  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();

  /// Method used to record a new trace of glucose
  Future<RecordedGlucoseTrackingResponseModel> postUserGlucoseRecord({required GlucoseTrackingRequestModel requestModel, String language = 'es'}) async {
    try{

      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.post(
        url: '${apiConstants.baseUrl}/api/user-glucoses',
        body: jsonEncode(requestModel),
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token',
          'Language': language,
        },
      );

      // We use the code 201 because we are creating a record
      if(response.statusCode != 201){ 
        ExceptionsHelper.validateApiException(response);
      }

      RecordedGlucoseTrackingResponseModel parsedResponse = RecordedGlucoseTrackingResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }
  
}