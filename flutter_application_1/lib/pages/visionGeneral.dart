import 'package:flutter/material.dart';
import 'cursosData.dart';

class VisionGeneralPage extends StatelessWidget {
  final String cursoKey; // Identificador único del curso

  VisionGeneralPage({required this.cursoKey});

  @override
  Widget build(BuildContext context) {
    final curso = cursosData[cursoKey]!; // Obtiene los datos del curso usando la clave

    return Scaffold(
      appBar: AppBar(
        title: Text("Visión General"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            Text(
              curso["titulo"]!,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Introducción
            Text(
              curso["introduccion"]!,
              style: TextStyle(fontSize: 16),
            ),
            Divider(height: 32),

            // Objetivos
            Text(
              "Aprende las técnicas más avanzadas para decorar uñas",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              curso["objetivos"]!,
              style: TextStyle(fontSize: 16),
            ),
            Divider(height: 32),

            // Beneficios
            Text(
              "Mejora tu repertorio de decoraciones de uñas",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              curso["beneficios"]!,
              style: TextStyle(fontSize: 16),
            ),
            Divider(height: 32),

            // Módulos
            Text(
              "Módulos del curso",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              curso["modulos"]!,
              style: TextStyle(fontSize: 16),
            ),
            Divider(height: 32),

            // Llamado a la acción
            Text(
              "¡Inscríbete ahora!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              curso["cta"]!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}