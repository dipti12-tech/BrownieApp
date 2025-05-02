class Partner {
  final int status;
  final String msg;
  final PartnerDetails partnerDetails;

  Partner({
    required this.status,
    required this.msg,
    required this.partnerDetails,
  });

  factory Partner.fromJson(Map<String, dynamic> json) {
    return Partner(
      status: json['status'],
      msg: json['msg'],
      partnerDetails: PartnerDetails.fromJson(json['partner_details']),
    );
  }
}

class PartnerDetails {
  final int profileId;
  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final String emailId;
  final String phone;
  final String city;
  final String country;
  final String nickName;
  final int partnerId;
  final String relationshipStatus;
  final List<dynamic> bpBenefits;
  final String shareUpdates;

  PartnerDetails({
    required this.profileId,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.emailId,
    required this.phone,
    required this.city,
    required this.country,
    required this.nickName,
    required this.partnerId,
    required this.relationshipStatus,
    required this.bpBenefits,
    required this.shareUpdates,
  });

  factory PartnerDetails.fromJson(Map<String, dynamic> json) {
    return PartnerDetails(
      profileId: json['profile_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      dob: json['dob'],
      emailId: json['email_id'],
      phone: json['phone'],
      city: json['city'],
      country: json['country'],
      nickName: json['nick_name'],
      partnerId: json['partner_id'],
      relationshipStatus: json['relationship_status'],
      bpBenefits: json['bp_benefits'],
      shareUpdates: json['share_updates'],
    );
  }
}
