import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart'; // Asegúrate de que la importación sea correcta según tu estructura de proyecto.

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Curso añadido  ${index + 1}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
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
        );
      },
    );
  }
}