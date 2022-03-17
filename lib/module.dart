import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:home/home.dart';
import 'package:settings/settings.dart';

List<BaseModule> appModules = [
  AuthModule(),
  HomeModule(),
  SettingsModule(),
];
