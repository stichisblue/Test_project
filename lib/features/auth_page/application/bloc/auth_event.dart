part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthInitialEvent extends AuthEvent {}

class AuthOnPressedEvent extends AuthEvent {
  final String username;
  final String password;
  AuthOnPressedEvent({
    required this.username,
    required this.password,
  });
}
