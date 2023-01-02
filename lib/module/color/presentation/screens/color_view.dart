import 'package:bloc_beginner/module/counter/business_logic/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/color_cubit.dart';

class ColorView extends StatelessWidget {
  const ColorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ini bagian Color",
          style: TextStyle(),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<ColorCubit>(context).to_blue();
            },
            backgroundColor: Colors.lightBlue,
          ),
          const SizedBox(
            width: 15.0,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<ColorCubit>(context).to_red();
            },
            backgroundColor: Colors.red,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ColorCubit, ColorState>(
              bloc: BlocProvider.of<ColorCubit>(context),
              builder: (context, state) {
                return AnimatedContainer(
                  height: 200,
                  width: 200,
                  color: state.colorValue,
                  duration: const Duration(milliseconds: 200),
                  child: BlocBuilder<CounterCubit, CounterState>(
                    bloc: BlocProvider.of<CounterCubit>(context),
                    builder: (context, state) {
                      return Center(
                        child: Text(
                          state.counterValue.toString(),
                          style: TextStyle(
                            fontSize: 40.0,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlocBuilder<ColorCubit, ColorState>(
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.colorValue,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/color/2nd');
                  },
                  child: const Text("Gunakan untuk menjadi warna background"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
