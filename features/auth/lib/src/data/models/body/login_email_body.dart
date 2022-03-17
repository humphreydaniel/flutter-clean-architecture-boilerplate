import 'package:dependencies/dependencies.dart';

class LoginEmailBody extends Equatable {
  final String email;
  final String password;

  LoginEmailBody({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  List<Object> get props => [email, password];

  @override
  bool get stringify => true;
}
