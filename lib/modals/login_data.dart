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
