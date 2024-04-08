import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_main_cubit.freezed.dart';
part 'profile_main_state.dart';

@injectable
class ProfileMainCubit extends Cubit<ProfileMainState> {
  ProfileMainCubit() : super(const ProfileMainState.initial());
}
