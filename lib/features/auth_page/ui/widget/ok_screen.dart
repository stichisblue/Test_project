import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OkScreen extends StatefulWidget {
  const OkScreen({Key? key}) : super(key: key);

  @override
  State<OkScreen> createState() => _OkScreenState();
}

class _OkScreenState extends State<OkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/xnoyYOGB.png',
        ),
      ),
    );
  }
}
