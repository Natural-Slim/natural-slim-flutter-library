import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/quiz/requests/attribute_entry_request_model.dart';
import 'package:natural_slim_flutter_library/models/quiz/requests/entry_request_model.dart';
import 'package:natural_slim_flutter_library/models/quiz/responses/adsources_response_model.dart';
import 'package:natural_slim_flutter_library/models/quiz/responses/attribute_entry_response_model.dart';
import 'package:natural_slim_flutter_library/models/quiz/responses/attributes_response_model.dart';
import 'package:natural_slim_flutter_library/models/quiz/responses/country_response_model.dart';
import 'package:natural_slim_flutter_library/utils/http_requests/http_requests.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';

class QuizController{
  HttpRequests httpRequests = HttpRequests();

  /// Method to get all adsources records
  Future<List<AdsourcesResponseModel>> getAdsources() async{
    try{
      http.Response response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/api/quiz/adsources'),
        headers: {
          'Content-Type':'application/json',
          'ApiKey': ApiConstants.apiKey,
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      List<AdsourcesResponseModel> parsedResponse = AdsourcesResponseModel.adsourcesResponseModelFromJson(response.body);
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }

  /// Method to obtain all the attributes of the Quiz
  Future<List<AttributesResponseModel>> getAttributes(int gid, String language) async{
    try{
      http.Response response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/api/quiz/attributes?Gid=$gid'),
        headers: {
          'Content-Type':'application/json',
          'ApiKey': ApiConstants.apiKey,
          'Language': language
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      List<AttributesResponseModel> parsedResponse = AttributesResponseModel.attributesResponseModelFromJson(response.body);
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }

  /// Method for obtaining data from countries, regions and localities
  Future<List<CountryResponseModel>> getCountries() async {
    try{
      http.Response response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/api/quiz/countries'),
        headers: {
          'Content-Type': 'application/json',
          'ApiKey': ApiConstants.apiKey,
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

  /// Method to send the data of attributes entries and the contact form
  Future<AttributeEntryResponseModel> postAttributesEntries(AttributeEntryRequestModel attributeEntry) async {
    try{
      http.Response response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}/api/quiz/attribute-entries'),
        headers: {
          'Content-Type': 'application/json',
          'ApiKey': ApiConstants.apiKey,
        },
        body: jsonEncode(attributeEntry),
      );

      if(response.statusCode != 201) {
        ExceptionsHelper.validateApiException(response);
      }

      AttributeEntryResponseModel parsedResponse = AttributeEntryResponseModel.attributeEntryResponseModelFromJson(response.body);
      return parsedResponse;
    } catch (e) {
      rethrow;
    }
  }

  /// Method to send the form data to schedule an appointment
  Future<String> putEntry(EntryRequestModel entry) async {
    try{
      http.Response response = await http.put(
        Uri.parse('${ApiConstants.baseUrl}/api/quiz/entry'),
        headers: {
          'Content-Type': 'application/json',
          'ApiKey': ApiConstants.apiKey,
        },
        body: jsonEncode(entry),
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      return response.body;
    } catch (e) {
      rethrow;
    }
  }
}