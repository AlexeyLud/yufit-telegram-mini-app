class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String? username;
  final bool isPremium;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.username,
    required this.isPremium,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'] ?? '',
      username: json['username'],
      isPremium: json['is_premium'] ?? false,
    );
  }

  String get fullName => '$firstName $lastName'.trim();
}
