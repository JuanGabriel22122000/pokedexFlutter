import 'package:flutter/material.dart';
import 'APIpokemon.dart';

class HomeController extends ChangeNotifier {
  final _service = AdminstraitorJson();
  var pokemons = <Pokemom>[];

  Future<List<Pokemom>> fetchAllTodos() async {
    pokemons = await _service.GetPokemons();
    return pokemons;
  }
}
