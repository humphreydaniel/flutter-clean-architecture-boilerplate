part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {}

class ResetPasswordInitial extends ResetPasswordState {
  @override
  List<Object> get props => [];
}

class ResetPasswordLoading extends ResetPasswordState {
  @override
  List<Object> get props => [];
}

class ResetPasswordSuccess extends ResetPasswordState {
  @override
  List<Object> get props => [];
}

class ResetPasswordFailure extends ResetPasswordState {
  final Failure failure;

  ResetPasswordFailure(this.failure);
  @override
  List<Object> get props => [];
}
