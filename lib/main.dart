import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
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
  @override
  Widget build(BuildContext context) {
    bool isXl = false;
    var _dimens = AppDimensions(context: context);
    return AdaptiveBuilder.builder(
      builder: (context, layout, child) {
        if (layout.breakpoint < LayoutBreakpoint.sm) {
          return Scaffold(
            appBar: AppBar(
              leading: Image.asset('assets/images/logo-acro.png'),
              backgroundColor: AppColors.white,
              title: const Text('Teams',
                  style: TextStyle(
                      color: AppColors.black, fontWeight: FontWeight.bold)),
            ),
            body: SafeArea(
              child: Container(color: AppColors.greyBg, child: Center(child: MobilePage(isXl: isXl))),
            ),
          );
        } else {
          isXl = true;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: const Text('Teams',
                  style: TextStyle(
                      color: AppColors.black, fontWeight: FontWeight.bold)),
            ),
            body: const TabXlPage(),
            // body: const PlayerScreenXl(),
          );
        }
      },
    );
  }
}
