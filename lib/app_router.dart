import 'package:bloc_beginner/module/color/presentation/screens/color_view.dart';
import 'package:bloc_beginner/module/color/presentation/screens/second_view.dart';
import 'package:bloc_beginner/module/counter/business_logic/cubits/internet_cubit.dart';
import 'package:bloc_beginner/module/settings/logic/cubit/settings_cubit.dart';
import 'package:bloc_beginner/module/settings/presentation/screens/setting_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'module/color/logic/cubit/color_cubit.dart';
import 'module/counter/business_logic/cubits/counter_cubit.dart';
import 'module/counter/presentation/screens/counter_view.dart';
import 'module/counter/presentation/screens/second_counter_view.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit(
    internetCubit: InternetCubit(
      connectivity: Connectivity(),
    ),
  );
  final ColorCubit _colorCubit = ColorCubit();
  final SettingsCubit _settingsCubit = SettingsCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: CounterView(),
          ),
        );
        break;
      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: SecondCounterView(),
          ),
        );
        break;
      case '/color':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _colorCubit,
              ),
              BlocProvider.value(
                value: _counterCubit,
              ),
            ],
            child: ColorView(),
          ),
        );
        break;
      case '/color/2nd':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _colorCubit,
            child: SecondColorView(),
          ),
        );
        break;
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _settingsCubit,
            child: SettingView(),
          ),
        );
        break;
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
    _colorCubit.close();
  }
}
