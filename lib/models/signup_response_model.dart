class SignUpResponse {
  final int status;
  final int profileId;
  final Map<String, dynamic> profileDetails;
  final int coupleId;
  final String message;

  SignUpResponse({
    required this.status,
    required this.profileId,
    required this.profileDetails,
    required this.coupleId,
    required this.message,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      status: json['status'],
      profileId: json['profile_id'],
      profileDetails: json['profile_details'],
      coupleId: json['couple_id'],
      message: json['message'],
    );
  }
}
