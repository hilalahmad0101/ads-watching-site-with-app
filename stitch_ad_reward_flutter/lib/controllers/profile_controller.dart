import 'package:get/get.dart';

class ProfileController extends GetxController {
  final userName = "John Doe".obs;
  final userEmail = "john.doe@example.com".obs;
  final profileImageUrl = "https://lh3.googleusercontent.com/aida-public/AB6AXuC-B8JLPzAi8lAN7jQaIGlA2MUZrqeiWn5URhYd_vQMjaL7Pq6h2z7GkF2WZkeRApz94BTuvGhJlvOTYT9EJ1owa92sDGPFsRi0b4L_8LXmf1lCVOl9wKCRnARe11peivyKTZ5c5MnnVPumICw2gICvW6hZwQaHLuoZr6gFvAZXLJXngHIdqXVpUNhNP5kHJZy9quqPtaehTZMycPt-UThxddteEV_RtydAhZnA74xQa0wXDe-MZiMaTKR_zMTAcbw05QDpOMyrbA".obs;
  final membership = "Platinum Member".obs;
  final totalAssets = "\$12,450.00".obs;
  final referralCount = 24.obs;

  void logout() {
    Get.offAllNamed('/');
  }
}
