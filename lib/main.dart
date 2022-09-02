import 'package:flutter/material.dart';
import 'package:test_project/features/auth_page/ui/auth_screen.dart';
import 'package:test_project/features/auth_page/ui/widget/ok_screen.dart';
import 'package:test_project/features/sign_up_page/ui/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      home: SignUpScreen(),
    );
  }
}
