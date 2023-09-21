import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get_navigation/src/root/get_material_app.dart";
import "package:recipe_app/firebase_options.dart";
import "package:recipe_app/view/presentation/size_manager/size_manager.dart";
import "package:recipe_app/view/theme/app_color.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: RecipeApp()));
}

class RecipeApp extends ConsumerWidget {
  const RecipeApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(width, height),
      builder: (context, child) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                sliderTheme: SliderThemeData(
                    trackHeight: 4,
                    activeTrackColor: green,
                    thumbColor: green,
                    overlayColor: const Color(0x015eb155),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 10),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 10))),
            home: const SizeManager());
      },
    );
  }
}
