import 'package:flutter/material.dart';

class PerfilPokemon extends StatefulWidget {
  const PerfilPokemon({required this.PokemonName, required this.PokemonColor});
  final String PokemonName;
  final Color PokemonColor;

  @override
  State<PerfilPokemon> createState() => PerfilPokemonState();
}

class PerfilPokemonState extends State<PerfilPokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.PokemonColor,
      ),
      body: Container(
        child: Text(widget.PokemonName),
      ),
    );
  }
}
