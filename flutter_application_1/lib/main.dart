import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/generatorPage.dart';
import 'package:flutter_application_1/pages/favoritesPage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          'assets/images/logo_Bellisimas.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            SizedBox(height: 20),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Text(
                              'Cursos virtuales 100% Profesionales',
                              style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: Image.asset(
                                'assets/images/unias_uno.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20), // Espacio adicional para separación
                      Container(
                        color: Colors.white,
                        child: page,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
