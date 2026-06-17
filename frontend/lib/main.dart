import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

import 'providers/auth_provider.dart';
import 'providers/training_provider.dart';
import 'providers/material_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/main_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TrainingProvider()),
        ChangeNotifierProvider(create: (_) => MaterialProvider()),
      ],
      child: MaterialApp(
        title: 'YuFit',
        theme: AppTheme.darkTheme,
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            if (authProvider.isAuthenticated) {
              return const MainScreen();
            }
            return const SplashScreen();
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
