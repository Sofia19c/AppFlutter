import 'package:flutter/material.dart';

class InstructorPage extends StatelessWidget {
  final String instructor;

  const InstructorPage({Key? key, required this.instructor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructor'),
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          instructor,
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }
}