import 'package:flutter/material.dart';
import 'package:job_box/screen/auth/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jobbox',
      home: LoginPage()
    );
  }
}
