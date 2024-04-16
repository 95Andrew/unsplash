class User {
  final String id;
  final DateTime updatedAt;
  final String username;
  final String name;

  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
      );
}
