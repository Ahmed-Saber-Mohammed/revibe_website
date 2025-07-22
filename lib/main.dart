import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/products_screen.dart';
import 'screens/process_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  usePathUrlStrategy();
  runApp(const ReVibeApp());
  
}

class ReVibeApp extends StatelessWidget {
  const ReVibeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReVibe - Turning Waste Into Wear',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        '/products': (context) => const ProductsScreen(),
        '/process': (context) => const ProcessScreen(),
        '/contact': (context) => const ContactScreen(),
      },
    );
  }
}