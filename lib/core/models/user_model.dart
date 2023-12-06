import 'dart:convert';

import 'package:tots_core/tots_core.dart';

class UserModel extends TotsBaseEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String photo;
  final String accessToken;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photo,
    required this.accessToken,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'photo': photo,
      'accessToken': accessToken,
    };
  }

  factory UserModel.empty() {
    return UserModel(
      firstName: '',
      lastName: '',
      email: '',
      photo: '',
      accessToken: '',
    );
  }

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? photo,
    String? accessToken,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'photo': photo,
      'accessToken': accessToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstname'] ?? '',
      lastName: map['lastname'] ?? '',
      email: map['email'] ?? '',
      photo: map['photo'] ?? '',
      accessToken: map['access_token'] ?? '',
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, email: $email, photo: $photo, accessToken: $accessToken)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.photo == photo &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        photo.hashCode ^
        accessToken.hashCode;
  }
}
