import 'package:flutter/material.dart';
import 'package:stream_avicenna/random_screen.dart';
// import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Avicenna',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RandomScreen(),
    );
  }
}

// class StreamHomePage extends StatefulWidget {
//   const StreamHomePage({super.key});

//   @override
//   State<StreamHomePage> createState() => _StreamHomePageState();
// }

// class _StreamHomePageState extends State<StreamHomePage> {
//   Color bgColor = Colors.blueGrey;
//   late ColorStream colorStream;
//   late Stream<int> numberStream;

//   void changeColor() async {
//     colorStream.getColors().listen((eventColor) {
//       setState(() {
//         bgColor = eventColor;
//       });
//     }, onDone: () {
//       debugPrint('Done');
//     });
//   }

//   @override
//   void initState() {
//     numberStream = NumberStream().getNumbers();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stream Avicenna'),
//       ),
//       body: StreamBuilder(
//         stream: numberStream,
//         initialData: 0,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             debugPrint("Error!");
//           }
//           if (snapshot.hasData) {
//             return Center(
//               child: Text(
//                 snapshot.data.toString(),
//                 style: const TextStyle(fontSize: 96),
//               ),
//             );
//           } else {
//             return const SizedBox.shrink();
//           }
//         },
//       ),
//     );
//   }
// }

// class _StreamHomePageState extends State<StreamHomePage> {
//   Color bgColor = Colors.blueGrey;
//   late ColorStream colorStream;
//   int lastNumber = 0;
//   late StreamController numberStreamController;
//   late NumberStream numberStream;
//   late StreamTransformer transformer;
//   late StreamSubscription subscription;

//   void changeColor() async {
//     // await for (var eventColor in colorStream.getColors()) {
//     //   setState(() {
//     //     bgColor = eventColor;
//     //   });
//     // }
//     colorStream.getColors().listen((eventColor) {
//       setState(() {
//         bgColor = eventColor;
//       });
//     }, onDone: () {
//       debugPrint('Done');
//     });
//     // stream.transform(transformer);
//   }

//   void addRandomNumber() {
//     Random random = Random();
//     int myNum = random.nextInt(10);
//     if (!numberStreamController.isClosed) {
//       numberStream.addNumberToSink(myNum);
//     } else {
//       setState(() {
//         lastNumber = -1;
//       });
//     }
//     // numberStream.addNumberToSink(myNum);
//     // numberStream.addError();
//   }

//   void stopStream() {
//     numberStreamController.close();
//   }

//   @override
//   void initState() {
//     numberStream = NumberStream();
//     numberStreamController = numberStream.controller;
//     Stream stream = numberStreamController.stream;
//     colorStream = ColorStream();
//     changeColor();
//     transformer = StreamTransformer<int, int>.fromHandlers(
//       handleData: (data, sink) => sink.add(data * 10),
//       handleError: (error, stackTrace, sink) => sink.add(-1),
//       handleDone: (sink) => sink.close(),
//     );
//     subscription = stream.listen((event) {
//       setState(() {
//         lastNumber = event;
//       });
//     });
//     // stream.listen((event) {
//     //   debugPrint('Event: $event');
//     //   lastNumber = event;
//     //   debugPrint('Last Number: $lastNumber');
//     // }, onError: (error) {
//     //   debugPrint('Error: $error');
//     //   setState(() {
//     //     lastNumber = -1;
//     //   });
//     // }, onDone: () {
//     //   debugPrint('Done');
//     // });
//     // stream.transform(transformer).listen((event) {
//     //   setState(() {
//     //     lastNumber = event;
//     //   });
//     //   debugPrint('Transformed Event: $event');
//     // }, onError: (error) {
//     //   setState(() {
//     //     lastNumber = -1;
//     //   });
//     //   debugPrint('Transformed Error: $error');
//     // }, onDone: () {
//     //   debugPrint('Transformed Done');
//     // });
//     subscription.onError((error) {
//       setState(() {
//         lastNumber = -1;
//       });
//     });
//     subscription.onDone(() {
//       debugPrint('onDone was called');
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     numberStreamController.close();
//     subscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stream Avicenna'),
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(color: bgColor),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: addRandomNumber,
//               child: const Text('New Random Number'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: stopStream,
//               child: const Text('Stop Subscription'),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Last Number: $lastNumber',
//               style: TextStyle(
//                 fontSize: 24,
//                 color: bgColor,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _StreamHomePageState extends State<StreamHomePage> {
//   Color bgColor = Colors.blueGrey;
//   late ColorStream colorStream;
//   int lastNumber = 0;
//   late StreamController numberStreamController;
//   late NumberStream numberStream;
//   late StreamTransformer transformer;

