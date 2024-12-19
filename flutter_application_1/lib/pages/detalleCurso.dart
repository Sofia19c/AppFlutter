import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart'; // Asegúrate de que la importación sea correcta según tu estructura.
import 'package:flutter_application_1/pages/detalleCurso.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<MyAppState>(context).favorites;

    if (favorites.isEmpty) {
      return Center(
        child: Text(
          'Aún no hay contenido en la página de favoritos.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final imagePath = favorites[index];
        return Card(
          key: ValueKey(imagePath), // Clave única basada en el contenido
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          elevation: 4.0,
          child: InkWell(
            // Hace la tarjeta interactiva
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalleCursoPage(
                    titulo: 'Curso Decoración Avanzado',
                    imagenPath: imagePath, // Usa el path de la imagen guardado en favoritos
                    precio: '99.900',
                    conferencias: 47,
                    cuestionarios: 0,
                    duracion: '180 días',
                    nivel: 'Experto',
                    idioma: 'Español',
                    estudiantes: 1425,
                    certificado: 'No',
                    evaluaciones: 'Sí',
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalleCursoPage(
                            titulo: 'Curso manicure y pedicure virtual',
                            imagenPath: imagePath, // Usa el path de la imagen guardado en favoritos
                            precio: '99.000',
                            conferencias: 40,
                            cuestionarios: 11,
                            duracion: '180 días',
                            nivel: 'Principiante',
                            idioma: 'Español',
                            estudiantes: 1621,
                            certificado: 'Sí',
                            evaluaciones: 'Sí',
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      imagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalleCursoPage(
                              titulo: 'Curso Decoración Bob Esponja',
                              imagenPath: imagePath, // Usa el path de la imagen guardado en favoritos
                              precio: 'Gratis',
                              conferencias: 9,
                              cuestionarios: 0,
                              duracion: '10 Horas',
                              nivel: 'Todos los niveles',
                              idioma: 'Español',
                              estudiantes: 378,
                              certificado: 'No',
                              evaluaciones: 'Sí',
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Curso añadido ${index + 1}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.pink),
                    onPressed: () {
                      Provider.of<MyAppState>(context, listen: false)
                          .favorites
                          .removeAt(index);
                      Provider.of<MyAppState>(context, listen: false)
                          .notifyListeners();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Actualización para DetalleCursoPage con el menú rosado

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

  DetalleCursoPage({
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
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Colors.pink, // Color rosado en la barra superior
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Imagen del curso
          Image.asset(
            imagenPath,
            fit: BoxFit.cover,
            height: 200,
          ),

          // Precio y botón "Empezar Ahora"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  precio,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Agrega la funcionalidad del botón aquí
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Colors.pink,
                  ),
                  child: Text(
                    "EMPEZAR AHORA",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // Menú de navegación
          Container(
            color: Colors.pink, // Fondo rosado para el menú
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    // Navegar a Visión General
                  },
                  child: Text(
                    'Visión General',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navegar a Currículum
                  },
                  child: Text(
                    'Currículum',
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

          // Características del curso
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Características del curso',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Conferencias: $conferencias'),
                  Text('Cuestionarios: $cuestionarios'),
                  Text('Duración: $duracion'),
                  Text('Nivel: $nivel'),
                  Text('Idioma: $idioma'),
                  Text('Estudiantes: $estudiantes'),
                  Text('Certificado: $certificado'),
                  Text('Evaluaciones: $evaluaciones'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}