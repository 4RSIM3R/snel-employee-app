import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/data/datasources/remote_datasources/catalog_remote/catalog_remote.dart';

@LazySingleton()
class CatalogRepository extends BaseRepository {
  final CatalogRemote remote;

  CatalogRepository(super.networkInfo, this.remote);
}
