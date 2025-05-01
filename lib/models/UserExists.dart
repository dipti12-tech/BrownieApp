
class UserExists {
  late final int status;
  late final String msg;

  UserExists({required this.status, required this.msg});

  factory UserExists.fromJson(Map<String, dynamic> json) {
    return UserExists(
      status: json['status'],
      msg: json['msg'],
    );
  }
}