import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/bloc/pokedex_bloc.dart';
import 'package:pokemon/app/core/models/pokemon_model.dart';
import 'package:pokemon/app/core/services/pokedex_service.dart';

class PokedexController extends Disposable {
  final PageController pageController = PageController();
  final PokedexBloc pokedexBloc = Modular.get<PokedexBloc>();
  final PokedexService pokedexService = Modular.get<PokedexService>();

  bool isLoading = false;

  Future<List<Pokemon>> getPokemons() {
    return pokedexService.getPokemons();
  }

  void initState() {
    isLoading = true;
    getPokemons().whenComplete(() => isLoading = false);
  }

  @override
  void dispose() {
    pageController.dispose();
  }
}
