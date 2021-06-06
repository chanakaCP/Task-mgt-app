class AuthUser {
  final String userName;
  final String password;

  AuthUser(this.userName, this.password);

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
      };
}

class AuthEmail {
  final String userName;

  AuthEmail(this.userName);

  Map<String, dynamic> toJson() => {
        "userName": userName,
      };
}
