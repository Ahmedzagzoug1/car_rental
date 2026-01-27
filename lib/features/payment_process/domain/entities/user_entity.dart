class UserEntity {
  final bool otpVerified;
  final bool licenseApproved;
  final bool approvalRequired;

  UserEntity({
    required this.otpVerified,
    required this.licenseApproved,
    required this.approvalRequired,
  });
}