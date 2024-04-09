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

  
  Future<void> get({
    required String start,
    required String end,
    required String status,
  }) async {
    emit(const CatalogListState.loading());
    final response = await repository.getRecordingTicket(params: {"start": start, "end": end, "status": status});
    response.fold(
      (l) => emit(CatalogListState.failure(l.message)),
      (r) => emit(CatalogListState.success(r)),
    );
  }

}
