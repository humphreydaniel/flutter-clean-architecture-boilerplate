part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {}

class GetResetPasswordEvent extends ResetPasswordEvent {
  final String email;

  GetResetPasswordEvent(this.email);

  @override
  List<Object> get props => [email];
}
