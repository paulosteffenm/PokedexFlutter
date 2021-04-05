import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pokemon/app/core/models/pokemon_model.dart';
import 'package:rxdart/rxdart.dart';

class PokedexBloc extends BlocBase {
  final BehaviorSubject<List<Pokemon>> _PokemonsSubject =
      BehaviorSubject<List<Pokemon>>();

  Stream<List<Pokemon>> get pokemons => _PokemonsSubject.stream;

  PokedexBloc();

  void setPokemons(List<Pokemon> data) {
    _PokemonsSubject.add(data);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
