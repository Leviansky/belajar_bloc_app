import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorState(colorValue: Colors.lightBlue));

  void to_blue() => emit(ColorState(colorValue: Colors.lightBlue));
  void to_red() => emit(ColorState(colorValue: Colors.red));

  @override
  Future<void> close() {
    return super.close();
  }
}
