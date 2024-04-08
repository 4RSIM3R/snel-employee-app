import 'package:next_starter/data/models/customer/customer_model.dart';
import 'package:next_starter/data/models/site/site_model.dart';

class TicketModel {
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
  final CustomerModel? customer;
  final SiteModel? site;

  TicketModel({
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
    this.customer,
    this.site,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
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
        customer: json["customer"] == null ? null : CustomerModel.fromJson(json["customer"]),
        site: json["site"] == null ? null : SiteModel.fromJson(json["site"]),
      );
}




