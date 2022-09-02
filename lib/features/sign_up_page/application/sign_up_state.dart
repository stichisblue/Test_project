part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpMainState extends SignUpState {
  final bool ok;
  final bool serverError;
  SignUpMainState({
    required this.ok,
    required this.serverError,
  });
}
