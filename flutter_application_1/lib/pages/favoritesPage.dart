import 'package:flutter/material.dart';
import 'detalleCurso.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // Lista de favoritos almacenando datos como mapas
  List<Map<String, dynamic>> favorites = [
    {
      "titulo": "Decoración Avanzada En Uñas",
      "imagenPath": "assets/images/decoracion_avanzada.jpg",
      "precio": "\$99.000",
      "conferencias": 47,
      "cuestionarios": 0,
      "duracion": "180 dias",
      "nivel": "Experto",
      "idioma": "Español",
      "estudiantes": 1425,
      "certificado": "No",
      "evaluaciones": "Si",
      "visionGeneral": "Curso para aprender a construir interfaces con React.",
      "curriculum": [
      "Introducción a React",
      "Componentes y Props",
      "State y ciclo de vida",
      "React Router",
      ],
    },
    {
      "titulo": "Manicure y Pedicure Virtual",
      "imagenPath": "assets/images/manicure_pedicure.jpg",
      "precio": "\$99.000",
      "conferencias": 40,
      "cuestionarios": 11,
      "duracion": "180 dias",
      "nivel": "Principiante",
      "idioma": "Español",
      "estudiantes": 1621,
      "certificado": "Incluido",
      "evaluaciones": "Si",
    },
    {
      "titulo": "Semipermanente y Uñas Acrilicas",
      "imagenPath": "assets/images/unias_acrilicas.jpg",
      "precio": "\$99.000",
      "conferencias": 29,
      "cuestionarios": 9,
      "duracion": "180 dias",
      "nivel": "Todos los niveles",
      "idioma": "Español",
      "estudiantes": 2460,
      "certificado": "Incluido",
      "evaluaciones": "Si",
    },
    {
      "titulo": "Decocación (Bob Esponja)",
      "imagenPath": "assets/images/decoracion_bobesponja.jpg",
      "precio": "\$99.900",
      "conferencias": 8,
      "cuestionarios": 0,
      "duracion": "180 dias",
      "nivel": "Todos los niveles",
      "idioma": "Español",
      "estudiantes": 1727,
      "certificado": "Incluido",
      "evaluaciones": "Si",
    },
    {
      "titulo": "Caritas de Bob Esponja",
      "imagenPath": "assets/images/caritas_bobesponja.jpg",
      "precio": "Gratis",
      "conferencias": 9,
      "cuestionarios": 0,
      "duracion": "10 horas",
      "nivel": "Todos los niveles",
      "idioma": "Español",
      "estudiantes": 378,
      "certificado": "No",
      "evaluaciones": "Si",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favorites.isEmpty
          ? Center(
              child: Text(
                "No tienes favoritos aún.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final course = favorites[index]; // Cada elemento es un mapa
                return Card(
                  key: ValueKey(course["imagenPath"]), // Clave única para cada curso
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.asset(
                      course["imagenPath"],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      course["titulo"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(course["precio"]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteFavorite(index);
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalleCursoPage(
                            titulo: course["titulo"],
                            imagenPath: course["imagenPath"],
                            precio: course["precio"],
                            conferencias: course["conferencias"],
                            cuestionarios: course["cuestionarios"],
                            duracion: course["duracion"],
                            nivel: course["nivel"],
                            idioma: course["idioma"],
                            estudiantes: course["estudiantes"],
                            certificado: course["certificado"],
                            evaluaciones: course["evaluaciones"],
                            visionGeneral: course["visionGeneral"], 
                            curriculum: course["curriculum"],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
 
  // Método para eliminar un curso de la lista de favoritos
  void _deleteFavorite(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Eliminar favorito"),
          content: Text("¿Estás seguro de que quieres eliminar este curso de favoritos?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  favorites.removeAt(index); // Eliminar curso
                });
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text("Eliminar", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
