import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hello_world/basic_widgets/fab_widget.dart';
import 'package:hello_world/basic_widgets/image_widget.dart';
import 'package:hello_world/basic_widgets/loading_cupertino.dart';
import 'package:hello_world/basic_widgets/text_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contoh Date Picker dan Alert',
      home: MyHomePage(title: 'Contoh Date Picker dan Alert'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // State untuk input nama
  TextEditingController nameController = TextEditingController();
  String name = "Avicenna";

  // State untuk mengambil tanggal
  DateTime selectedDate = DateTime.now();

  //  Fungsi untuk Select Date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Fungsi untuk menampilkan Alert Dialog
  void showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("My title"),
      content: const Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showAlertDialog(context),
              child: const Text('Show alert'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const MyImageWidget(),
                  const SizedBox(height: 50),
                  MyTextWidget(name: name),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama',
                    ),
                    onChanged: (text) {
                      setState(() {
                        name = text; // Memperbarui teks berdasarkan input
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => showAlertDialog(context),
                    child: const Text('Show alert'),
                  ),
                  const LoadingCupertino(),
                  const SizedBox(height: 20),
                  Text("${selectedDate.toLocal()}".split(' ')[0]),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () => {
                      _selectDate(context),
                      print(selectedDate.day +
                          selectedDate.month +
                          selectedDate.year),
                    },
                    child: const Text('Pilih Tanggal'),
                  ),
                  const SizedBox(height: 20.0),
                  const FabWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
