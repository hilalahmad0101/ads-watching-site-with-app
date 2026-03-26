import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'res/app_theme.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';
import 'views/main_layout.dart';
import 'views/referral_view.dart';
import 'views/forget_password_view.dart';
import 'views/otp_verification_view.dart';
import 'views/reset_password_view.dart';
import 'views/wallet_withdraw_view.dart';
import 'views/transaction_history_view.dart';
import 'views/personal_information_view.dart';
import 'views/add_payout_account_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AdReward Pro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark, // Default to dark as per HTML design
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const LoginView()),
        GetPage(name: '/register', page: () => const RegisterView()),
        GetPage(name: '/forget-password', page: () => const ForgetPasswordView()),
        GetPage(name: '/otp-verification', page: () => const OtpVerificationView()),
        GetPage(name: '/reset-password', page: () => const ResetPasswordView()),
        GetPage(name: '/home', page: () => const MainLayout()),
        GetPage(name: '/referrals', page: () => const ReferralView()),
        GetPage(name: '/wallet-withdraw', page: () => const WalletWithdrawView()),
        GetPage(name: '/transaction-history', page: () => const TransactionHistoryView()),
        GetPage(name: '/personal-information', page: () => const PersonalInformationView()),
        GetPage(name: '/add-payout-account', page: () => const AddPayoutAccountView()),
      ],
    );
  }
}
