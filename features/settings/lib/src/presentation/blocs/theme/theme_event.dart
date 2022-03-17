part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class InitializeThemeEvent extends ThemeEvent {
  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final AppTheme theme;
  ChangeThemeEvent({
    @required this.theme,
  });

  @override
  List<Object> get props => [theme];
}
