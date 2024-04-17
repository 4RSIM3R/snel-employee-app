import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/repositories/ticket_repository.dart';

part 'ticket_form_cubit.freezed.dart';
part 'ticket_form_state.dart';

@injectable
class TicketFormCubit extends Cubit<TicketFormState> {
  TicketFormCubit(this.repository) : super(const TicketFormState.initial());

  final TicketRepository repository;

}
