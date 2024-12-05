import 'package:flutter/material.dart';

class RegistratePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suscribirse'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text(
          '¡Bienvenido a la página de registro!',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}