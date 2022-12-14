import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:natural_slim_flutter_library/models/size/response/recorded_size_tracking_response_model.dart';
import 'package:natural_slim_flutter_library/models/size/response/size_tracking_response_model.dart';
import 'package:natural_slim_flutter_library/models/water_tracking/response/water_record_response_model.dart';

import '../../constants/api_constants.dart';
import '../../models/size/request/size_tracking_request_model.dart';
import '../../utils/helpers/exceptions_helper.dart';
import '../../utils/helpers/http_header_options_helper.dart';
import '../../utils/http_requests/http_requests.dart';

class SizeController {
  
  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();

  /// Method used to obtain the records by start and end date.
  /// It is also defined by receive for meters such as `perPage` which is defined to 10 records per page,
  /// `pageNumber` which is used to work the pagination of the data and `searchParameter` to search for a certain word in the records.
  Future<SizeTrackingResponseModel> getUserSizeRecords({required DateTime startDate, required DateTime endDate, int perPage = 10, required int pageNumber, required String searchParameter}) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/size/user-sizes?StartDate=$startDate&EndDate=$endDate&SearchString=$searchParameter&PerPage=$perPage&PageNumber=$pageNumber',
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

      SizeTrackingResponseModel parsedResponse = SizeTrackingResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

  /// Method used to record a new trace of size
  Future<RecordedSizeTrackingResponseModel> postUserSizeRecord({required SizeTrackingRequestModel requestModel, String language = 'es'}) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.post(
        url: '${apiConstants.baseUrl}/api/size/user-size',
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

      RecordedSizeTrackingResponseModel parsedResponse = RecordedSizeTrackingResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

}