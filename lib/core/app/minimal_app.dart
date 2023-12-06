import 'package:flutter/material.dart';
import 'package:minimal_app/core/helpers/minimal_constants.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/customers/screens/customers_screen.dart';
import '../design/minimal_themes.dart';

class MinimalApp extends StatelessWidget {
  const MinimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MinimalThemes().defaultTheme,
      initialRoute: MinimalConstants.loginRoute,
      routes: {
        MinimalConstants.loginRoute: (context) => const LoginScreen(),
        MinimalConstants.customersRoute: (context) => const CustomersScreen()
      },
    );
  }
}
