import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  String userName = "John Doe";
  String userEmail = "john.doe@example.com";
  String profileImageUrl = "https://lh3.googleusercontent.com/aida-public/AB6AXuC-B8JLPzAi8lAN7jQaIGlA2MUZrqeiWn5URhYd_vQMjaL7Pq6h2z7GkF2WZkeRApz94BTuvGhJlvOTYT9EJ1owa92sDGPFsRi0b4L_8LXmf1lCVOl9wKCRnARe11peivyKTZ5c5MnnVPumICw2gICvW6hZwQaHLuoZr6gFvAZXLJXngHIdqXVpUNhNP5kHJZy9quqPtaehTZMycPt-UThxddteEV_RtydAhZnA74xQa0wXDe-MZiMaTKR_zMTAcbw05QDpOMyrbA";
  String membership = "Platinum Member";
  String totalAssets = "\$12,450.00";
  int referralCount = 24;

  void logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}
