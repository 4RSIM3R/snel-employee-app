import 'package:next_starter/data/models/customer/customer_model.dart';
import 'package:next_starter/data/models/profile/profile_model.dart';
import 'package:next_starter/data/models/site/site_model.dart';
import 'package:next_starter/data/models/ticket/ticket_history_model.dart';

class TicketDetailModel {
  final int? id;
  final int? customerId;
  final int? siteId;
  final int? employeeId;
  final DateTime? date;
  final String? number;
  final String? title;
  final String? information;
  final String? type;
  final String? status;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic canceledBy;
  final List<dynamic>? photo;
  final ProfileModel? employee;
  final CustomerModel? customer;
  final SiteModel? site;
  final List<TicketHistoryModel>? histories;

  TicketDetailModel({
    this.id,
    this.customerId,
    this.siteId,
    this.employeeId,
    this.date,
    this.number,
    this.title,
    this.information,
    this.type,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.canceledBy,
    this.photo,
    this.employee,
    this.customer,
    this.site,
    this.histories,
  });

  factory TicketDetailModel.fromJson(Map<String, dynamic> json) => TicketDetailModel(
        id: json["id"],
        customerId: json["customer_id"],
        siteId: json["site_id"],
        employeeId: json["employee_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        number: json["number"],
        title: json["title"],
        information: json["information"],
        type: json["type"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        canceledBy: json["canceled_by"],
        photo: json["photo"] == null ? [] : List<dynamic>.from(json["photo"]!.map((x) => x)),
        employee: json["employee"] == null ? null : ProfileModel.fromJson(json["employee"]),
        customer: json["customer"] == null ? null : CustomerModel.fromJson(json["customer"]),
        site: json["site"] == null ? null : SiteModel.fromJson(json["site"]),
        histories: json["histories"] == null
            ? []
            : List<TicketHistoryModel>.from(json["histories"]!.map((x) => TicketHistoryModel.fromJson(x))),
      );
}
