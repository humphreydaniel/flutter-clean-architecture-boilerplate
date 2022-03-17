part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData theme;
  ThemeState({
    @required this.theme,
  });

  @override
  List<Object> get props => [theme];
}
