// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(language) => "You are sure you want to change the language to ${language} ? ";

  static m1(type) => "${type} is invalid";

  static m2(type) => "Login with ${type}";

  static m3(type) => "Register with ${type}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "and" : MessageLookupByLibrary.simpleMessage("and"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "change_language" : MessageLookupByLibrary.simpleMessage("Change Language"),
    "click_here" : MessageLookupByLibrary.simpleMessage("Click Here"),
    "confirm_password" : MessageLookupByLibrary.simpleMessage("Confirm password"),
    "confirm_to_change_lang" : m0,
    "desc_success_reset_pass" : MessageLookupByLibrary.simpleMessage("The link for resetting the password has been sent. Check your inbox or spam email folder."),
    "email" : MessageLookupByLibrary.simpleMessage("Email"),
    "forget_password" : MessageLookupByLibrary.simpleMessage("Forget Password"),
    "full_name" : MessageLookupByLibrary.simpleMessage("Full Name"),
    "home" : MessageLookupByLibrary.simpleMessage("Home"),
    "invalid_input" : m1,
    "later" : MessageLookupByLibrary.simpleMessage("Later"),
    "latest_version_available" : MessageLookupByLibrary.simpleMessage("The newest application is available"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "login_with" : m2,
    "message_for_app_updates" : MessageLookupByLibrary.simpleMessage("Immediately update to the latest applications, to increase your comfort."),
    "message_success_reset_password" : MessageLookupByLibrary.simpleMessage("An email message has been sent containing a link to reset the password"),
    "ok" : MessageLookupByLibrary.simpleMessage("Ok"),
    "order" : MessageLookupByLibrary.simpleMessage("Order"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "phone_number" : MessageLookupByLibrary.simpleMessage("Phone Number"),
    "please_wait" : MessageLookupByLibrary.simpleMessage("Please wait"),
    "privacy_policy" : MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "profile" : MessageLookupByLibrary.simpleMessage("Profile"),
    "question_already_have_account" : MessageLookupByLibrary.simpleMessage("Already have an account?"),
    "register" : MessageLookupByLibrary.simpleMessage("Register"),
    "register_with" : m3,
    "required" : MessageLookupByLibrary.simpleMessage("Required"),
    "required_input" : MessageLookupByLibrary.simpleMessage("This field is required"),
    "reset_password" : MessageLookupByLibrary.simpleMessage("Reset Password"),
    "reset_password_commands" : MessageLookupByLibrary.simpleMessage("Enter your email or username, we will send a link to reset your account password to your email."),
    "select_login_message" : MessageLookupByLibrary.simpleMessage("Please use the entry options below"),
    "term_and_privacy_message" : MessageLookupByLibrary.simpleMessage("By continuing with the services above, you agree to"),
    "term_of_service" : MessageLookupByLibrary.simpleMessage("Term of Service"),
    "title_success_reset_pass" : MessageLookupByLibrary.simpleMessage("Sent!"),
    "welcome_back" : MessageLookupByLibrary.simpleMessage("Welcome Back"),
    "welcome_in" : MessageLookupByLibrary.simpleMessage("Welcome in")
  };
}
