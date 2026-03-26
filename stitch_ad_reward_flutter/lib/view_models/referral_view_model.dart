import 'package:flutter/material.dart';

class ReferralModel {
  final String name;
  final String tier;
  final String time;
  final String amount;
  final String imageUrl;

  ReferralModel({
    required this.name,
    required this.tier,
    required this.time,
    required this.amount,
    required this.imageUrl,
  });
}

class ReferralViewModel extends ChangeNotifier {
  String referralCode = "EMERALD-99X-PRO";
  String totalNetworkRevenue = "\$4,129.50";
  String growthPercentage = "+22.4%";
  
  Map<String, int> tierStats = {
    "Tier 1": 124,
    "Tier 2": 482,
    "Tier 3": 1200,
  };

  List<ReferralModel> recentReferrals = [
    ReferralModel(
      name: "Marcus.eth",
      tier: "Tier 1",
      time: "2m ago",
      amount: "+\$4.20",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuC9Gx7MGpewq4_p_AUV8kCZohFeftRt2qEhRVj3sdAnQsNtM0cJDJUOJfLBjxdNYIHkYLNN14iuAjOAhvfp6zQDgAuJPzOjbAWvbjb8yVPiyoFRXY--UWTZ83p4KKHy2VUuI4bwEtdtBwpochUDd8JJmZjxRD7Oi_d5_5Q6KqApmqmM0ieaH7eBGvBR-v4P3O96-jfYGK2CCTXWtee8kjLyR_p_Hu8bQfeoco89HHiDTGmxlgUlPgZrnqrcIc-NDcrcSH66nKMDYA",
    ),
    ReferralModel(
      name: "Satoshi_Fan",
      tier: "Tier 2",
      time: "14m ago",
      amount: "+\$1.12",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAbnOuOEKwGC2_FjfyfhZr7Yf_YTqIPBn1YitnaRWGFz_F5RoD5gZRbEimMAcJVpvfvx0Ww9aNRmPeEm-x0TjKKdSH5HI1skCyaBWa7h3tLQoCfoHcvDs1JQnwlugOABHGQ7oP6dOqMwb2MJVArqW5TzVSYb1F8dCBvdLi9R9n-yqeIlimDm_sdr53iNb3dcfDeeXZMhSGZODKoZQYTOMCHVs8ndpZkxP4GZQ-xhxBubBW_O0k036kOSQ3ExLeY1Vd34JM0cooHdQ",
    ),
    ReferralModel(
      name: "Elena.Nova",
      tier: "Tier 1",
      time: "1h ago",
      amount: "+\$12.50",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBloxHAyWWy2OlDELCuKjWhfV2_pFRgFSWJQLWXg2KirjDgBFPp9wHfQMtHxoUhoOfXyVKEflWuUS4TCMELSWbcleV-Wd7S_Urtlczwt0Qjn8o9aMncQv4kzptsLB1KedbM7EVgjc47KP6JWrFy-q6fQF00bFsC34sHCdkDXVoJlT3ipEzMVSdqvDxsdd5kfdDuxFmmCV7y4gVjOpI6T5xnRw89P0Z52UMtI3E6ufWzcyGikxloCVSdT_0KJHmwIbT5QJXzyQ7zTQ",
    ),
  ];

  void copyReferralCode() {
    // Logic to copy to clipboard
  }
}
