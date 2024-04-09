import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/common/typedefs/typedefs.dart';
import 'package:next_starter/data/datasources/remote_datasources/profile_remote/profile_remote.dart';
import 'package:next_starter/data/models/profile/profile_model.dart';

@LazySingleton()
class ProfileRepositry extends BaseRepository {
  final ProfileRemote remote;

  ProfileRepositry(super.networkInfo, this.remote);

  EitherResponse<ProfileModel> getProfile() async {
    return handleNetworkCall(call: remote.getProfile(), onSuccess: (r) => r);
  }
}
