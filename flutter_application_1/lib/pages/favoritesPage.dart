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
      "titulo": "Curso de Flutter",
      "imagenPath": "assets/images/decoracion_avanzada.jpg",
      "precio": "\$99",
      "conferencias": 12,
      "cuestionarios": 4,
      "duracion": "10 horas",
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
      appBar: AppBar(
        title: Text("Favoritos"),
        backgroundColor: Colors.pink[200],
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final course = favorites[index]; // Cada elemento es un mapa
          return Card(
            key: ValueKey(course["imagenPath"]), // Clave única para cada curso
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            elevation: 4.0,
            child: InkWell(
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
              ),
            ),
          );
        },
      ),
    );
  }
}