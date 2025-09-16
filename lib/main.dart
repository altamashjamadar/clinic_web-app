import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/homepage.dart';
import 'screens/appointment_page.dart';
import 'screens/admin_dashboard.dart';
import 'screens/sign_in_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/signin',
      getPages: [
        GetPage(name: '/signin', page: () => const SignInPage()),
        GetPage(name: '/home', page: () => const Homepage()),
        GetPage(name: '/appointment', page: () => const AppointmentPage()),
        GetPage(name: '/admin', page: () => const AdminDashboard()),
      ],
    );
  }
}