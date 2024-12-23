import 'package:flutter/material.dart';
import 'empezarAhora.dart'; // Asegúrate de importar esta página correctamente

class DetalleCursoPage extends StatelessWidget {
  final String titulo;
  final String imagenPath;
  final String precio;
  final int conferencias;
  final int cuestionarios;
  final String duracion;
  final String nivel;
  final String idioma;
  final int estudiantes;
  final String certificado;
  final String evaluaciones;

  const DetalleCursoPage({
    Key? key,
    required this.titulo,
    required this.imagenPath,
    required this.precio,
    required this.conferencias,
    required this.cuestionarios,
    required this.duracion,
    required this.nivel,
    required this.idioma,
    required this.estudiantes,
    required this.certificado,
    required this.evaluaciones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Colors.pink[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaciado entre contenido y barra
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imagenPath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                    SizedBox(height: 16),
                    Text(
                      precio,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Navegar a la página empezarAhora.dart
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmpezarAhoraPage(), // Navega a empezarAhora
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[200],
                      ),
                      child: Text('EMPEZAR AHORA'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Características del curso',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildDetailRow(Icons.menu_book, 'Conferencias: $conferencias'),
                    _buildDetailRow(Icons.question_answer, 'Cuestionarios: $cuestionarios'),
                    _buildDetailRow(Icons.access_time, 'Duración: $duracion'),
                    _buildDetailRow(Icons.star, 'Nivel de habilidad: $nivel'),
                    _buildDetailRow(Icons.language, 'Idioma: $idioma'),
                    _buildDetailRow(Icons.people, 'Estudiantes: $estudiantes'),
                    _buildDetailRow(Icons.verified, 'Certificado: $certificado'),
                    _buildDetailRow(Icons.check_circle, 'Evaluaciones: $evaluaciones'),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.pink[200],
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    // Navegar a Visión General
                  },
                  child: Text(
                    'Visión general',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navegar a Curriculum
                  },
                  child: Text(
                    'Curriculum',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navegar a Instructor
                  },
                  child: Text(
                    'Instructor',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.pink[200]),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}