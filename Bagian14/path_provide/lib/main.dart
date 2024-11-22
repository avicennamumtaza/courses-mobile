import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Path Provider Avicenna'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String documentsPath = '';
  String tempPath = '';
  late File myFile;
  String fileText = '';

  Future<bool> readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> writeFile() async {
    try {
      // myFile = File('$documentsPath/myFile.txt');
      await myFile.writeAsString('Avicenna, Mumtaza, Abdillah');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  @override
  void initState() {
    getPaths().then((_) {
      myFile = File('$documentsPath/pizza.txt');
      writeFile().then((success) {
        if (success) {
          print('File berhasil ditulis');
        } else {
          print('File gagal ditulis');
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Documents Path: $documentsPath',
              textAlign: TextAlign.center,
            ),
            Text(
              'Temporary Path: $tempPath',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: readFile,
              child: const Text("Read File"),
            ),
            Text(
              fileText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
