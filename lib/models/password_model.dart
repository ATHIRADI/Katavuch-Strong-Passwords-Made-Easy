import 'dart:convert';

class PasswordModel {
  final int id;
  final String password;

  PasswordModel({
    required this.id,
    required this.password,
  });

  PasswordModel copyWith({
    int? id,
    String? password,
  }) {
    return PasswordModel(
      id: id ?? this.id,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'password': password,
    };
  }

  factory PasswordModel.fromMap(Map<String, dynamic> map) {
    return PasswordModel(
      id: map['id'] as int,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PasswordModel.fromJson(String source) =>
      PasswordModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PasswordModel(id: $id, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PasswordModel &&
        other.id == id &&
        other.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ password.hashCode;
}
