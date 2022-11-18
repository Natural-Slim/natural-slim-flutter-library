import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:natural_slim_flutter_library/models/water_tracking/request/recorded_water_request_model.dart';
import 'package:natural_slim_flutter_library/models/water_tracking/response/water_record_response_model.dart';

import '../../constants/api_constants.dart';
import '../../models/water_tracking/response/recorded_water_response_model.dart';
import '../../utils/helpers/exceptions_helper.dart';
import '../../utils/helpers/http_header_options_helper.dart';
import '../../utils/http_requests/http_requests.dart';

class WaterController {
  
  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();

  /// Method used to obtain the records by start and end date.
  /// It is also defined by receive for meters such as `perPage` which is defined to 10 records per page,
  /// `pageNumber` which is used to work the pagination of the data and `searchParameter` to search for a certain word in the records.
  Future<WaterRecordResponseModel> getUserWaters({required DateTime startDate, required DateTime endDate, int perPage = 10, required int pageNumber, required String searchParameter}) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/water/user-waters?StartDate=$startDate&EndDate=$endDate&SearchString=$searchParameter&PerPage=$perPage&PageNumber=$pageNumber',
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

  /// Method used to record a new trace of water
  Future<RecordedWaterResponseModel> postUserWaterRecord({required RecordedWaterRequestModel requestModel, String language = 'es'}) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.post(
        url: '${apiConstants.baseUrl}/api/water/user-water',
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

      RecordedWaterResponseModel parsedResponse = RecordedWaterResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

}