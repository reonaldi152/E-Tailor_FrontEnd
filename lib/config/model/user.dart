import 'package:json_annotation/json_annotation.dart';

import 'dart:convert';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({this.id, this.name, this.email, this.phone});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  final dynamic id;
  final dynamic name;
  final dynamic email;
  final dynamic phone;

  @override
  String toString() => json.encode(this);
}
