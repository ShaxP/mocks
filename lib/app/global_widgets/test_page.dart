import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final String title;
  const TestPage({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Text('This is a test page with title $title')),
    );
  }
}
