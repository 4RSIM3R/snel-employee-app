class ProfileModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );
}
