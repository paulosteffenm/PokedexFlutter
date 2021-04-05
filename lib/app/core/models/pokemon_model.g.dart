part of 'pokemon_model.dart';

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    entryNumber: json['entry_number'] as int,
    name: json['pokemon_species']['name'] as String,
    url: json['pokemon_species']['url'] as String,
  );
}
