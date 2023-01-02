
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubits/counter_cubit.dart';

class SecondCounterView extends StatelessWidget {
  const SecondCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Second Screen",
          style: TextStyle(),
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          bloc: BlocProvider.of<CounterCubit>(context),
          builder: (context, state) {
            return Text(
              "Anda sudah menghitung sebanyak " +
                  state.counterValue.toString() +
                  " kali",
              style: TextStyle(),
            );
          },
        ),
      ),
    );
  }
}
