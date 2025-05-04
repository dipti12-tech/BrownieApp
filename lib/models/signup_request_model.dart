class SignUpRequest {
  String firstName;
  String lastName;
  String dob;
  String gender;
  String email;
  String phone;
  String city;
  String country;
  String nickName;
  String password;
  String relationshipStatus;
  String shareUpdates;
  List<String> bpBenefits;
  String partnerEmailId;
  String partnerFirstName;
  String partnerLastName;


  SignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.email,
    required this.phone,
    required this.city,
    required this.country,
    required this.nickName,
    required this.password,
    required this.relationshipStatus,
    required this.shareUpdates,
    required this.bpBenefits,
    required this.partnerEmailId,
    required this.partnerFirstName,
    required this.partnerLastName,
  });

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "dob": dob,
    "gender": gender,
    "email_id": email,
    "phone": phone,
    "city": city,
    "country": country,
    "nick_name": nickName,
    "password": password,
    "relationship_status": relationshipStatus,
    "share_updates": shareUpdates,
    "bp_benefits": bpBenefits,
    "partner_email_id": partnerEmailId,
    "partner_first_name": partnerFirstName,
    "partner_last_name": partnerLastName,
  };
}
