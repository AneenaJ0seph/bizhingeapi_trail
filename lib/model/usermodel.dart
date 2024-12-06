import 'dart:convert';

List<BusinessUser> businessUserFromJson(String str) =>
    List<BusinessUser>.from(json.decode(str).map((x) => BusinessUser.fromJson(x)));

String businessUserToJson(List<BusinessUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusinessUser {
  final int id;
  final String companyName;
  final String contactPerson;
  final String email;
  final String phone;
  final String address;
  final String uploadedFile;

  BusinessUser({
    required this.id,
    required this.companyName,
    required this.contactPerson,
    required this.email,
    required this.phone,
    required this.address,
    required this.uploadedFile,
  });

  factory BusinessUser.fromJson(Map<String, dynamic> json) => BusinessUser(
    id: json["id"],
    companyName: json["company_name"],
    contactPerson: json["contact_person"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    uploadedFile: json["uploaded_file"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_name": companyName,
    "contact_person": contactPerson,
    "email": email,
    "phone": phone,
    "address": address,
    "uploaded_file": uploadedFile,
  };
}
