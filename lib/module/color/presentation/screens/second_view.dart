import 'package:bloc_beginner/module/color/logic/cubit/color_cubit.dart';
import 'package:bloc_beginner/module/counter/business_logic/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondColorView extends StatelessWidget {
  const SecondColorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text(
              state.counterValue.toString(),
              style: TextStyle(),
            );
          },
        ),
      ),
      body: BlocBuilder<ColorCubit, ColorState>(
        builder: (context, state) {
          return Container(
            color: state.colorValue,
          );
        },
      ),
    );
  }
}
