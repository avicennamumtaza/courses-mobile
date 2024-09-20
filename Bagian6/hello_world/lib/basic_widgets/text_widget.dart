import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final String name; // Variable untuk nama yang akan di-update

  const MyTextWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Nama saya $name, sedang belajar Pemrograman Mobile",
      style: const TextStyle(color: Colors.red, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}