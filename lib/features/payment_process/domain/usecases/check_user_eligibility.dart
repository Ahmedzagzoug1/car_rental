import '../repositories/user_repository.dart';

class CheckUserEligibility {
  final UserRepository userRepository;

  CheckUserEligibility(this.userRepository);

  Future<bool> call(String userId) async {
    final user = await userRepository.getUserStatus(userId);
    if (!user.otpVerified) return false;
    if (!user.licenseApproved) return false;
    if (user.approvalRequired) return false; // لو في approval مطلوب
    return true;
  }
}
