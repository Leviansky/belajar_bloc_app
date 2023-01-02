import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
          toggleAppIndicator: false,
          toggleEmailIndicator: false,
          totalIndicator: 0,
          totalBajuIndicator: 0,
          totalSepatuIndicator: 0,
        ));

  void emitAppIndicator(bool newValue) =>
      emit(state.copyWith(toggleAppIndicator: newValue));

  void emitEmailIndicator(bool newValue) =>
      emit(state.copyWith(toggleEmailIndicator: newValue));

  void emitSepatuIncrement() => emit(SettingsState(
        totalSepatuIndicator: state.totalSepatuIndicator + 1,
        totalIndicator: state.totalIndicator + 1,
        toggleAppIndicator: state.toggleAppIndicator,
        toggleEmailIndicator: state.toggleEmailIndicator,
        totalBajuIndicator: state.totalBajuIndicator,
      ));
  void emitSepatuDecrement() => emit(SettingsState(
        totalSepatuIndicator: state.totalSepatuIndicator - 1,
        totalIndicator: state.totalIndicator - 1,
        toggleAppIndicator: state.toggleAppIndicator,
        toggleEmailIndicator: state.toggleEmailIndicator,
        totalBajuIndicator: state.totalBajuIndicator,
      ));

  void emitBajuIncrement() => emit(SettingsState(
        totalBajuIndicator: state.totalBajuIndicator + 1,
        totalIndicator: state.totalIndicator + 1,
        totalSepatuIndicator: state.totalSepatuIndicator,
        toggleAppIndicator: state.toggleAppIndicator,
        toggleEmailIndicator: state.toggleEmailIndicator,
      ));
  void emitBajuDecrement() => emit(SettingsState(
        totalBajuIndicator: state.totalBajuIndicator - 1,
        totalIndicator: state.totalIndicator - 1,
        totalSepatuIndicator: state.totalSepatuIndicator,
        toggleAppIndicator: state.toggleAppIndicator,
        toggleEmailIndicator: state.toggleEmailIndicator,
      ));

  @override
  Future<void> close() {
    return super.close();
  }
}
