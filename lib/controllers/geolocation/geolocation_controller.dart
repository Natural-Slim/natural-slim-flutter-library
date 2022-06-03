import 'package:http/http.dart' as http;
import 'package:natural_slim_flutter_library/constants/api_constants.dart';

import 'package:natural_slim_flutter_library/models/geolocation/response/geolocation_response_model.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';
import 'package:natural_slim_flutter_library/utils/helpers/http_header_options_helper.dart';

class GeolocationController {

  /// Method to get current user location
  static Future<GeoLocationResponseModel> getGeolocation(String ip) async{
    try{
      http.Response response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/api/geolocation?Ip=$ip'),
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': '0',
          'ApiKey': ApiConstants.apiKey,
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      GeoLocationResponseModel parsedResponse = GeoLocationResponseModel.geoLocationResponseModelFromJson(response.body);
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }

}