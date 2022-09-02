import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:test_project/core/style/colors.dart';

class CustomButtonBlack extends StatefulWidget {
  final String title;
  final Function() onPressed;
  const CustomButtonBlack({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomButtonBlack> createState() => _CustomButtonBlackState();
}

class _CustomButtonBlackState extends State<CustomButtonBlack> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          primary: kBlack,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: kViolet,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
