import 'package:flutter/material.dart';

import 'package:test_project/core/style/colors.dart';

class CustomButtonViolet extends StatefulWidget {
  final Function() onPressed;
  final String title;
  const CustomButtonViolet({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  State<CustomButtonViolet> createState() => _CustomButtonVioletState();
}

class _CustomButtonVioletState extends State<CustomButtonViolet> {
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
          primary: kViolet,
          shape: RoundedRectangleBorder(
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
