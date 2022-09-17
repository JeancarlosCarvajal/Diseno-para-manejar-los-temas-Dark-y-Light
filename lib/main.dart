import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';

import 'src/models/layout_resposive_model.dart';
import 'src/pages/launcher_page.dart';
import 'src/pages/launcher_tableta_page.dart';
import 'src/theme/theme.dart';


void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) => ThemeChanger(2)),
      ChangeNotifierProvider(create: (BuildContext context) => LayoutResponsiveModel()),
    ],
    child: MyApp(),
  ) 
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final layOutModel = Provider.of<LayoutResponsiveModel>(context);

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) { 
          print('jean: $orientation');
          final size = MediaQuery.of(context).size;

          if(size.width > 500) layOutModel.isPhone = false;
          
          return size.width > 500 
            ? LauncherTabletaPage()
            : LauncherPage();

        },
      ) 
    );
  }
}