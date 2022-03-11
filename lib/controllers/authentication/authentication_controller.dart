import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:natural_slim_flutter_library/constants/api_constants.dart';

import 'package:natural_slim_flutter_library/models/authentication/request/login_request_model.dart';
import 'package:natural_slim_flutter_library/models/authentication/response/login_response_model.dart';

class AuthenticationController{

  Future<LoginResponse> postLogin(LoginRequest request) async {
    
    try{
      Uri url = Uri.parse('${ApiConstants.url}/api/auth/login');

      http.Response response = await http.post(
        url, 
        headers: {
          'Content-Type':'application/json',
        },
        body: jsonEncode(request)
      );

      LoginResponse parsedResponse = LoginResponse.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } on Exception catch (_, e){
      throw e;
    }
  }

}