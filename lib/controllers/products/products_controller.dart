import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:natural_slim_flutter_library/models/products/requests/user_product_request_model.dart';

import '../../constants/api_constants.dart';
import '../../models/products/responses/products_response_model.dart';
import '../../models/products/responses/user_products_response_model.dart';
import '../../utils/helpers/exceptions_helper.dart';
import '../../utils/helpers/http_header_options_helper.dart';
import '../../utils/http_requests/http_requests.dart';

class ProductsController {
  final HttpRequests _httpRequests = HttpRequests();
  static final ApiConstants _apiConstants = ApiConstants();

  /// Method to obtain the complete catalog of products
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

  /// Method to obtain the products that the user has related to his account.
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

  /// Method to add a product to the user's account. 
  /// This creates a relationship between the product and the user.
  Future<UserProductsResponseModel> postUserProduct(UserProductRequestModel request) async {
    try{
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();

      http.Response response = await _httpRequests.post(
        url: '${_apiConstants.baseUrl}/api/products/user-product', 
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
        body: jsonEncode(request)
      );

      if(response.statusCode != 201){
        ExceptionsHelper.validateApiException(response);
      }
      
      UserProductsResponseModel parsedResponse = UserProductsResponseModel.fromJson(jsonDecode(response.body));
      return parsedResponse;

    } catch (e){
      rethrow;
    }
  }

}