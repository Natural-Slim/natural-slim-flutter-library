import 'dart:convert';

import 'package:natural_slim_flutter_library/models/meal/ingredient/response/meal_ingrediente_response_model.dart';
import 'package:natural_slim_flutter_library/models/meal/request/meal_request_model.dart';
import 'package:natural_slim_flutter_library/models/meal/response/meal_tracking_response_model.dart';
import 'package:http/http.dart' as http;

import '../../constants/api_constants.dart';
import '../../models/meal/ingredient/response/paginated_meal_ingredient_date_record_model.dart';
import '../../models/meal/response/meal_model.dart';
import '../../models/meal/response/meal_type_model.dart';
import '../../utils/helpers/exceptions_helper.dart';
import '../../utils/helpers/http_header_options_helper.dart';
import '../../utils/http_requests/http_requests.dart';

class MealController {
  
  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();

  /// Method used to obtain the records by start and end date.
  /// It is also defined by receive for meters such as `perPage` which is defined to 10 records per page,
  /// `pageNumber` which is used to work the pagination of the data and `searchParameter` to search for a certain word in the records.
  Future<MealTrackingResponseModel> getUserMealRecords({required DateTime startDate, required DateTime endDate, int perPage = 10, required int pageNumber, required String searchParameter}) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/meal/user-meal?StartDate=$startDate&EndDate=$endDate&PerPage=$perPage&PageNumber=$pageNumber',
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
      );

      // We use the code 200 because we are creating a record
      if(response.statusCode != 200){ 
        ExceptionsHelper.validateApiException(response);
      }

      MealTrackingResponseModel parsedResponse = MealTrackingResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

  /// Method used to record a new trace of meal
  Future<MealTrackingResponseModel> postUserMealRecord({required MealRequestModel requestModel, String language = 'es'}) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.post(
        url: '${apiConstants.baseUrl}/api/meal/user-meal',
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

      MealTrackingResponseModel parsedResponse = MealTrackingResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

  Future<List<MealTypeModel>> getMealType() async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/meal/meal-types',
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
      );

      // We use the code 200 because we are creating a record
      if(response.statusCode != 200){ 
        ExceptionsHelper.validateApiException(response);
      }

      List<MealTypeModel> parsedResponse = List<MealTypeModel>.from(jsonDecode(response.body).map((x) => MealTypeModel.fromJson(x)));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

  Future<PaginatedMealIngredientDateRecordsModel> getMealIngredients({int perPage = 10, required int pageNumber}) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/meal/ingredient?PerPage=$perPage&PageNumber=$pageNumber',
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
      );

      // We use the code 200 because we are creating a record
      if(response.statusCode != 200){ 
        ExceptionsHelper.validateApiException(response);
      }

      PaginatedMealIngredientDateRecordsModel parsedResponse = PaginatedMealIngredientDateRecordsModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

    Future<MealTrackingResponseModel> getMeals({int perPage = 10, required int pageNumber}) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/meal?PerPage=$perPage&PageNumber=$pageNumber',
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
      );

      // We use the code 200 because we are creating a record
      if(response.statusCode != 200){ 
        ExceptionsHelper.validateApiException(response);
      }

      MealTrackingResponseModel parsedResponse = MealTrackingResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }
}