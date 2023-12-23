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
    required this.pin,
    required this.ktp,
    required this.profilePicture,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "pin": pin,
        "ktp": ktp,
        "profilePicture": profilePicture,
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
          profilePicture: profilePicture ?? this.profilePicture);
}
