import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_beginner/module/counter/business_logic/constant/enums.dart';
import 'package:bloc_beginner/module/counter/business_logic/cubits/internet_cubit.dart';
import 'package:bloc_beginner/module/counter/data/dataproviders/counter_service.dart';
import 'package:bloc_beginner/module/counter/data/models/weather.dart';
import 'package:bloc_beginner/module/counter/presentation/screens/counter_view.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription? internetStreamSubscription;
  WeatherService? _weatherService;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    monitorInternetCubit();
  }

  void monitorInternetCubit() {
    final internetState = internetCubit.state;
    if (internetState is InternetConnected &&
        (internetState.connectionType == ConnectionType.Wifi ||
            internetState.connectionType == ConnectionType.Mobile)) {
      Increment();
      print(internetState.toString());
    } else if (internetState is InternetDisconnected) {
      Decrement();
    } else {
      return null;
    }
    // internetStreamSubscription = internetCubit.listen((internetState) {
    //   if (internetState is InternetConnected &&
    //       (internetState.connectionType == ConnectionType.Wifi ||
    //           internetState.connectionType == ConnectionType.Mobile)) {
    //     Increment();
    //     print(internetState.toString());
    //   } else if (internetState is InternetDisconnected) {
    //     Decrement();
    //   }
    // });
  }

  void Increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncrement: true));
  void Decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, wasIncrement: false));

  void getInfoWeather() async {
    try {
      final response = await _weatherService?.getInfo();
      if (response != null) {
        print("=====================================>>>>>>");
        print(response);
        emit(CounterState(
          weatherInfo: response,
          counterValue: state.counterValue,
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void getWithDio() async {
    try {
      var response = await Dio().get(
        "http://mark.bslmeiyu.com/api/getplaces",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      print(response.data);
      print('sssss');
      jsonDecode(response.data);
      // emit(CounterState(
      //   weatherInfo: response.data,
      //   counterValue: state.counterValue,
      // ));
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> close() {
    internetStreamSubscription?.cancel();
    return super.close();
  }
}
