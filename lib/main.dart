import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:recipe_app/view/presentation/size_manager/size_manager.dart";

void main() {
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
        return MaterialApp(
            theme: ThemeData(useMaterial3: true), home: const SizeManager());
      },
    );
  }
}
