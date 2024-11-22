import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

class ColorStream {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.cyan,
  ];
  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1),
      (int count) {
        debugPrint('Count: $count');
        debugPrint('Color: ${colors[count % colors.length]}');
        return colors[count % colors.length];
      },
    );
  }
}

class NumberStream {
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1),
      (int count) {
        Random random = Random();
        int myNumber = random.nextInt(10);
        debugPrint('Num: $myNumber');
        return myNumber;
      },
    );
  }
  // final StreamController<int> controller = StreamController<int>();
  // void addNumberToSink(int newNumber) {
  //   controller.sink.add(newNumber);
  // }
  // close() {
  //   controller.close();
  // }
  // addError() {
  //   controller.sink.addError('Yey Error!');
  // }
}