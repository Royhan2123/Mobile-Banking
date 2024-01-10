class SignUpModels {
  final String? profilePicture;
  final String? email;
  final String? name;
  final String? password;
  final String? pin;
  final String? ktp;

  const SignUpModels({
    required this.email,
    required this.name,
    required this.password,
    this.pin,
    this.ktp,
    this.profilePicture,
  });

  // mengambil data dari project ke dalam json API.
  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "password": password,
        "pin": pin,
        "ktp": ktp,
        "profile_picture": profilePicture,
      };
  SignUpModels copyWith({
    String? pin,
    String? ktp,
    String? profilePicture,
  }) =>
      SignUpModels(
        email: email,
        name: name,
        password: password,
        pin: pin ?? this.pin,
        ktp: ktp ?? this.ktp,
        profilePicture: profilePicture ?? this.profilePicture,
      );
}
