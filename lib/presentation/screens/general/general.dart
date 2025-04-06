import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/presentation/screens/general/controller_service.dart';
import 'package:fitlifts/presentation/screens/general/gallery/gallery_imports.dart';
import 'package:fitlifts/presentation/screens/general/history/history_imports.dart';
import 'package:fitlifts/presentation/screens/general/home/home_imports.dart';
import 'package:fitlifts/presentation/screens/general/settings/settings_imports.dart';
import 'package:fitlifts/presentation/screens/general/workouts/workouts_imports.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

@RoutePage()
class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  int selectedIndex = 0;
  List<Widget> allScreens() {
    return [
      HomeScreen(),
      WorkoutsScreen(),
      GalleryScreen(),
      HistoryScreen(),
      SettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColorPrimary: MyColors.fieryRed,
        inactiveColorPrimary: MyColors.greyText,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.fitness_center),
        title: "Track",
        inactiveColorPrimary: MyColors.greyText,
        activeColorPrimary: MyColors.electricBlue,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.camera_alt),
        title: "Progress",
        inactiveColorPrimary: MyColors.greyText,
        activeColorPrimary: const Color.fromARGB(255, 165, 124, 237),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bar_chart),
        title: "History",
        inactiveColorPrimary: MyColors.greyText,

        activeColorPrimary: MyColors.vibrantGreen,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: "Settings",
        inactiveColorPrimary: MyColors.greyText,
        activeColorPrimary: const Color.fromARGB(255, 63, 159, 159),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      padding: EdgeInsets.zero,
      backgroundColor: MyColors.darkGrey,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
          true, 
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      confineToSafeArea: true,
      context,
      controller: TabControllerService.persistentTabController,
      screens: allScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style13,
    );
  }
}
