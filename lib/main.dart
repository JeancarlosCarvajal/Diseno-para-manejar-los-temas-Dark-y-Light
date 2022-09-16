import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/launcher_page.dart';
import 'src/theme/theme.dart';


void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => new ThemeChanger( 2 ),
    child: MyApp()
  )
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: const LauncherPage()
    );
  }
}