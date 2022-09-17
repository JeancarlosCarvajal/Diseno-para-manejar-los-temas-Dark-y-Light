


import 'package:flutter/cupertino.dart';

import '../pages/slide_show_page.dart'; 

class LayoutResponsiveModel extends ChangeNotifier {

  late bool _isPhone = true;
  Widget _currentPage = SlideShowPage();
  
  set currentPage(Widget page) {
    this._currentPage = page;
    notifyListeners();
  } 

  set isPhone(bool itIs) {
    this._isPhone = itIs;
  } 

  Widget get currentPage => _currentPage; 
  bool get isPhone => _isPhone; 

}