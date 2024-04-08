class CustomerModel {
  final int? id;
  final int? companyId;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CustomerModel({
    this.id,
    this.companyId,
    this.name,
    this.email,
    this.phoneNumber,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        companyId: json["company_id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );
}