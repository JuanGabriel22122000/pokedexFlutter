import 'package:flutter/material.dart';
import 'package:pokedex/screens/homepage.dart';
import 'APIpokemon.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HomePageList()),
    );
  }
}
