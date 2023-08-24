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
    this.errorMessage,
  });

  @override
  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? notes;
  final List<String?>? picture;
  final String? phone;
  @JsonKey(name: 'error', includeFromJson: true, includeToJson: false)
  final String? errorMessage;

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  bool isChanged(Contact contact) =>
      firstName?.trim() != contact.firstName?.trim() ||
      lastName?.trim() != contact.lastName?.trim() ||
      email?.trim() != contact.email?.trim() ||
      notes?.trim() != contact.notes?.trim() ||
      phone?.trim() != contact.phone?.trim();
}
