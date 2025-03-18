// To parse this JSON data, do
//
//     final ticketListResponseModel = ticketListResponseModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/ticket_list_response_entities.dart';

List<TicketListResponseModel> ticketListResponseModelFromJson(String str) => List<TicketListResponseModel>.from(json.decode(str).map((x) => TicketListResponseModel.fromJson(x)));


class TicketListResponseModel extends TicketListResponseEntities{


  TicketListResponseModel({
    super.id,
    super.status,
    super.subject,
    super.user,
    super.timestamp,
    super.priority,
    super.state,
  });

  factory TicketListResponseModel.fromJson(Map<String, dynamic> json) => TicketListResponseModel(
    id: json["id"],
    status: json["status"],
    subject: json["subject"],
    user: json["user"],
    timestamp: json["timestamp"],
    priority: json["priority"],
    state: json["state"] == null ? [] : List<String>.from(json["state"]!.map((x) => x)),
  );

}
