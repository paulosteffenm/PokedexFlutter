import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/bloc/pokedex_bloc.dart';
import 'package:pokemon/app/core/models/pokemon_detail_model.dart';
import 'package:pokemon/app/core/models/pokemon_model.dart';

import 'http_service.dart';

class PokedexService extends HttpService {
  final Dio _http = HttpService().instance;
  final PokedexBloc _bloc = Modular.get<PokedexBloc>();

  PokedexService() : super();

  Future<List<Pokemon>> getPokemons() async {
    try {
      final response = await _http.get('pokedex/kanto');

      final List<Pokemon> data = List<Pokemon>.from(response
          .data['pokemon_entries']
          .map((model) => Pokemon.fromJson(model)));

      for (Pokemon pokemon in data) {
        if (pokemon.entryNumber == 101) {
          pokemon.pokemonDetail = null;
        } else {
          pokemon.pokemonDetail = await _getPokemonDetail(pokemon.entryNumber);
        }
      }

      if (response.statusCode == 200) {
        _bloc.setPokemons(data);
      }

      return data;
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<PokemonDetail> _getPokemonDetail(int id) async {
    try {
      final response = await _http.get('pokemon/$id');

      if (response.statusCode == 200) {
        PokemonDetail data = PokemonDetail.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
}
