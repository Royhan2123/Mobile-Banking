class UserEditFormModel {
  final String? username;
  final String? name;
  final String? email;
  final String? password;

  const UserEditFormModel({
    this.email,
    this.name,
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "username": username,
      "name": name,
      "password": password,
    };
  }
}
