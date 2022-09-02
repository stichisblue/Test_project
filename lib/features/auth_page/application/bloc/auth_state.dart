part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthMainState extends AuthState {
  final bool ok;
  final bool error;
  final bool serverError;
  AuthMainState({
    required this.ok,
    required this.error,
    required this.serverError,
  });
}
