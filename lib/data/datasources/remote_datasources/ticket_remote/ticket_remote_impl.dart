import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/common/utils/api_path.dart';
import 'package:next_starter/data/datasources/remote_datasources/ticket_remote/ticket_remote.dart';
import 'package:next_starter/data/models/ticket/ticket_detail_model.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';

@LazySingleton(as: TicketRemote)
class TicketRemoteImpl extends BaseDioRemoteSource implements TicketRemote {
  TicketRemoteImpl(super.dio, super.session);

  @override
  Future<List<TicketModel>> getRecording({required Map<String, dynamic> params}) async {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.get(ApiPath.regularTicket, queryParameters: params),
      onResponse: (json) => (json['data'] as List).map((e) => TicketModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<List<TicketModel>> getRegularTicket({required Map<String, dynamic> params}) async {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.get(ApiPath.regularTicket, queryParameters: params),
      onResponse: (json) => (json['data'] as List).map((e) => TicketModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<bool> submit({required FormData data}) async {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.post(ApiPath.submitTicket, data: data),
      onResponse: (json) => true,
    );
  }

  @override
  Future<TicketDetailModel> getDetail({required id}) async {
    return networkRequest(
      isAuth: true,
      request: (dio) => dio.get('${ApiPath.detailTicket}/$id'),
      onResponse: (json) => TicketDetailModel.fromJson(json['data']),
    );
  }
}
