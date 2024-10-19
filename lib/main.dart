import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SettingsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  bool _areNotificationsEnabled = true;
  Locale _locale = Locale('en');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings Page',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      locale: _locale,
      home: SettingsPage( // Show the SettingsPage directly as the home
        isDarkMode: _isDarkMode,
        areNotificationsEnabled: _areNotificationsEnabled,
        onThemeChanged: (bool value) {
          setState(() {
            _isDarkMode = value;
          });
        },
        onLanguageChanged: (Locale locale) {
          setState(() {
            _locale = locale;
          });
        },
        onNotificationsChanged: (bool value) {
          setState(() {
            _areNotificationsEnabled = value;
          });
        },
        onLogout: () {
          SystemNavigator.pop();
        },
      ),
    );
  }
}
