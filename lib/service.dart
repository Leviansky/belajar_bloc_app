import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DataService {
  String baseUrl = 'http://mark.bslmeiyu.com';

  // var hostValue = request.headers['Host'];

  var request =
      http.Request('GET', Uri.parse('http://mark.bslmeiyu.com/api/getplaces'))
        ..headers['Content-Type'] = 'application/x-www-form-urlencoded'
        ..headers['Host'] = 'Host';


  Future<Response> get({
    required String url,
    Map<String, dynamic>? parameters,
  }) async {
    return await http.get(
      Uri.parse(url),
      headers: request.bodyFields,
    );
  }

  Future<Response> post({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, Object>? parameters,
  }) async {
    return await http.post(
      Uri.parse(url),
      headers: request.bodyFields,
      body: jsonEncode(data),
    );
  }

  Future<Response> delete({
    required String url,
    dynamic data,
    required Map<String, dynamic> parameters,
  }) async {
    return http.delete(
      Uri.parse(url),
      body: data,
      headers: request.bodyFields,
    );
  }
  
}
