import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/repositories/ticket_repository.dart';

part 'ticket_form_cubit.freezed.dart';
part 'ticket_form_state.dart';

@injectable
class TicketFormCubit extends Cubit<TicketFormState> {
  TicketFormCubit(this.repository) : super(const TicketFormState.initial());

  final TicketRepository repository;

  Future<void> submit({
    required Map<String, dynamic> payload,
    required List<XFile?> image,
  }) async {
    emit(const TicketFormState.loading());

    var body = Map.of(payload);

    for (var e in image) {
      body['photo[${image.indexOf(e)}]'] = await MultipartFile.fromFile(e!.path);
    }

    final response = await repository.submitTicket(payload: body);

    response.fold(
      (l) => emit(TicketFormState.failure(l.message)),
      (r) => emit(const TicketFormState.success()),
    );
  }
}
