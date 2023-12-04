// ignore_for_file: require_trailing_commas
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/data/dependency_Injection/injection_container.dart';
import 'package:recipe_app/firebase_options.dart';
import 'package:recipe_app/data/controllers/screen_controller.dart';
import 'package:recipe_app/view/theme/app_color.dart';

/// The main entry point for the Recipe App.
Future<void> main() async {
  // Ensure that Flutter is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with the default options.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Perform dependency injection.
  injectDependency();

  // Initialize Hive for local storage.
  await Hive.initFlutter();

  // Open a Hive box named 'app-local-storage'.
  await Hive.openBox('app-local-storage');

  // Run the app using ProviderScope.
  runApp(const ProviderScope(child: RecipeApp()));
}

/// The main widget for the Recipe App.
class RecipeApp extends ConsumerWidget {
  /// Constructs a new instance of RecipeApp.
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the device screen dimensions.
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    // Initialize ScreenUtil for screen adaptation.
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(phoneWidth, phoneHeight),
      builder: (context, child) {
        // Use GetMaterialApp for navigation and theming.
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            sliderTheme: SliderThemeData(
              trackHeight: 4,
              activeTrackColor: green,
              thumbColor: green,
              overlayColor: const Color(0x015eb155),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
            ),
          ),
          home: const SizeManager(),
        );
      },
    );
  }
}
