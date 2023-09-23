class UserItem {
  String? phoneNumber;
  String? userId;
  String? token;

  UserItem({
    this.phoneNumber,
    this.userId,
    this.token,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
      phoneNumber: json['phoneNumber'],
      userId: json['userId'],
      token: json['token']);

  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'userId': userId,
        'token': token,
      };
}

class ApiResponse {
  String? msg;
  UserItem? data;

  ApiResponse({
    this.msg,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        msg: json["msg"],
        data: UserItem.fromJson(json["data"]),
      );
}
