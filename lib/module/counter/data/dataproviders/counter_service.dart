import 'dart:convert';

import 'package:bloc_beginner/module/counter/business_logic/cubits/counter_cubit.dart';
import 'package:bloc_beginner/service.dart';
import 'package:dio/dio.dart';
import '../models/weather.dart';

class WeatherService {
  String baseUrl = 'http://mark.bslmeiyu.com';
  DataService _dataService = DataService();
  CounterState _counterState = CounterState(counterValue: 0);

  Future<List<WeatherModel>> getInfo() async {
    try {
      var url = '/api/getplaces';
      final response = await _dataService.get(url: baseUrl + url);
      // print(parseWeather(response.body));
      return parseWeather(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
