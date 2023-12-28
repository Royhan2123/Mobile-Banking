class UserModels {
  final int? id;
  final String? name;
  final String? email;
  final String? userName;
  final int? verified;
  final String? profilePicture;
  final String? cardNumber;
  final int? balance;
  final String? pin;
  final String? password;
  final String? token;

  const UserModels({
    this.email,
    this.id,
    this.name,
    this.userName,
    this.verified,
    this.profilePicture,
    this.balance,
    this.cardNumber,
    this.pin,
    this.token,
    this.password
  });

  // mengambil data dari json ke dalam project.
  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        name: json["name"],
        id: json["id"],
        email: json["email"],
        userName: json["userName"],
        verified: json["verified"],
        profilePicture: json["profilePicture"],
        pin: json["pin"],
        balance: json["balance"],
        cardNumber: json["cardNumber"],
        token: json["token"],
        password: json["password"],
      );

  UserModels copyWith({
    String? name,
    String? userName,
    String? email,
    String? pin,
    String? password,
    int? balance,
  }) =>
      UserModels(
        id: id,
        cardNumber: cardNumber,
        verified: verified,
        profilePicture: profilePicture,
        token: token,
        email: email ?? this.email,
        name: name ?? this.name,
        userName: userName ?? this.userName,
        pin: pin ?? this.pin,
        password: password ?? this.password,
        balance: balance ?? this.balance,
      );
}
