part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool? wasIncrement;
  List<WeatherModel>? weatherInfo;

  CounterState({
    required this.counterValue,
    this.wasIncrement,
    this.weatherInfo,
  });
}
