part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterNameChanged extends RegisterEvent {
  final String name;

  const RegisterNameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class RegisterEmailChanged extends RegisterEvent {
  final String email;

  const RegisterEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  const RegisterPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class RegisterPhoneChanged extends RegisterEvent {
  final String phone;

  const RegisterPhoneChanged(this.phone);

  @override
  List<Object> get props => [phone];
}

class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();

  @override
  List<Object> get props => [];
}

class RegisterGoogleSubmitted extends RegisterEvent {
  @override
  List<Object> get props => [];
}
