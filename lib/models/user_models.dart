class UserModels {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final int? verified;
  final String? profilePicture;
  final int? balance;
  final String? cardNumber;
  final int? pin;
  final String? password;
  final String? token;

  UserModels({
    this.id,
    this.name,
    this.email,
    this.username,
    this.verified,
    this.profilePicture,
    this.password,
    this.balance,
    this.cardNumber,
    this.pin,
    this.token,
  });

  // mengambil data dari json
  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        verified: json["verified"],
        profilePicture: json["profile_picture"],
        balance: json["balance"],
        cardNumber: json["card_number"],
        pin: json["pin"],
        token: json["token"],
      );

  UserModels copwith({
    String? username,
    String? name,
    String? email,
    String? pin,
    String? password,
    int? balance,
  }) =>
      UserModels(
        id: id,
        username: username ?? this.username,
        email: email ?? this.email,
        name: name ?? this.name,
        password: password ?? this.password ,
        balance: balance ?? this.balance ,
        verified: verified,
        profilePicture: profilePicture,
        cardNumber: cardNumber,
        token: token,
      );
}
