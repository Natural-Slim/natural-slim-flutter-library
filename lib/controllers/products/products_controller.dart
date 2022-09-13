import 'package:http/http.dart' as http;

import '../../constants/api_constants.dart';
import '../../models/products/responses/products_response_model.dart';
import '../../models/products/responses/user_products_response_model.dart';
import '../../utils/helpers/exceptions_helper.dart';
import '../../utils/helpers/http_header_options_helper.dart';
import '../../utils/http_requests/http_requests.dart';

class ProductsController {
  final HttpRequests _httpRequests = HttpRequests();
  static final ApiConstants _apiConstants = ApiConstants();

  /// Method to get the current status of the user program guide
  Future<List<ProductsResponseModel>> getProducts() async{
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await _httpRequests.get(
        url: '${_apiConstants.baseUrl}/api/products',
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      List<ProductsResponseModel> parsedResponse = ProductsResponseModel.productsDataResponseModelFromJson(response.body);
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }

  /// Method to get the current status of the user program guide
  Future<List<UserProductsResponseModel>> getUserProducts() async{
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await _httpRequests.get(
        url: '${_apiConstants.baseUrl}/api/products/user-products',
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      List<UserProductsResponseModel> parsedResponse = UserProductsResponseModel.userProductsResponseModelFromJson(response.body);
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }

}