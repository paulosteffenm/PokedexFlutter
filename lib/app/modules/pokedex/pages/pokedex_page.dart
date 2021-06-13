import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/core/models/pokemon_model.dart';
import 'package:pokemon/app/core/widgets/loader_widget.dart';
import 'package:pokemon/app/modules/pokedex/pages/pokedex_controller.dart';
import 'package:pokemon/app/modules/pokedex/pages/widgets/pokemon_card.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends ModularState<PokedexPage, PokedexController> {
  Stream<List<Pokemon>> pokemonStream;

  Stream<List<Pokemon>> _getPokemons() {
    setState(() {
      controller.isLoading = true;
    });

    controller.pokedexService.getPokemons().whenComplete(() {
      setState(() => controller.isLoading = false);
    });

    return controller.pokedexBloc.pokemons;
  }

  @override
  void initState() {
    super.initState();

    //uncomment this line to see Crashlytics works
    //FirebaseCrashlytics.instance.crash();
    controller.initState();
    pokemonStream = controller.pokedexBloc.pokemons;
  }

  void refresh() {
    setState(() {
      pokemonStream = _getPokemons();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.red,
      toolbarHeight: 45,
      title: const Center(
        child: Text(
          'Pokemon',
          textAlign: TextAlign.center,
        ),
      ),
      centerTitle: false,
    );
  }

  Widget _mainContent() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          refresh();
        },
        child: StreamBuilder(
          stream: pokemonStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
            if (controller.isLoading) {
              return Center(child: Loader()); //loader
            }
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  final Pokemon pokemon = snapshot.data[index];
                  if (pokemon.pokemonDetail == null) {
                    return Text(pokemon.name);
                  }
                  return PokemonCard(pokemon);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _mainContent();
  }
}
