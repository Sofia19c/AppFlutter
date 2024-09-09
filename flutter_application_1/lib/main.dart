// Paquete que permite generar pares de palabras en inglés.
import 'package:english_words/english_words.dart';
// El paquete principal para construir aplicaciones con Flutter.
import 'package:flutter/material.dart';
// Un paquete que facilita la gestión del estado en Flutter.
import 'package:provider/provider.dart';

import 'package:flutter_application_1/pages/generatorPage.dart';
import 'package:flutter_application_1/pages/favoritesPage.dart';

void main() { // Ejecuta el widget raíz, "MyApp".
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
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 243, 190, 232)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// Esta clase gestiona el estado de la aplicación.
class MyAppState extends ChangeNotifier {
  // Generador de palabras aleatorias.
  var current = WordPair.random();

  // Cambia a un nuevo par de palabras y notifica a los oyentes.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
  
  // Lista de palabras favoritas.
  var favorites = <WordPair>[];

  // Añade o elimina el par actual de la lista de favoritos.
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
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
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
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
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                    Image.asset(
                      'assets/images/logo_Bellisimas.png',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Expanded (
                    child : Row(
                      children: [
                        if (isRailVisible)
                          SafeArea(
                            child: NavigationRail(
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
                          child: Container(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            child: page,
                          ),
                        ),
                      ],
                    )
                  ) 
                ] 
              );
            },
          ),
        );
      },
    ); // Aquí cierra el LayoutBuilder externo.
  } // Aquí cierra el método build.
} // Aquí cierra la clase _MyHomePageState.

// Es un widget que muestra un par de palabras en una tarjeta grande con un estilo específico.
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase, 
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
