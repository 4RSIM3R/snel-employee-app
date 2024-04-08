import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_form_cubit.freezed.dart';
part 'catalog_form_state.dart';


class CatalogFormCubit extends Cubit<CatalogFormState> {
  CatalogFormCubit() : super(const CatalogFormState.initial());
}
