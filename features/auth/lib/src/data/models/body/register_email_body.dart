import 'package:dependencies/dependencies.dart';

class RegisterEmailBody extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

  RegisterEmailBody({
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }

  @override
  List<Object> get props => [name, email, password, phoneNumber];

  @override
  bool get stringify => true;
}
