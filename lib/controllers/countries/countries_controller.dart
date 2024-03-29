import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/countries/response/country_response_model.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';
import 'package:natural_slim_flutter_library/utils/http_requests/http_requests.dart';

class CountriesController {

  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();

  /// Method for obtaining data from countries, regions and localities
  Future<List<CountryResponseModel>> getCountries() async {
    try{
      http.Response response = await http.get(
        Uri.parse('${apiConstants.baseUrl}/api/countries'),
        headers: {
          'Content-Type': 'application/json',
          'ApiKey': apiConstants.apiKey,
        }
      );

      if(response.statusCode != 200){
        ExceptionsHelper.validateApiException(response);
      }

      List<CountryResponseModel> parsedResponse = CountryResponseModel.countryRegionsResponseModelFromJson(response.body);
      return parsedResponse;
    } catch (e) {
      rethrow;
    }
  }
  
}