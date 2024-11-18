import 'package:flutter/material.dart';
import 'package:onlinestoreweb/services/theme_service.dart';
import 'package:onlinestoreweb/theme.dart';
import 'package:onlinestoreweb/views/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(const MyApp());
  //Use Provider(ThemeService Class)
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //return const DefultCode();
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode:
            themeService.isLightModeOn ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.lightTheme,
      //theme: appTheme,
      darkTheme: AppTheme.darkTheme,
        home: const MainScreen(),
        // routes: <String, WidgetBuilder>{
        //   '/root': (BuildContext context) =>
        //       const RootBottomNavigationExample(),
        //   '/screenOne': (BuildContext context) => const ScreenOne(),
        //   '/screenTwo': (BuildContext context) => const ScreenTwo(),
        // },
      );
    });
  }

}