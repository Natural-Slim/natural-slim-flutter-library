import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:natural_slim_flutter_library/models/water_tracking/response/water_record_response_model.dart';

import '../../constants/api_constants.dart';
import '../../utils/helpers/exceptions_helper.dart';
import '../../utils/helpers/http_header_options_helper.dart';
import '../../utils/http_requests/http_requests.dart';

class WaterController {
  
  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();

  /// 
  Future<WaterRecordResponseModel> getUserWaters({required DateTime startDate, required DateTime endDate, int perPage = 10, int pageNumber = 1}) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/water/user-waters?StartDate=$startDate&EndDate=$endDate&PerPage=$perPage&PageNumber=$pageNumber',
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

      WaterRecordResponseModel parsedResponse = WaterRecordResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

}