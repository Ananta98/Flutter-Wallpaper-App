import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wallpaper_app/bindings/home_binding.dart';
import 'package:wallpaper_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wallpaper App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[700]!),
        useMaterial3: true,
      ),
      defaultTransition: Transition.native,
      initialRoute: '/home',
      getPages: [
        GetPage(
            name: '/home',
            page: () => const HomeScreen(),
            binding: HomeBinding()),
      ],
    );
  }
}
