import 'package:flutter/material.dart';

class VisionGeneralPage extends StatelessWidget {
  final String visionGeneral;

  const VisionGeneralPage({Key? key, required this.visionGeneral}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visión General'),
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          visionGeneral,
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }
}