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
                        'Curso añadido  ${index + 1}',
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