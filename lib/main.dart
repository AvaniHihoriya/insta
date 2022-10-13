import 'package:flutter/material.dart';
import 'package:insta/home_screeen.dart';
import 'package:provider/provider.dart';

import 'Widgets/dark_light_theme/dark_theme_provider.dart';
import 'consts/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
    await themeChangeProvider.darkThemePrefs.getTheme();
  }
  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _isDark = true;
    final ValueNotifier<ThemeMode> mode = ValueNotifier(ThemeMode.light);
    return  ValueListenableBuilder<ThemeMode>(
        valueListenable:mode,
        builder: (_,currentmode,__)
    {
      // return MaterialApp(
      //     debugShowCheckedModeBanner: false,
      //     // theme: ThemeData(
      //     //     primaryColor: Colors.red),
      //     themeMode: currentmode,
      //     theme: ThemeData(
      //       brightness: Brightness.light,
      //       backgroundColor: Colors.white,
      //     ),
      //     darkTheme:ThemeData(
      //       brightness: Brightness.dark,
      //     ),
      //     home: HomeScreen()
      // );
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_){
            return themeChangeProvider;
          })
        ],
        child: Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme:Styles.themeData(themeProvider.getDarkTheme,context),
            home: HomeScreen(),

          );
        }
        ),
      );

    });
  }
}

