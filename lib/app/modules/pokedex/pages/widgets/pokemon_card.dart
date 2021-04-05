import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/core/models/pokemon_model.dart';
import 'package:pokemon/app/themes/pokemon_type.dart';
import 'package:pokemon/app/themes/string_theme.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard(this.pokemon);

  @override
  Widget build(BuildContext context) {
    final PokemonType pkmType = PokemonType();
    final availableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final availableWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          Modular.navigator.pushNamed('/detail', arguments: pokemon);
        },
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: NetworkImage(pokemon.pokemonDetail.urlImg),
                height: availableHeight * 0.5,
                fit: BoxFit.fill,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nº${pokemon.entryNumber.toString().padLeft(3, '0')}',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        pokemon.name.capitalize(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: pkmType.pokemonType(
                          pokemon.pokemonDetail.types, availableWidth),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
