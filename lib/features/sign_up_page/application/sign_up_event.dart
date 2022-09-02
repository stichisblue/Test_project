part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpOnPressedEvent extends SignUpEvent {
  final String username;
  final String password;
  SignUpOnPressedEvent({
    required this.username,
    required this.password,
  });
}
