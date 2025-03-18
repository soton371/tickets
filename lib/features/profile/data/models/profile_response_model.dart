// To parse this JSON data, do
//
//     final profileResponseModel = profileResponseModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/profile_response_entities.dart';

ProfileResponseModel profileResponseModelFromJson(String str) => ProfileResponseModel.fromJson(json.decode(str));

class ProfileResponseModel extends ProfileResponseEntities{

  ProfileResponseModel({
    super.name,
    super.role,
    super.email,
    super.firstName,
    super.lastName,
    super.avatar,
    super.assignedRoles,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
    name: json["name"],
    role: json["role"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
    assignedRoles: json["assigned_roles"] == null ? [] : List<AssignedRole>.from(json["assigned_roles"]!.map((x) => AssignedRole.fromJson(x))),
  );


}

class AssignedRole extends AssignedRoleEntities{

  AssignedRole({
    super.title,
    super.group,
    super.manager,
    super.avatar,
  });

  factory AssignedRole.fromJson(Map<String, dynamic> json) => AssignedRole(
    title: json["title"],
    group: json["group"],
    manager: json["manager"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "group": group,
    "manager": manager,
    "avatar": avatar,
  };
}
