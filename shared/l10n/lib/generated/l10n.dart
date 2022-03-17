// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome in`
  String get welcome_in {
    return Intl.message(
      'Welcome in',
      name: 'welcome_in',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `By continuing with the services above, you agree to`
  String get term_and_privacy_message {
    return Intl.message(
      'By continuing with the services above, you agree to',
      name: 'term_and_privacy_message',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Term of Service`
  String get term_of_service {
    return Intl.message(
      'Term of Service',
      name: 'term_of_service',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message(
      'and',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcome_back {
    return Intl.message(
      'Welcome Back',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Please use the entry options below`
  String get select_login_message {
    return Intl.message(
      'Please use the entry options below',
      name: 'select_login_message',
      desc: '',
      args: [],
    );
  }

  /// `Login with {type}`
  String login_with(Object type) {
    return Intl.message(
      'Login with $type',
      name: 'login_with',
      desc: '',
      args: [type],
    );
  }

  /// `Register with {type}`
  String register_with(Object type) {
    return Intl.message(
      'Register with $type',
      name: 'register_with',
      desc: '',
      args: [type],
    );
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Click Here`
  String get click_here {
    return Intl.message(
      'Click Here',
      name: 'click_here',
      desc: '',
      args: [],
    );
  }

  /// `Please wait`
  String get please_wait {
    return Intl.message(
      'Please wait',
      name: 'please_wait',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get required_input {
    return Intl.message(
      'This field is required',
      name: 'required_input',
      desc: '',
      args: [],
    );
  }

  /// `{type} is invalid`
  String invalid_input(Object type) {
    return Intl.message(
      '$type is invalid',
      name: 'invalid_input',
      desc: '',
      args: [type],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `An email message has been sent containing a link to reset the password`
  String get message_success_reset_password {
    return Intl.message(
      'An email message has been sent containing a link to reset the password',
      name: 'message_success_reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `You are sure you want to change the language to {language} ? `
  String confirm_to_change_lang(Object language) {
    return Intl.message(
      'You are sure you want to change the language to $language ? ',
      name: 'confirm_to_change_lang',
      desc: '',
      args: [language],
    );
  }

  /// `The newest application is available`
  String get latest_version_available {
    return Intl.message(
      'The newest application is available',
      name: 'latest_version_available',
      desc: '',
      args: [],
    );
  }

  /// `Immediately update to the latest applications, to increase your comfort.`
  String get message_for_app_updates {
    return Intl.message(
      'Immediately update to the latest applications, to increase your comfort.',
      name: 'message_for_app_updates',
      desc: '',
      args: [],
    );
  }

  /// `Later`
  String get later {
    return Intl.message(
      'Later',
      name: 'later',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get question_already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'question_already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email or username, we will send a link to reset your account password to your email.`
  String get reset_password_commands {
    return Intl.message(
      'Enter your email or username, we will send a link to reset your account password to your email.',
      name: 'reset_password_commands',
      desc: '',
      args: [],
    );
  }

  /// `Sent!`
  String get title_success_reset_pass {
    return Intl.message(
      'Sent!',
      name: 'title_success_reset_pass',
      desc: '',
      args: [],
    );
  }

  /// `The link for resetting the password has been sent. Check your inbox or spam email folder.`
  String get desc_success_reset_pass {
    return Intl.message(
      'The link for resetting the password has been sent. Check your inbox or spam email folder.',
      name: 'desc_success_reset_pass',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'th'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}