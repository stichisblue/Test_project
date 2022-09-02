import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/custom_button_black.dart';
import 'package:test_project/core/custom_textfield.dart';
import 'package:test_project/core/domain/auth_repo.dart';
import 'package:test_project/core/style/colors.dart';
import 'package:test_project/features/auth_page/ui/auth_screen.dart';
import 'package:test_project/features/sign_up_page/application/sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        AuthRepo(),
      ),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpMainState) {
            final SignUpMainState signUpMainState = state;
            if (signUpMainState.ok) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthPageScreen(),
                ),
              );
            }
            if (signUpMainState.serverError) {
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
                    'Регистрация',
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
                    controller: userNameController,
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
                  CustomButtonBlack(
                    title: 'Зарегистрироваться',
                    onPressed: () {
                      context.read<SignUpBloc>().add(
                            SignUpOnPressedEvent(
                              username: userNameController.text,
                              password: passwordController.text,
                            ),
                          );
                    },
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
