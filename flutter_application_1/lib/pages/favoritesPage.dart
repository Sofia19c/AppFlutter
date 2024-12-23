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
      "precio": "\$99",
      "conferencias": 47,
      "cuestionarios": 0,
      "duracion": "180 dias",
      "nivel": "Principiante",
      "idioma": "Español",
      "estudiantes": 1200,
      "certificado": "Incluido",
      "evaluaciones": "5/5",
    },
    {
      "titulo": "Curso de React",
      "imagenPath": "assets/images/decoracion_avanzada.jpg",
      "precio": "\$89",
      "conferencias": 10,
      "cuestionarios": 5,
      "duracion": "8 horas",
      "nivel": "Intermedio",
      "idioma": "Inglés",
      "estudiantes": 800,
      "certificado": "Incluido",
      "evaluaciones": "4.8/5",
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
