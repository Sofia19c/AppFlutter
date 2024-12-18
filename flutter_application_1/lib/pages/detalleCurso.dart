import 'package:flutter/material.dart';

class DetalleCursoPage extends StatelessWidget {
  final String titulo;
  final String imagenPath;
  final String descripcion;

  const DetalleCursoPage({
    Key? key,
    required this.titulo,
    required this.imagenPath,
    required this.descripcion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imagenPath,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            SizedBox(height: 10),
            Text(
              descripcion,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}