// To parse this JSON data, do
//
//     final contactListResponseModel = contactListResponseModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/contact_list_response_entities.dart';

List<ContactListResponseModel> contactListResponseModelFromJson(String str) =>
    List<ContactListResponseModel>.from(
      json.decode(str).map((x) => ContactListResponseModel.fromJson(x)),
    );

class ContactListResponseModel extends ContactListResponseEntities {
  ContactListResponseModel({
    super.name,
    super.email,
    super.phone,
    super.address,
    super.avatar,
  });

  factory ContactListResponseModel.fromJson(Map<String, dynamic> json) =>
      ContactListResponseModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        avatar: json["avatar"],
      );
}
