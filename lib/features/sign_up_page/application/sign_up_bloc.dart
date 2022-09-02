import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_project/core/domain/auth_repo.dart';
import 'package:test_project/core/exception/exeption.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepo authRepo;
  SignUpBloc(this.authRepo) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpOnPressedEvent) {
        try {
          await authRepo.saveToken(
            password: event.password,
            username: event.username,
          );
          emit(
            SignUpMainState(
              ok: true,
              serverError: false,
            ),
          );
        } on ServerException {
          emit(
            SignUpMainState(
              ok: false,
              serverError: true,
            ),
          );
        }
      }
    });
  }
}
