import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';
import 'package:next_starter/data/repositories/ticket_repository.dart';

part 'catalog_list_cubit.freezed.dart';
part 'catalog_list_state.dart';

@injectable
class CatalogListCubit extends Cubit<CatalogListState> {
  CatalogListCubit(this.repository) : super(const CatalogListState.initial());

  final TicketRepository repository;

}
