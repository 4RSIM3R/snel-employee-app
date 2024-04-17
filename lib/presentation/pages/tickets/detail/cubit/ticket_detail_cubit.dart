import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/models/ticket/ticket_detail_model.dart';
import 'package:next_starter/data/repositories/ticket_repository.dart';

part 'ticket_detail_cubit.freezed.dart';
part 'ticket_detail_state.dart';

@injectable
class TicketDetailCubit extends Cubit<TicketDetailState> {
  TicketDetailCubit(this.repository) : super(const TicketDetailState.initial());

  final TicketRepository repository;

  Future<void> get(dynamic id) async {
    emit(const TicketDetailState.loading());
    final response = await repository.getDetailTicket(id: id);
    response.fold((l) => null, (r) => null);
  }
}
