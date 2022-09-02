import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/custom_button_violet.dart';
import 'package:test_project/core/custom_textfield.dart';
import 'package:test_project/core/domain/auth_repo.dart';
import 'package:test_project/core/style/colors.dart';
import 'package:test_project/features/auth_page/application/bloc/auth_bloc.dart';
import 'package:test_project/features/auth_page/ui/widget/error_screen.dart';
import 'package:test_project/features/auth_page/ui/widget/ok_screen.dart';
import 'package:test_project/features/sign_up_page/ui/sign_up_screen.dart';

class AuthPageScreen extends StatefulWidget {
  const AuthPageScreen({Key? key}) : super(key: key);

  @override
  State<AuthPageScreen> createState() => _AuthPageScreenState();
}

TextEditingController dataController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _AuthPageScreenState extends State<AuthPageScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        AuthRepo(),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthMainState) {
            final AuthMainState authMainState = state;
            if (authMainState.ok) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OkScreen(),
                ),
              );
            }
            if (authMainState.error) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ErrorScreen(),
                ),
              );
            }
            if (authMainState.serverError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: kRed,
                  content: Text(
                    'Ошибка сервера',
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: kBlack,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Авторизация',
                    style: TextStyle(
                      color: kGreyLight,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    title: 'Имя',
                    controller: dataController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    title: 'Пароль',
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButtonViolet(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthOnPressedEvent(
                              username: userNameController.text,
                              password: passwordController.text,
                            ),
                          );
                    },
                    title: 'Войти',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
