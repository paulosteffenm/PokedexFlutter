import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/bloc/pokedex_bloc.dart';
import 'package:pokemon/app/core/services/pokedex_service.dart';
import 'package:pokemon/app/modules/detail/pages/pokemon_detail_page.dart';
import 'package:pokemon/app/modules/pokedex/pages/pokedex_controller.dart';
import 'package:pokemon/app/modules/pokedex/pages/pokedex_page.dart';

class PokedexModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PokedexController()),
        Bind((i) => PokedexBloc()),
        Bind((i) => PokedexService()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (context, args) => const PokedexPage()),
        ModularRouter('/detail',
            child: (context, args) => PokemonDetailPage(pokemon: args.data)),
      ];
}
