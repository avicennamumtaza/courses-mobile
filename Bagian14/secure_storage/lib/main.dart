import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Secure Strorage Avicenna'),
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
  final passwordController = TextEditingController();
  String myPassword = '';
  final storage = const FlutterSecureStorage();
  final myKey = 'cibi2caba2dubi2daba2';

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: passwordController.text);
  }

  Future readFromSecureStorage() async {
    final secret = await storage.read(key: myKey) ?? "";
    return secret;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: passwordController,
              ),
              ElevatedButton(
                onPressed: writeToSecureStorage,
                child: const Text('Simpan Password'),
              ),
              ElevatedButton(
                onPressed: () {
                  readFromSecureStorage().then((value) {
                    setState(() {
                      myPassword = value;
                    });
                  });
                },
                child: const Text('Read Password'),
              ),
              Text(myPassword),
            ],
          ),
        ),
      ),
    );
  }
}
