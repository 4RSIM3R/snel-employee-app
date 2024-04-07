import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_form_state.dart';
part 'ticket_form_cubit.freezed.dart';

class TicketFormCubit extends Cubit<TicketFormState> {
  TicketFormCubit() : super(TicketFormState.initial());
}
