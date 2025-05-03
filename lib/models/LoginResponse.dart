
class LoginResponse {
  final int status;
  final String msg;
  final UserDetails details;

  LoginResponse({
    required this.status,
    required this.msg,
    required this.details,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      msg: json['msg'],
      details: UserDetails.fromJson(json['details']),
    );
  }
}

class UserDetails {
  final String profileId;
  final String userName;
  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final String emailId;
  final String phone;
  final String address;
  final String country;
  final String nickName;
  final int partnerId;
  final String relationshipStatus;
  final int coupleId;

  UserDetails({
    required this.profileId,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.emailId,
    required this.phone,
    required this.address,
    required this.country,
    required this.nickName,
    required this.partnerId,
    required this.relationshipStatus,
    required this.coupleId,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      profileId: json['profile_id'],
      userName: json['user_name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      dob: json['dob'],
      emailId: json['email_id'],
      phone: json['phone'],
      address: json['address'],
      country: json['country'],
      nickName: json['nick_name'],
      partnerId: json['partner_id'],
      relationshipStatus: json['relationship_status'],
      coupleId: json['couple_id'],
    );
  }
}
