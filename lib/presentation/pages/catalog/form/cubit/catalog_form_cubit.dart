import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_form_state.dart';
part 'catalog_form_cubit.freezed.dart';

class CatalogFormCubit extends Cubit<CatalogFormState> {
  CatalogFormCubit() : super(CatalogFormState.initial());
}
