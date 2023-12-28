class SignInModels {
 
  final String? email;
  final String? password;

  const SignInModels({
    this.email,
    this.password,
  });

  Map<String,dynamic> toJson() => {
    "email" : email,
    "password" : password,
  };

}
