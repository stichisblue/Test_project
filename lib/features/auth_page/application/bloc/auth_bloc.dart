import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_project/core/domain/auth_repo.dart';
import 'package:test_project/core/exception/exeption.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthRepo authRepo;
  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthOnPressedEvent) {
        try {
          final res = await authRepo.getToken();
          if (res[0] == event.username && res[1] == event.password) {
            emit(
              AuthMainState(
                ok: true,
                error: false,
                serverError: false,
              ),
            );
          } else {
            emit(
              AuthMainState(
                ok: false,
                error: true,
                serverError: false,
              ),
            );
          }
        } on ServerException {
          emit(
            AuthMainState(
              ok: false,
              error: false,
              serverError: true,
            ),
          );
        }
      }
    });
  }
}
