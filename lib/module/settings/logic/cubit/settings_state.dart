part of 'settings_cubit.dart';

// abstract class SettingsState extends Equatable {
//   const SettingsState();

//   @override
//   List<Object> get props => [];
// }

class SettingsState extends Equatable {
  final bool toggleAppIndicator;
  final bool toggleEmailIndicator;
  final int totalSepatuIndicator;
  final int totalBajuIndicator;
  final int totalIndicator;

  SettingsState({
    required this.toggleAppIndicator,
    required this.toggleEmailIndicator,
    required this.totalSepatuIndicator,
    required this.totalBajuIndicator,
    required this.totalIndicator,
  });

  SettingsState copyWith({
    bool? toggleAppIndicator,
    bool? toggleEmailIndicator,
    int? totalSepatuIndicator,
    int? totalBajuIndicator,
    int? totalIndicator,
  }) {
    return SettingsState(
      toggleAppIndicator: toggleAppIndicator ?? this.toggleAppIndicator,
      toggleEmailIndicator: toggleEmailIndicator ?? this.toggleEmailIndicator,
      totalSepatuIndicator: totalSepatuIndicator ?? this.totalSepatuIndicator,
      totalBajuIndicator: totalBajuIndicator ?? this.totalBajuIndicator,
      totalIndicator: totalIndicator ?? this.totalIndicator,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        toggleAppIndicator,
        toggleEmailIndicator,
        totalSepatuIndicator,
        totalBajuIndicator,
        totalIndicator,
      ];
}
