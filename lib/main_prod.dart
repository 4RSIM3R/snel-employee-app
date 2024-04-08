import 'package:flavor/flavor.dart';
import 'package:next_starter/bootstrap.dart';

import 'common/utils/config.dart';

void main() {
  Flavor.create(
    Environment.production,
    properties: {
      Keys.apiUrl: 'https://snel.nexteam.id/api/',
      Configs.customKey: 'value',
    },
  );
  bootstrap();
}
