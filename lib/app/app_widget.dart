import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/themes/pokemon_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'POKEMON',
      theme: PokemonTheme(context).defaultTheme(),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
