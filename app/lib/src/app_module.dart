import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/configuration/domain/services/configuration_service.dart';
import 'package:listinha/src/configuration/domain/services/configuration_service_imp.dart';
import 'package:listinha/src/configuration/presenter/ui/pages/configuration_page.dart';
import 'package:listinha/src/home/core/moduls/home_module.dart';
import 'package:listinha/src/shared/services/realm/realm_config.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => AppStore(i())),
        Bind.factory<ConfigurationService>((i) => ConfigurationServiceImp(i())),
        Bind.instance<Realm>(Realm(config)),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        ),
      ];
}
