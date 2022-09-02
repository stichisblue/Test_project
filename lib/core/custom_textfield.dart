import 'package:flutter/material.dart';
import 'package:test_project/core/style/colors.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: kGreyLight,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          showCursor: false,
          controller: widget.controller,
          cursorColor: kWhite,
          scrollPadding: EdgeInsets.zero,
          style: const TextStyle(
            color: kWhite,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: kGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: kViolet,
              ),
            ),
          ),
        )
      ],
    );
  }
}
