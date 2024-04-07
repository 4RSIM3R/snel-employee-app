import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/data/datasources/remote_datasources/catalog_remote/catalog_remote.dart';

@LazySingleton(as: CatalogRemote)
class CatalogRemoteImpl extends BaseDioRemoteSource implements CatalogRemote {
  CatalogRemoteImpl(super.dio, super.session);
}
