part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzStatus.pure,
    this.name = const NameFormZ.pure(),
    this.email = const EmailFormZ.pure(),
    this.password = const PasswordFormZ.pure(withValidator: true),
    this.phone = const PhoneFormZ.pure(),
    this.user,
    this.failure,
  });

  final FormzStatus status;
  final NameFormZ name;
  final EmailFormZ email;
  final PasswordFormZ password;
  final PhoneFormZ phone;
  final UserEntity user;
  final Failure failure;

  RegisterState copyWith({
    FormzStatus status,
    NameFormZ name,
    EmailFormZ email,
    PasswordFormZ password,
    PhoneFormZ phone,
    UserEntity user,
    Failure failure,
  }) {
    return RegisterState(
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      user: user ?? this.user,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object> get props =>
      [status, name, email, password, phone, user, failure];

  @override
  bool get stringify => true;
}
