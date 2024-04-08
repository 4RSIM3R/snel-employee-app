import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';
import 'package:next_starter/data/repositories/ticket_repository.dart';

part 'ticket_list_cubit.freezed.dart';
part 'ticket_list_state.dart';

// {"start": start, "end": end, "status": status}

@injectable
class TicketListCubit extends Cubit<TicketListState> {
  TicketListCubit(this.repository) : super(const TicketListState.initial());

  final TicketRepository repository;

  Future<void> get({
    required String start,
    required String end,
    required String status,
  }) async {
    emit(const TicketListState.loading());
    final response = await repository.getRegularTicket(params: {"start": start, "end": end, "status": status});
    response.fold(
      (l) => emit(TicketListState.failure(l.message)),
      (r) => emit(TicketListState.success(r)),
    );
  }
}
