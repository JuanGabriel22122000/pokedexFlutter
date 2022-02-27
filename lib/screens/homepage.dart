import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/screens/Detalhes/Barrra.dart';
import 'package:pokedex/screens/perfilpage.dart';
import '../APIpokemon.dart';
import '../Homecontroller.dart';

class HomePageList extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);
  @override
  State<HomePageList> createState() => HomePageState();
}

class HomePageState extends State<HomePageList> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.fetchAllTodos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Barra(),
                  Flexible(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      controller: ScrollController(),
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      itemCount: controller.pokemons.length,
                      itemBuilder: (BuildContext context, int i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PerfilPokemon(
                                      PokemonName: controller.pokemons[i].name,
                                      PokemonColor:
                                          controller.pokemons[i].baseColor,
                                    )));
                          },
                          child: Container(
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: controller.pokemons[i].baseColor,
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  child: Icon(
                                    Icons.catching_pokemon,
                                    size: MediaQuery.of(context).size.width *
                                        0.35,
                                    color: Colors.white24,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  alignment: Alignment.topLeft,
                                  child: Text(controller.pokemons[i].name,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: ListView.builder(
                                      padding: EdgeInsets.fromLTRB(
                                          20,
                                          MediaQuery.of(context).size.width *
                                              0.20,
                                          MediaQuery.of(context).size.width *
                                              0.20,
                                          10),
                                      itemCount:
                                          controller.pokemons[i].poderes.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                Colors.white10,
                                                Pokemom.color(
                                                    type: controller.pokemons[i]
                                                        .poderes[index]),
                                                Pokemom.color(
                                                    type: controller.pokemons[i]
                                                        .poderes[index]),
                                                Pokemom.color(
                                                    type: controller.pokemons[i]
                                                        .poderes[index]),
                                              ]),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Text(
                                            controller
                                                .pokemons[i].poderes[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Image.network(
                                    controller.pokemons[i].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          } else if (!snapshot.hasError) {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }
}
