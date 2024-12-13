import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/registrate.dart';
import 'package:flutter_application_1/pages/iniciarSesion.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo en la parte superior
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Image.asset(
                'assets/images/logo_Bellisimas.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            // Contenedor con fondo rosa y texto centralizado
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.pink.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      'TE DAMOS LA BIENVENIDA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Si ya tienes una cuenta puedes ingresar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Botón "Iniciar sesión"
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IniciarSesionPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Iniciar sesión'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Si no, suscríbete ahora',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Botón "Regístrate"
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para navegar a SuscribetePage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegistratePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Regístrate'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
