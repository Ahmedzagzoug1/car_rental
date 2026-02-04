import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic json) {
    if (json is Timestamp) return json.toDate(); //for firebase
    if (json is String) return DateTime.parse(json); //if String got from anywhere
    if (json is DateTime) return json; //if it is datetime
    return DateTime.now();
  }

  @override
  dynamic toJson(DateTime date) => date.toIso8601String();
}
