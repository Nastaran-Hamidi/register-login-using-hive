import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLength;
  const TextInput({super.key,
    this.controller,
    required this.hintText,
    this.maxLength
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextFormField(
        maxLength: maxLength,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
