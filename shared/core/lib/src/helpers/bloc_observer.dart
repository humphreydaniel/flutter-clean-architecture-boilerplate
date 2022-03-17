import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

/// Observing Bloc State Management
/// This class show logging when Bloc trigger
/// `onEvent`, `onTransition State`, `onError`
///
/// This class can be handle all blocs state mangement
///
/// **When** : Error, new Event, Transition State of a Bloc
///
/// To use this Bloc Observer, this code full example:
///
/// Paste this code in void `main()`, usually void main in `lib/main.dart`
///
/// ```dart
/// void main() {
/// ...
///   WidgetsFlutterBinding.ensureInitialized();
///   Bloc.observer = AppBlocObserver();
/// ...
/// }
/// ```
class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    _printDebug('Bloc: ${bloc.runtimeType}, Event: ${event.runtimeType}');
    super.onEvent(bloc, event);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stacktrace) {
    _printDebug('Bloc: ${cubit.runtimeType}, Error: $error');
    super.onError(cubit, error, stacktrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _printDebug('Bloc: ${bloc.runtimeType} , Transition: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(Cubit cubit) {
    _printDebug('Close Bloc/Cubit: ${cubit.runtimeType}');
    super.onClose(cubit);
  }

  @override
  void onCreate(Cubit cubit) {
    _printDebug('Create Bloc/Cubit: ${cubit.runtimeType}');
    super.onCreate(cubit);
  }

  void _printDebug(String v) {
    if (kDebugMode) {
      print(v);
    }
  }
}
