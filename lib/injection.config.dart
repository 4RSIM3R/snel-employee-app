// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_cubit.dart' as _i31;
import 'application/bloc/pagination_bloc.dart' as _i32;
import 'common/network/network_info.dart' as _i7;
import 'common/permission/permission.dart' as _i8;
import 'common/permission/permission_impl.dart' as _i9;
import 'common/storage/shared_pref_storage.dart' as _i10;
import 'common/storage/storage.dart' as _i13;
import 'common/storage/storage_path.dart' as _i11;
import 'common/utils/image_resize.dart' as _i6;
import 'data/datasources/network/network_source.dart' as _i34;
import 'data/datasources/remote_datasources/auth_remote/auth_remote.dart'
    as _i17;
import 'data/datasources/remote_datasources/auth_remote/auth_remote_impl.dart'
    as _i18;
import 'data/datasources/remote_datasources/catalog_remote/catalog_remote.dart'
    as _i21;
import 'data/datasources/remote_datasources/catalog_remote/catalog_remote_impl.dart'
    as _i22;
import 'data/datasources/remote_datasources/post_remote/post_remote.dart'
    as _i24;
import 'data/datasources/remote_datasources/post_remote/post_remote_impl.dart'
    as _i25;
import 'data/datasources/remote_datasources/profile_remote/profile_remote.dart'
    as _i27;
import 'data/datasources/remote_datasources/profile_remote/profile_remote_impl.dart'
    as _i28;
import 'data/datasources/remote_datasources/ticket_remote/ticket_remote.dart'
    as _i14;
import 'data/datasources/remote_datasources/ticket_remote/ticket_remote_impl.dart'
    as _i15;
import 'data/datasources/session/session_source.dart' as _i12;
import 'data/repositories/auth_repository.dart' as _i19;
import 'data/repositories/catalog_repository.dart' as _i23;
import 'data/repositories/post_repository.dart' as _i26;
import 'data/repositories/profile_repository.dart' as _i29;
import 'data/repositories/ticket_repository.dart' as _i16;
import 'presentation/pages/catalog/list/cubit/catalog_list_cubit.dart' as _i20;
import 'presentation/pages/profile/main/cubit/profile_main_cubit.dart' as _i33;
import 'presentation/pages/tickets/list/cubit/ticket_list_cubit.dart' as _i30;
import 'presentation/routes/app_router.dart' as _i3;

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
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.Dio>(() => apiService.dio());
  gh.lazySingleton<_i5.ImagePicker>(() => apiService.imagePicker);
  gh.lazySingleton<_i6.ImageResizeUtils>(() => _i6.ImageResizeUtils());
  gh.lazySingleton<_i7.NetworkInfo>(() => const _i7.NetworkInfoImpl());
  gh.lazySingleton<_i8.PermissionInterface>(
      () => const _i9.KendaliPermission());
  gh.lazySingleton<_i10.SharedPrefStorageInterface>(
      () => _i10.SharedPreferenceStorage());
  await gh.factoryAsync<_i11.StoragePathInterface>(
    () => apiService.init(),
    preResolve: true,
  );
  gh.lazySingleton<_i12.SessionSource>(
      () => _i12.SessionSource(storage: gh<_i10.SharedPrefStorageInterface>()));
  gh.lazySingleton<_i13.StorageInterface>(() => _i13.Storage(
        permission: gh<_i8.PermissionInterface>(),
        storagePath: gh<_i11.StoragePathInterface>(),
      ));
  gh.lazySingleton<_i14.TicketRemote>(() => _i15.TicketRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i12.SessionSource>(),
      ));
  gh.lazySingleton<_i16.TicketRepository>(() => _i16.TicketRepository(
        gh<_i7.NetworkInfo>(),
        gh<_i14.TicketRemote>(),
      ));
  gh.lazySingleton<_i17.AuthRemote>(() => _i18.AuthRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i12.SessionSource>(),
      ));
  gh.lazySingleton<_i19.AuthRepository>(() => _i19.AuthRepository(
        gh<_i7.NetworkInfo>(),
        gh<_i17.AuthRemote>(),
        gh<_i12.SessionSource>(),
      ));
  gh.factory<_i20.CatalogListCubit>(
      () => _i20.CatalogListCubit(gh<_i16.TicketRepository>()));
  gh.lazySingleton<_i21.CatalogRemote>(() => _i22.CatalogRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i12.SessionSource>(),
      ));
  gh.lazySingleton<_i23.CatalogRepository>(() => _i23.CatalogRepository(
        gh<_i7.NetworkInfo>(),
        gh<_i21.CatalogRemote>(),
      ));
  gh.lazySingleton<_i24.PostRemote>(() => _i25.PostRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i12.SessionSource>(),
      ));
  gh.lazySingleton<_i26.PostRepository>(() => _i26.PostRepository(
        gh<_i7.NetworkInfo>(),
        gh<_i24.PostRemote>(),
      ));
  gh.lazySingleton<_i27.ProfileRemote>(() => _i28.ProfileRemoteImpl(
        gh<_i4.Dio>(),
        gh<_i12.SessionSource>(),
      ));
  gh.lazySingleton<_i29.ProfileRepositry>(() => _i29.ProfileRepositry(
        gh<_i7.NetworkInfo>(),
        gh<_i27.ProfileRemote>(),
      ));
  gh.factory<_i30.TicketListCubit>(
      () => _i30.TicketListCubit(gh<_i16.TicketRepository>()));
  gh.factory<_i31.AuthCubit>(() => _i31.AuthCubit(gh<_i19.AuthRepository>()));
  gh.factory<_i32.PaginationBloc>(
      () => _i32.PaginationBloc(gh<_i26.PostRepository>()));
  gh.factory<_i33.ProfileMainCubit>(
      () => _i33.ProfileMainCubit(gh<_i29.ProfileRepositry>()));
  return getIt;
}

class _$ApiService extends _i34.ApiService {}
