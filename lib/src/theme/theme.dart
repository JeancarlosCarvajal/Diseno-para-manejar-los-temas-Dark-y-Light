import 'package:flutter/material.dart';


class ThemeChanger with ChangeNotifier {

  bool _darkTheme   = false;
  bool _customTheme = false;
  late ThemeData _currentTheme;

  bool get darkTheme   => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  // final Color darkColor = Colors.pink;
  final Color darkColor = Colors.white;
  final Color lightColor = const Color(0xff48A0EB);


  ThemeChanger( int theme ) {

    switch( theme ) {

      case 1: // light colorScheme.secondary
        _darkTheme   = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
      break;

      case 2: // Dark
        _darkTheme   = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          // accentColor: darkColor, // se actulizo a colorScheme.secondary
          colorScheme:  _colorSchemeDark(),
        );
      break;

      case 3: // Dark
        _darkTheme   = false;
        _customTheme = true;
      break;

      default:
        _darkTheme = false;
        _darkTheme = false;
        _currentTheme = ThemeData.light();
    }
  }



  set darkTheme( bool value ) {
    _customTheme = false;
    _darkTheme = value;

    if ( value ) {
      _currentTheme = ThemeData.dark().copyWith(
        // accentColor: darkColor // cambio a colorScheme.secondary
        colorScheme: _colorSchemeDark(),
      );
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme( bool value ) {
    _customTheme = value;
    _darkTheme = false;

    if ( value ) {
      _currentTheme = ThemeData.dark().copyWith(
          // accentColor: lightColor, // es colorScheme.secondary   Provider.of<ThemeChanger>(context).currentTheme.colorScheme.colorScheme
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: const Color(0xff16202B),
          textTheme: const TextTheme(
            bodyLarge: TextStyle( color: Colors.white )
          ),
          // textTheme.body1.color
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xffbb86fc),
            onPrimary: Colors.black, 
            secondary: lightColor, // se modifico este
            onSecondary: Colors.black, 
            error: Color(0xffcf6679),
            onError: Colors.black, 
            background: Color(0xff121212),
            onBackground: Colors.white,
            surface: Color(0xff121212),
            onSurface: Colors.white, 
          ),
      );
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
 
  ColorScheme _colorSchemeDark() {
    return ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffbb86fc),
        onPrimary: Colors.black, 
        secondary: darkColor, // aqui modificado
        onSecondary: Colors.black, 
        error: Color(0xffcf6679),
        onError: Colors.black, 
        background: Color(0xff121212),
        onBackground: Colors.white,
        surface: Color(0xff121212),
        onSurface: Colors.white, 
      );
  }

}