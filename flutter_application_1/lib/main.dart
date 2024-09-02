//paquete que permite generar pares de palabras en inglés.
import 'package:english_words/english_words.dart';
//El paquete principal para construir aplicaciones con Flutter.
import 'package:flutter/material.dart';
// Un paquete que facilita la gestión del estado en Flutter.
import 'package:provider/provider.dart';

import 'package:flutter_application_1/pages/generatorPage.dart';
import 'package:flutter_application_1/pages/favoritesPage.dart';

void main() { //Ejecuta el widget raíz, "My App"
  runApp(MyApp());
}

// widget MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});
//define la pagina inicial myHomePage
  @override
  Widget build(BuildContext context) {
    //Proporciona el estado de la aplicacion 
    //(MyAppState) a los widgets hijos.
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 185, 213, 236)),
        ),
        home: MyHomePage(), 
      ),
    );
  }
}

//esta clase gestiona el estado de la aplicacion
class MyAppState extends ChangeNotifier {
  // generador de palabras aleatorias
  var current = WordPair.random();

  // Cambia a un nuevo par de palabras y notifica a los oyentes.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
  // lista de palabras favoritas
  var favorites = <WordPair>[];

  //Añade o elimina el par actual de la lista de favoritos.
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

// el widget StatelessWidget se utiliza para mostrar información que no va a cambiar
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

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

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,  // ← Here.
                destinations: [
                  //Menu
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
        ),
      );
    });
  }
}

 //es un widget que muestra un par de palabras en 
 //una tarjeta grande con un estilo específico.
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
