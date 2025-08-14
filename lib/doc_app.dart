import 'package:flutter/material.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doc App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Documentation App')),
        body: const Center(child: Text('Welcome to the Documentation App!')),
      ),
    );
  }
}
