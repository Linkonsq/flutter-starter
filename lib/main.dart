import 'package:flutter/material.dart';
import 'package:flutter_starter/core/theme/theme.dart';
import 'package:flutter_starter/features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Apply the custom dark theme
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}
