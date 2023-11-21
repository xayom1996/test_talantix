import 'package:flutter/material.dart';
import 'package:test_talantix/app/di.dart';
import 'package:test_talantix/features/presentation/pages/home_page.dart';

Future<void> main() async {
  await diInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Talantix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
