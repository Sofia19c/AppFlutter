import 'package:flutter/material.dart';

// Función para navegar a la pantalla EmpezarAhoraPage
void navigateToStart(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EmpezarAhoraPage()),
  );
}

// Clase para la página "Empezar Ahora"
class EmpezarAhoraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Empezar Ahora'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset(
                'assets/images/logo_Bellisimas.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