//   void changeColor() async {
//     // await for (var eventColor in colorStream.getColors()) {
//     //   setState(() {
//     //     bgColor = eventColor;
//     //   });
//     // }
//     colorStream.getColors().listen((eventColor) {
//       setState(() {
//         bgColor = eventColor;
//       });
//     }, onDone: () {
//       debugPrint('Done');
//     });
//     // stream.transform(transformer);
//   }

//   void addRandomNumber() {
//     Random random = Random();
//     int myNum = random.nextInt(10);
//     numberStream.addNumberToSink(myNum);
//     // numberStream.addError();
//   }

//   @override
//   void initState() {
//     numberStream = NumberStream();
//     numberStreamController = numberStream.controller;
//     Stream stream = numberStreamController.stream;
//     // stream.listen((event) {
//     //   debugPrint('Event: $event');
//     //   lastNumber = event;
//     //   debugPrint('Last Number: $lastNumber');
//     // }, onError: (error) {
//     //   debugPrint('Error: $error');
//     //   setState(() {
//     //     lastNumber = -1;
//     //   });
//     // }, onDone: () {
//     //   debugPrint('Done');
//     // });
//     colorStream = ColorStream();
//     changeColor();
//     transformer = StreamTransformer<int, int>.fromHandlers(
//       handleData: (data, sink) => sink.add(data * 10),
//       handleError: (error, stackTrace, sink) => sink.add(-1),
//       handleDone: (sink) => sink.close(),
//     );
//     stream.transform(transformer).listen((event) {
//       setState(() {
//         lastNumber = event;
//       });
//       debugPrint('Transformed Event: $event');
//     }, onError: (error) {
//       setState(() {
//         lastNumber = -1;
//       });
//       debugPrint('Transformed Error: $error');
//     }, onDone: () {
//       debugPrint('Transformed Done');
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     numberStreamController.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stream Avicenna'),
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(color: bgColor),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: addRandomNumber,
//               child: const Text('New Random Number'),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Last Number: $lastNumber',
//               style: TextStyle(
//                 fontSize: 24,
//                 color: bgColor,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _StreamHomePageState extends State<StreamHomePage> {
//   Color bgColor = Colors.blueGrey;
//   late ColorStream colorStream;
//   int lastNumber = 0;
//   late StreamController numberStreamController;
//   late NumberStream numberStream;

//   void changeColor() async {
//     // await for (var eventColor in colorStream.getColors()) {
//     //   setState(() {
//     //     bgColor = eventColor;
//     //   });
//     // }
//     colorStream.getColors().listen((eventColor) {
//       setState(() {
//         bgColor = eventColor;
//       });
//     }, onDone: () {
//       debugPrint('Done');
//     });
//   }

//   void addRandomNumber() {
//     // Random random = Random();
//     // int myNum = random.nextInt(10);
//     // numberStream.addNumberToSink(myNum);
//     numberStream.addError();
//   }

//   @override
//   void initState() {
//     numberStream = NumberStream();
//     numberStreamController = numberStream.controller;
//     Stream stream = numberStreamController.stream;
//     stream.listen((event) {
//       debugPrint('Event: $event');
//       lastNumber = event;
//       debugPrint('Last Number: $lastNumber');
//     }, onError: (error) {
//       debugPrint('Error: $error');
//       setState(() {
//         lastNumber = -1;
//       });
//     }, onDone: () {
//       debugPrint('Done');
//     });
//     super.initState();
//     colorStream = ColorStream();
//     changeColor();
//   }

//   @override
//   void dispose() {
//     numberStreamController.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Stream Avicenna'),
//         ),
//         body: SizedBox(
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(color: bgColor),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: addRandomNumber,
//                 child: const Text('New Random Number'),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'Last Number: $lastNumber',
//                 style: TextStyle(
//                   fontSize: 24,
//                   color: bgColor,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

// class _StreamHomePageState extends State<StreamHomePage> {
//   Color bgColor = Colors.blueGrey;
//   late ColorStream colorStream;

//   void changeColor() async {
//     // await for (var eventColor in colorStream.getColors()) {
//     //   setState(() {
//     //     bgColor = eventColor;
//     //   });
//     // }
//     colorStream.getColors().listen((eventColor) {
//       setState(() {
//         bgColor = eventColor;
//       });
//     }, onDone: () {
//       debugPrint('Done');
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     colorStream = ColorStream();
//     changeColor();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stream Avicenna'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(color: bgColor),
//       ),
//     );
//   }
// }
