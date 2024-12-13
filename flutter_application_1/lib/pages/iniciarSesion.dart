import 'package:flutter/material.dart';

class IniciarSesionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Iniciar Sesión'),
      ),
      body: Center(
        child: Text(
          'Pantalla de inicio de sesión',
          style: TextStyle(fontSize: 24, color: Colors.pink),
        ),
      ),
    );
  }
}