// El paquete principal para construir aplicaciones con Flutter.
import 'package:flutter/material.dart';
// Un paquete que facilita la gestión del estado en Flutter.
import 'package:provider/provider.dart';

import 'package:flutter_application_1/pages/generatorPage.dart';
import 'package:flutter_application_1/pages/favoritesPage.dart';

void main() { 
  runApp(MyApp());
}

// Widget MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Proporciona el estado de la aplicación (MyAppState) a los widgets hijos.
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 252, 252, 252)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// Clase MyAppState para gestionar el estado de la app.
class MyAppState extends ChangeNotifier {
  // Aquí puedes agregar otras variables o funcionalidades que quieras para la app.
}

// El widget StatefulWidget se utiliza para manejar la interfaz que cambia de estado.
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  bool isDrawerOpen = false;
  bool isRailVisible = true; // Controla si el Drawer está abierto.

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage(); // Página referenciada
        break;
      case 1:
        page = FavoritesPage(); // Página referenciada
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Namer App'),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(isRailVisible ? Icons.close : Icons.menu),
                  onPressed: () {
                    setState(() {
                      isRailVisible = !isRailVisible;
                    });
                  },
                ),
              ),
            ],
          ),
          body: Row(
            children: [
              if (isRailVisible)
                SafeArea(
                  child: NavigationRail(
                    backgroundColor: Colors.pink[100], // Fondo rosado del menú
                    selectedIconTheme: IconThemeData(
                      color: Colors.pink, // Color de íconos seleccionados
                    ),
                    unselectedIconTheme: IconThemeData(
                      color: Colors.pink[300], // Color de íconos no seleccionados
                    ),
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
              Expanded(
                child: Column(
                  children: [
                    // Ajuste de imagen con flexibilidad para que no ocupe tanto espacio
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          'assets/images/logo_Bellisimas.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // El contenido debajo de la imagen
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        child: page,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
