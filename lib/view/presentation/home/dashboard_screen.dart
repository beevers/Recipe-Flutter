import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:recipe_app/data/controllers/page_controller/page_view_controller.dart';
import 'package:recipe_app/data/provider/screen_provider.dart';
import 'package:recipe_app/view/theme/app_color.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    controller = PageController(initialPage: currentPageIndex, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenVm = ref.watch(screenProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: PageView.builder(
              itemCount: screenVm.length,
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return screenVm[index];
              })),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPageIndex,
          onTap: (index) {
            setState(() {
              if (index != 2) {
                currentPageIndex = index;
                controller.animateToPage(
                  currentPageIndex == 3 || currentPageIndex == 4
                      ? currentPageIndex - 1
                      : currentPageIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            });
          },
          unselectedItemColor: grey,
          selectedItemColor: green,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(IconlyBold.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyBold.edit),
              label: 'Upload',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 20,
                width: 20,
              ), // This is an empty item for spacing
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyBold.notification),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyBold.profile),
              label: 'Profile',
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        shape:
            ShapeBorder.lerp(const CircleBorder(), const StadiumBorder(), 1.0),
        onPressed: () {},
        child: Icon(
          IconlyBold.scan,
          color: white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
