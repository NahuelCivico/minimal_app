import 'dart:convert';

class CustomerModel {
  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String photo;

  CustomerModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photo,
  });

  CustomerModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? photo,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'photo': photo,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'] ?? 0,
      firstName: map['firstname'] != '' ? map['firstname'] : 'Empty',
      lastName: map['lastname'] != '' ? map['lastname'] : 'Empty',
      email: map['email'] != '' ? map['email'] : 'Empty',
      photo: map['photo'] != '' ? map['photo'] : '',
    );
  }

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, photo: $photo)';
  }

  @override
  bool operator ==(covariant CustomerModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        photo.hashCode;
  }
}
