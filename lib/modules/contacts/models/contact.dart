import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  Contact({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.notes,
    this.picture,
    this.phone,
  });

  @override
  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? notes;
  final List<String?>? picture;
  final String? phone;

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
