import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String telp;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.telp,
    required this.token,
  });

  // Factory method to create a User instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      telp: json['telp'],
      token: json['token'],
    );
  }

  // Method to convert a User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'telp': telp,
      'token': token,
    };
  }

  // Method to convert a JSON string to a User instance
  static User fromJsonString(String jsonString) {
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return User.fromJson(jsonData);
  }

  // Method to convert a User instance to a JSON string
  String toJsonString() {
    final Map<String, dynamic> jsonData = toJson();
    return json.encode(jsonData);
  }
}
