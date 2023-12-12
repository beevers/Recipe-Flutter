import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/view/presentation/home/home_screen.dart';
import 'package:recipe_app/view/presentation/home/notification_screen.dart';
import 'package:recipe_app/view/presentation/home/profile_screen.dart';
import 'package:recipe_app/view/presentation/home/upload_screen.dart';

Provider<List<Widget>> _screens = Provider((ref) => [
      const HomeScreen(),
      const UploadScreen(),
      const NotificationScreen(),
      const ProfileScreen()
    ]);

Provider<List<Widget>> get screenProvider => _screens;

//Not to stay here
List<String> foodOption = [
  "All",
  "Mango",
  "Drinks",
  "Dessert",
  "Snacks",
  "Others"
];
List<String> drinkOption = [
  "All",
  "Merlot",
  "Malbec",
  "Corvina",
  "Bonarda",
  "Others"
];
