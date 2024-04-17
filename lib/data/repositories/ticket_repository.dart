import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/common/typedefs/typedefs.dart';
import 'package:next_starter/data/datasources/remote_datasources/ticket_remote/ticket_remote.dart';
import 'package:next_starter/data/models/ticket/ticket_detail_model.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';

@LazySingleton()
class TicketRepository extends BaseRepository {
  final TicketRemote remote;

  TicketRepository(super.networkInfo, this.remote);

  EitherResponse<List<TicketModel>> getRegularTicket({required Map<String, dynamic> params}) async {
    return handleNetworkCall(
      call: remote.getRegularTicket(params: params),
      onSuccess: (r) => r,
    );
  }

  EitherResponse<List<TicketModel>> getRecordingTicket({required Map<String, dynamic> params}) async {
    return handleNetworkCall(
      call: remote.getRecording(params: params),
      onSuccess: (r) => r,
    );
  }

  EitherResponse<TicketDetailModel> getDetailTicket({required dynamic id}) async {
    return handleNetworkCall(
      call: remote.getDetail(id: id),
      onSuccess: (r) => r,
    );
  }

}
