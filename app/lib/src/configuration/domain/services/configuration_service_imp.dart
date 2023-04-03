import 'package:listinha/src/configuration/domain/services/configuration_service.dart';
import 'package:listinha/src/shared/services/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

class ConfigurationServiceImp implements ConfigurationService {
  final Realm realm;

  ConfigurationServiceImp(this.realm);

  @override
  ConfigurationModel getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = getConfiguration();
    realm.write(() {
      model.themeModeName = themeModeName;
      model.syncDate = syncDate;
    });
  }

  @override
  void deletAll() {
    realm.deleteAll();
  }
}
