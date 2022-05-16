import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/models/geolocation/response/geolocation_response_model.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';

class GeolocationController {

  /// Method to get current user location
  static Future<GeoLocationResponseModel> getGeolocation() async{
    try{
      http.Response response = await http.get(
        Uri.parse('https://geolocation-db.com/json'),
        headers: {
          'Content-Type':'application/json'
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