import 'dart:convert';

class User {
  int id;
  String email;
  String pseudo;
  String zipCode;
  String firstName;
  String lastName;
  bool mailValidated;
  String hashSalt; 

  User({
    required this.id,
    required this.email,
    required this.pseudo,
    required this.zipCode,
    required this.firstName,
    required this.lastName,
    required this.mailValidated,
    required this.hashSalt,
  });

  User copyWith({
    int? id,
    String? email,
    String? pseudo,
    String? zipCode,
    String? firstName,
    String? lastName,
    bool? mailValidated,
    String? hashSalt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      pseudo: pseudo ?? this.pseudo,
      zipCode: zipCode ?? this.zipCode,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      mailValidated: mailValidated ?? this.mailValidated,
      hashSalt: hashSalt ?? this.hashSalt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'pseudo': pseudo,
      'zipCode': zipCode,
      'firstName': firstName,
      'lastName': lastName,
      'mailValidated': mailValidated,
      'hashSalt': hashSalt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      email: map['email'] ?? '',
      pseudo: map['pseudo'] ?? '',
      zipCode: map['zipCode'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      mailValidated: map['mailValidated'] ?? false,
      hashSalt: map['hashSalt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, email: $email, pseudo: $pseudo, zipCode: $zipCode, firstName: $firstName, lastName: $lastName, mailValidated: $mailValidated, hashSalt: $hashSalt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.id == id &&
      other.email == email &&
      other.pseudo == pseudo &&
      other.zipCode == zipCode &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.mailValidated == mailValidated &&
      other.hashSalt == hashSalt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      email.hashCode ^
      pseudo.hashCode ^
      zipCode.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      mailValidated.hashCode ^
      hashSalt.hashCode;
  }
}
