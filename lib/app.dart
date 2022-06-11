<<<<<<< HEAD
import 'package:app_dieta/screens/home_page.dart';
import 'package:app_dieta/screens/search.dart';
=======
import 'package:dieta/screens/home.dart';
import 'package:dieta/screens/search.dart';
>>>>>>> b187f2442d5186c589f6b45b3a6e3d5e070c6caa
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
<<<<<<< HEAD
        '/': (context) => const HomePage(),
=======
        '/': (context) => const Home(),
>>>>>>> b187f2442d5186c589f6b45b3a6e3d5e070c6caa
        '/search': (context) => const Search(),
      },
    );
  }
}
