import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/main.dart';

// GeneratorPage muestra el contenido de la página principal.
class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Aquí puedes agregar cualquier contenido que quieras en vez de las palabras aleatorias.
       
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Aquí puedes añadir lógica adicional si es necesario.
                },
                icon: Icon(Icons.favorite_border),
                label: Text('Acción'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes añadir otra acción o lógica según lo que desees.
                },
                child: Text('Otra acción'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}