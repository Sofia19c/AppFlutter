import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart'; // Importamos MyAppState para acceder a la lista de favoritos.

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Acceder a la lista de favoritos desde MyAppState
    final favorites = Provider.of<MyAppState>(context).favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
        backgroundColor: Colors.pink,
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text(
                'Aún no hay contenido en la página de favoritos.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final imagePath = favorites[index];
                return Card(
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
                            'Imagen favorita ${index + 1}',
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
            ),
    );
  }
}