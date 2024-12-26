import 'package:flutter/material.dart';

class CurriculumPage extends StatelessWidget {
  final List<String> curriculum;

  const CurriculumPage({Key? key, required this.curriculum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curriculum'),
        backgroundColor: Colors.pink[200],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: curriculum.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.check, color: Colors.pink[200]),
            title: Text(curriculum[index]),
          );
        },
      ),
    );
  }
}