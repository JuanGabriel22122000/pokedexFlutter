import 'package:flutter/material.dart';

class Barra extends StatelessWidget {
  const Barra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 192, 191, 191),
            Colors.white,
          ])),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              "Pokedex",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.10,
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.menu),
            iconSize: MediaQuery.of(context).size.width * 0.10,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
