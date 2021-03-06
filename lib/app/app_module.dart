import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/app_widget.dart';
import 'package:pokemon/app/modules/pokedex/pokedex_module.dart';

import 'core/services/analytics_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AnalyticsService()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: PokedexModule()),
      ];

  @override
  Widget get bootstrap => const AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
