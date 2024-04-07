// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i7;

import 'application/auth/auth_cubit.dart' as _i28;
import 'application/bloc/pagination_bloc.dart' as _i31;
import 'common/network/network_info.dart' as _i13;
import 'common/permission/permission.dart' as _i10;
import 'common/permission/permission_impl.dart' as _i11;
import 'common/storage/shared_pref_storage.dart' as _i9;
import 'common/storage/storage.dart' as _i12;
import 'common/storage/storage_path.dart' as _i3;
import 'common/utils/image_resize.dart' as _i4;
import 'data/datasources/network/network_source.dart' as _i32;
import 'data/datasources/remote_datasources/auth_remote/auth_remote.dart'
    as _i17;
import 'data/datasources/remote_datasources/auth_remote/auth_remote_impl.dart'
    as _i18;
import 'data/datasources/remote_datasources/catalog_remote/catalog_remote.dart'
    as _i22;
import 'data/datasources/remote_datasources/catalog_remote/catalog_remote_impl.dart'
    as _i23;
import 'data/datasources/remote_datasources/post_remote/post_remote.dart'
    as _i15;
import 'data/datasources/remote_datasources/post_remote/post_remote_impl.dart'
    as _i16;
import 'data/datasources/remote_datasources/profile_remote/profile_remote.dart'
    as _i25;
import 'data/datasources/remote_datasources/profile_remote/profile_remote_impl.dart'
    as _i26;
import 'data/datasources/remote_datasources/ticket_remote/ticket_remote.dart'
    as _i19;
import 'data/datasources/remote_datasources/ticket_remote/ticket_remote_impl.dart'
    as _i20;
import 'data/datasources/session/session_source.dart' as _i14;
import 'data/repositories/auth_repository.dart' as _i21;
import 'data/repositories/catalog_repository.dart' as _i27;
import 'data/repositories/post_repository.dart' as _i30;
import 'data/repositories/profile_repository.dart' as _i29;
import 'data/repositories/ticket_repository.dart' as _i24;
import 'presentation/routes/app_router.dart' as _i8;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final apiService = _$ApiService();
  await gh.factoryAsync<_i3.StoragePathInterface>(
    () => apiService.init(),
    preResolve: true,
  );
  gh.lazySingleton<_i4.ImageResizeUtils>(() => _i4.ImageResizeUtils());
  gh.lazySingleton<_i5.ImagePicker>(() => apiService.imagePicker);
  gh.lazySingleton<_i6.Dio>(() => apiService.dio());
  gh.lazySingleton<_i7.InternetConnection>(
      () => apiService.internetConnectionChecker());
  gh.lazySingleton<_i8.AppRouter>(() => _i8.AppRouter());
  gh.lazySingleton<_i9.SharedPrefStorageInterface>(
      () => _i9.SharedPreferenceStorage());
  gh.lazySingleton<_i10.PermissionInterface>(
      () => const _i11.KendaliPermission());
  gh.lazySingleton<_i12.StorageInterface>(() => _i12.Storage(
        permission: gh<_i10.PermissionInterface>(),
        storagePath: gh<_i3.StoragePathInterface>(),
      ));
  gh.lazySingleton<_i13.NetworkInfo>(
      () => _i13.NetworkInfoImpl(gh<_i7.InternetConnection>()));
  gh.lazySingleton<_i14.SessionSource>(
      () => _i14.SessionSource(storage: gh<_i9.SharedPrefStorageInterface>()));
  gh.lazySingleton<_i15.PostRemote>(() => _i16.PostRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i17.AuthRemote>(() => _i18.AuthRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i19.TicketRemote>(() => _i20.TicketRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i21.AuthRepository>(() => _i21.AuthRepository(
        gh<_i13.NetworkInfo>(),
        gh<_i17.AuthRemote>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i22.CatalogRemote>(() => _i23.CatalogRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i24.TicketRepository>(() => _i24.TicketRepository(
        gh<_i13.NetworkInfo>(),
        gh<_i19.TicketRemote>(),
      ));
  gh.lazySingleton<_i25.ProfileRemote>(() => _i26.ProfileRemoteImpl(
        gh<_i6.Dio>(),
        gh<_i14.SessionSource>(),
      ));
  gh.lazySingleton<_i27.CatalogRepository>(() => _i27.CatalogRepository(
        gh<_i13.NetworkInfo>(),
        gh<_i22.CatalogRemote>(),
      ));
  gh.factory<_i28.AuthCubit>(() => _i28.AuthCubit(gh<_i21.AuthRepository>()));
  gh.lazySingleton<_i29.ProfileRepositry>(() => _i29.ProfileRepositry(
        gh<_i13.NetworkInfo>(),
        gh<_i25.ProfileRemote>(),
      ));
  gh.lazySingleton<_i30.PostRepository>(() => _i30.PostRepository(
        gh<_i13.NetworkInfo>(),
        gh<_i15.PostRemote>(),
      ));
  gh.factory<_i31.PaginationBloc>(
      () => _i31.PaginationBloc(gh<_i30.PostRepository>()));
  return getIt;
}

class _$ApiService extends _i32.ApiService {}
