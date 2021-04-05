import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail_model.g.dart';

@JsonSerializable(nullable: false)
class PokemonDetail {
  int id;
  String name;
  String urlImg;
  List<dynamic> types;
  int hp;
  int attack;
  int defense;
  int specialAttack;
  int specialDefense;
  int speed;
  int height;
  int weight;

  PokemonDetail(
      {this.id,
      this.name,
      this.urlImg,
      this.types,
      this.hp,
      this.attack,
      this.defense,
      this.specialAttack,
      this.specialDefense,
      this.speed,
      this.height,
      this.weight});

  factory PokemonDetail.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailFromJson(json);
}
