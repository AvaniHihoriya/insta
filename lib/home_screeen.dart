import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'Widgets/appbar.dart';
import 'Widgets/dark_light_theme/dark_theme_provider.dart';
import 'Widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    // final themeState = Provider.of<DarkThemeProvider>(context);
    // final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    final ValueNotifier<ThemeMode> mode = ValueNotifier(ThemeMode.light);

    return Scaffold(
      appBar:Customappbar(
        titile: 'Instagram',
        backgroundcolor: Colors.white,

      ),
          body:Column(
            children: [
              // SizedBox(height: 50,),
              //
              // Text('data'),
              // InkWell(onTap: (){
              //   mode.value = mode.value== ThemeMode.light? ThemeMode.dark :  ThemeMode.light;
              // },
              //     child: Image(image: AssetImage('assets/images/message.png'),height: 50,width: 50,),
              //
              // )
              SwitchListTile(
                title: TextWidget(
                  text: themeState.getDarkTheme? 'Dark Mode' : 'Light Mode',
                  color: color,
                  textSize: 16,
                  // isTitle: true,
                ),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined),
                onChanged: (bool value){
                  themeState.setDarkTheme = value;
                },
                value: themeState.getDarkTheme,
              ),
            ],
          )
    // Center(
          //   child:   SwitchListTile(
          //     title: TextWidget(
          //       text: themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
          //       color: color,
          //       textSize: 18,
          //      //  isTitle: true,
          //     ),
          //     secondary: Icon(themeState.getDarkTheme
          //         ? Icons.dark_mode_outlined
          //         : Icons.light_mode_outlined),
          //     onChanged: (bool value) {
          //       setState(() {
          //         themeState.setDarkTheme = value;
          //       });
          //     },
          //     value: themeState.getDarkTheme,
          //   ),
          // ),
    );
  }
}
