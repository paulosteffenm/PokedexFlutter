import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/app/core/models/pokemon_detail_model.dart';

part 'pokemon_model.g.dart';

@JsonSerializable(nullable: false)
class Pokemon {
  int entryNumber;
  String name;
  String url;
  PokemonDetail pokemonDetail;

  Pokemon({this.entryNumber, this.name, this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
