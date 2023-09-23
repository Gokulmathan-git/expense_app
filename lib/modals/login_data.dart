class LoginData {
  String? phoneNumber;
  String? id;

  LoginData({
    this.phoneNumber,
    this.id,
  });

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "id": id,
      };
}

class UserData {
  String? name;
  String? amount;

  UserData({
    this.name,
    this.amount,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
      };
}
