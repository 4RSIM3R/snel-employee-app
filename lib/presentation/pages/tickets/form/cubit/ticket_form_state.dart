part of 'ticket_form_cubit.dart';

@freezed
class TicketFormState with _$TicketFormState {
  const factory TicketFormState.initial() = _Initial;
  const factory TicketFormState.loading() = _Loading;
  const factory TicketFormState.failure(String message) = _Failure;
  const factory TicketFormState.success() = _Success;
}
