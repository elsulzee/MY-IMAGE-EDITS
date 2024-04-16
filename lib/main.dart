import 'package:flutter/material.dart';
import 'package:image_editings/Action%20Screens/uploading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "image Edits",
      theme: ThemeData.light(),
      home: uploading(),
    );
  }
}
