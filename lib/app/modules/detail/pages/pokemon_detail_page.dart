import 'package:flutter/material.dart';
import 'package:pokemon/app/core/models/pokemon_model.dart';
import 'package:pokemon/app/themes/pokemon_type.dart';
import 'package:pokemon/app/themes/string_theme.dart';

class PokemonDetailPage extends StatelessWidget {
  PokemonDetailPage({Key key, @required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  Widget _appbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.grey,
      toolbarHeight: 45,
      title: Text(
        pokemon.name.capitalize().capitalize(),
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  Widget _detailTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          pokemon.name.capitalize(),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: Text(
            'Nº${pokemon.entryNumber.toString().padLeft(3, '0')}',
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _pokemonImage(double availableHeight) {
    return Image(
      image: NetworkImage(pokemon.pokemonDetail.urlImg),
      height: availableHeight * 0.4,
      fit: BoxFit.fill,
    );
  }

  Widget _pokemonStatusBar(int baseStatus, String statusName) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(statusName),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 200, 1),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              FractionallySizedBox(
                heightFactor: (baseStatus >= 150) ? 1 : baseStatus / 150,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _pokemonStatus() {
    return Card(
      color: Color.fromRGBO(164, 164, 164, 1),
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 23.0),
              child: Text(
                'Stats',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: _pokemonStatusBar(pokemon.pokemonDetail.hp, "HP"),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: _pokemonStatusBar(pokemon.pokemonDetail.attack, "Atk"),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child:
                      _pokemonStatusBar(pokemon.pokemonDetail.defense, "Def"),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: _pokemonStatusBar(
                      pokemon.pokemonDetail.specialAttack, "Sp.Atk"),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: _pokemonStatusBar(
                      pokemon.pokemonDetail.specialDefense, "Sp.Def"),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child:
                      _pokemonStatusBar(pokemon.pokemonDetail.speed, "Speed"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pokemonShape() {
    return Card(
      color: Color.fromRGBO(48, 167, 215, 1),
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'Height',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                '${pokemon.pokemonDetail.height / 10} m',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Weight',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                '${pokemon.pokemonDetail.weight / 10} kg',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _pokemonType(double availableWidth) {
    final PokemonType pkmType = PokemonType();
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 23.0),
            child: Text(
              'Type',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ),
        Card(
          color: Colors.white,
          margin: EdgeInsets.all(20),
          child:
              pkmType.pokemonType(pokemon.pokemonDetail.types, availableWidth),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final availableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final availableWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(context),
      body: Column(
        children: [
          _detailTitle(),
          _pokemonImage(availableHeight),
          _pokemonStatus(),
          _pokemonShape(),
          _pokemonType(availableWidth),
        ],
      ),
    );
  }
}
