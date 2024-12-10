import 'dart:async';

// import 'package:books/navigation_dialog.dart';
import 'package:books/geolocation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LocationScreen(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = "";
  late Completer completer;
  int appCounter = 0;

  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt("appCounter") ?? 0;
    appCounter++;
    await prefs.setInt("appCounter", appCounter);
    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePrefence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  Future handleError() async {
    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    } finally {
      print("Complete");
    }
  }

  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception("Something terrible happened");
  }

  void returnFG() {
    // FutureGroup<int> futureGroup = FutureGroup<int>();
    // futureGroup.add(returnOneAsync());
    // futureGroup.add(returnTwoAsync());
    // futureGroup.add(returnThreeAsync());
    // futureGroup.close();
    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);
    futures.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }

  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError({});
    }
  }

  Future<Response> getData() async {
    const authority = "www.googleapis.com";
    const path = "/books/v1/volumes/junbDwAAQBAJ";
    Uri uri = Uri.https(authority, path);
    return http.get(uri);
  }

  Future count() async {
    int total = 0;
    total += await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    readAndWritePreference();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Back from the Future Avicenna"),
    //   ),
    //   body: Center(
    //     child: Column(
    //       children: [
    //         const Spacer(),
    //         ElevatedButton(
    //           onPressed: () {
    //             // count();
    //             // returnFG();
    //             handleError();
    //           },
    //           child: const Text("GO"),
    //         ),
    //         const Spacer(),
    //         Text(result),
    //         const Spacer(),
    //         const CircularProgressIndicator(),
    //         const Spacer(),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences Avicenna"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("You have opened this app $appCounter times"),
            ElevatedButton(
              onPressed: () {
                readAndWritePreference();
              },
              child: const Text("Add Counter"),
            ),
            ElevatedButton(
              onPressed: () {
                deletePrefence();
              },
              child: const Text("Reset Counter"),
            ),
            // const Spacer(),
            // Text("App Counter: $appCounter"),
            // const Spacer(),
          ],
        ),
      ),
    );
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }
}
