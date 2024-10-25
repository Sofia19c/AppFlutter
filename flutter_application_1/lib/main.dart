import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/generatorPage.dart';
import 'package:flutter_application_1/pages/favoritesPage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // Importamos el paquete para reproducir videos de YouTube.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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

class MyAppState extends ChangeNotifier {}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  bool isDrawerOpen = false;
  bool isRailVisible = true;

  // Inicializamos el controlador de YouTube.
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Aquí inicializamos el controlador con el ID del video de YouTube.
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=2EXsmrD3_RM&t=397s')!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
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
                    backgroundColor: Colors.pink[100],
                    selectedIconTheme: IconThemeData(
                      color: Colors.pink,
                    ),
                    unselectedIconTheme: IconThemeData(
                      color: Colors.pink[300],
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Text(
                            'Bellísimas Nails Academia de uñas online Cursos Virtuales',
                            style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Bellísimas Nails academia de uñas virtual, aprende con nosotros y conviértete en manicurista profesional, estudia con nuestros cursos virtuales y aprende todo sobre el mundo de uñas.',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Añadimos el video con márgenes aquí.
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Márgenes a los lados
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
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
