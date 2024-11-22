import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final String name; // Variable untuk nama yang akan di-update

  const MyTextWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Nama saya $name, sedang belajar Pemrograman Mobile",
      style: const TextStyle(color: Colors.red, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}