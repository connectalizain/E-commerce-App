// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hello/Screens/firebaseHelper.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  FilePickerResult? results;
  Storage storage = Storage();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  results = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpeg', 'png', 'jpg'],
                  );
                  setState(() {
                    results = results;
                  });
                  if (results == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("No file selected"),
                      ),
                    );
                    return null;
                  }
                  final pathname = results?.files.single.path;
                  final filename = results?.files.single.name;
                  storage.uploadFile(pathname!, filename!);
                  print("Image Path: ${results?.files.single.path}");
                },
                child: Text("Upload File")),
            // if (results != null)
            //   Container(
            //     child: Image.file(
            //       File(results.files.single.path),
            //     ),
            //   )
          ],
        ),
      ),
    );
  }
}
