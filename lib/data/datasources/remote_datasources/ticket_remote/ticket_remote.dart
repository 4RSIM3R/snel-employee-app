import 'package:next_starter/data/models/ticket/ticket_model.dart';

abstract class TicketRemote {
  Future<List<TicketModel>> getRegularTicket({required Map<String, dynamic> params});
  Future<List<TicketModel>> getRecording({required Map<String, dynamic> params});
  Future<void> submit();
}