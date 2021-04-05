part of 'pokemon_detail_model.dart';

PokemonDetail _$PokemonDetailFromJson(Map<String, dynamic> json) {
  return PokemonDetail(
    id: json['id'] as int,
    name: json['name'] as String,
    urlImg: json['sprites']['front_default'] as String,
    types: json['types'] as List<dynamic>,
    hp: json['stats'][0]['base_stat'],
    attack: json['stats'][1]['base_stat'],
    defense: json['stats'][2]['base_stat'],
    specialAttack: json['stats'][3]['base_stat'],
    specialDefense: json['stats'][4]['base_stat'],
    speed: json['stats'][5]['base_stat'],
    height: json['height'],
    weight: json['weight'],
  );
}
