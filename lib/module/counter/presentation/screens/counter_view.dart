// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:bloc_beginner/module/counter/business_logic/constant/enums.dart';
import 'package:bloc_beginner/module/counter/business_logic/cubits/internet_cubit.dart';
import 'package:bloc_beginner/module/counter/data/dataproviders/counter_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../business_logic/cubits/counter_cubit.dart';

class CounterView extends StatefulWidget {
  CounterView({Key? key}) : super(key: key);

  @override
  State<CounterView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<CounterView> {
  final WeatherService _weatherService = WeatherService();
  final CounterCubit _counterCubit = CounterCubit(
    internetCubit: InternetCubit(
      connectivity: Connectivity(),
    ),
  );

  @override
  void initState() {
    _weatherService.getInfo();
    _counterCubit.getInfoWeather();
    _counterCubit.getWithDio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Apps"),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/settings');
              },
              icon: const Icon(
                Icons.settings,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // BlocProvider.of<CounterCubit>(context).Increment();
              context.read<CounterCubit>().Increment();
            },
            backgroundColor: Colors.lightBlue,
            child: const Center(
              child: Icon(
                Icons.add,
                size: 24.0,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              // BlocProvider.of<CounterCubit>(context).Decrement();
              context.read<CounterCubit>().Decrement();
            },
            backgroundColor: Colors.red,
            child: const Center(
              child: Icon(
                Icons.remove,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return const Text(
                    "Mobile",
                    style: TextStyle(),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return const Text(
                    "Wi-Fi",
                    style: TextStyle(),
                  );
                } else if (state is InternetDisconnected) {
                  return const Text(
                    "Miskiiinnnn",
                    style: TextStyle(),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncrement == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Telah ditambahkan'),
                      duration: Duration(milliseconds: 200),
                    ),
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          Navigator.of(context).pop(true);
                        },
                      );

                      return AlertDialog(
                        alignment: Alignment.center,
                        title: LoadingAnimationWidget.hexagonDots(
                          color: Colors.lightBlue,
                          size: 50,
                        ),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Sedang ditambahkan...",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state.wasIncrement == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Telah dikurangkan'),
                      duration: Duration(milliseconds: 200),
                    ),
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          Navigator.of(context).pop(true);
                        },
                      );

                      return AlertDialog(
                        alignment: Alignment.center,
                        title: LoadingAnimationWidget.hexagonDots(
                          color: Colors.lightBlue,
                          size: 50,
                        ),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Sedang dikurangkan...",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
              bloc: context.read<CounterCubit>(),
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: const TextStyle(
                    fontSize: 100.0,
                  ),
                );
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: const Text("Route to Second Screen"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/color');
              },
              child: const Text("Route to change Box Color"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlocConsumer<InternetCubit, InternetState>(
              bloc: context.read<InternetCubit>(),
              listener: (context, state) {
                showDialog(
                  context: context,
                  builder: (context) {
                    if (state is InternetConnected &&
                        state.connectionType == ConnectionType.Mobile) {
                      return const AlertDialog(
                        title: Text("Terhubung"),
                        content: Text("Anda terhubung pada jaringan mobile"),
                      );
                    } else if (state is InternetConnected &&
                        state.connectionType == ConnectionType.Wifi) {
                      return const AlertDialog(
                        title: Text("Terhubung"),
                        content: Text("Anda terhubung pada jaringan Wi-Fi"),
                      );
                    } else if (state is InternetDisconnected) {
                      return const AlertDialog(
                        title: Text("Terputus"),
                        content:
                            Text("Anda tidak terhubung pada jaringan apapun"),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                );
              },
              builder: (context, state) {
                return Text(
                  state.toString(),
                );
              },
            ),
            BlocBuilder<CounterCubit, CounterState>(
              bloc: context.read<CounterCubit>(),
              builder: (_, state) {
                return Container(
                  height: 200,
                  width: double.maxFinite,
                  color: Colors.red,
                  child: ListView.builder(
                    itemCount: state.weatherInfo?.length,
                    itemBuilder: (_, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${index}'),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "${state.weatherInfo?[index].name}",
                            style: TextStyle(),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
