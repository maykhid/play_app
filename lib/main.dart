import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:play_app/ui/main/mobile-m/screens/mobile_player_screen.dart';
import 'package:play_app/ui/main/tab-xl/screens/tab_player_screen.dart';

import 'app/app_constants/color_const.dart';
import 'app/app_dimens.dart';
import 'app/service_locator.dart';
import 'ui/main/mobile-m/screens/mobile_home_page.dart';
import 'ui/main/tab-xl/screens/tab_home_page.dart';

Future<void> main() async {
  await setupLocator();
  runApp(const PlayApp());
}

class PlayApp extends StatelessWidget {
  const PlayApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Layout(
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Widget> _pageMobileOptions(bool isXl) => <Widget>[
        MobilePage(isXl: isXl),
        const MobilePlayerPage(),
      ];

  @override
  Widget build(BuildContext context) {
    bool isXl = false;

    return AdaptiveBuilder.builder(
      builder: (context, layout, child) {
        if (layout.breakpoint < LayoutBreakpoint.sm) {
          return Scaffold(
            appBar: _selectedIndex == 0
                ? AppBar(
                  elevation: 0.0,
                    leading: Image.asset('assets/images/logo-acro.png'),
                    backgroundColor: AppColors.white,
                    title: const Text(
                      'Teams',
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : AppBar(
                    // leading: const SizedBox(
                    //   width: 100,
                    //   child: Text(
                    //     'Select player',
                    //     style: TextStyle(
                    //       color: AppColors.black,
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    elevation: 0.0,
                    title: const Text(
                      'Select player',
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: AppColors.white,
                    actions: [
                      Image.asset('assets/icons/search-icon.png'),
                      Image.asset('assets/icons/star-icon.png'),
                      Image.asset('assets/icons/filter.png'),
                      Image.asset('assets/icons/info-icon.png'),
                    ],
                  ),
            body: SafeArea(
              child: Container(
                color: AppColors.greyBg,
                child: Center(
                  child: _pageMobileOptions(isXl).elementAt(_selectedIndex),
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (value) {
                setState(() => _selectedIndex = value);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/logo-acro.png'),
                    label: 'Teams'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/logo-acro.png'),
                    label: 'Players'),
              ],
            ),
          );
        } else {
          isXl = true;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: const Text(
                'Teams',
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
            ),
            body: const TabXlPage(),
            // body: const PlayerScreenXl(),
          );
        }
      },
    );
  }
}
