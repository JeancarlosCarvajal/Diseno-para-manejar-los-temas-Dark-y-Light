import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

import '../pages/cuadrado_animado_page.dart';
import '../pages/emergency_page.dart';
import '../pages/graficas_circulares_page.dart';
import '../pages/headers_page.dart';
import '../pages/navegacion_page.dart';
import '../pages/pagina1_page.dart';
import '../pages/pinterest_page.dart';
import '../pages/slide_show_page.dart';
import '../pages/slider_list_page.dart';
import '../pages/twitter_page.dart';

 

final pageRoutes = <_Route>[

  _Route( FontAwesomeIcons.slideshare , 'Slideshow',  SlideShowPage() ),
  _Route( FontAwesomeIcons.userNurse , 'Emergencia',  EmergencyPage() ),
  _Route( FontAwesomeIcons.heading , 'Encabezados',  HeadersPage() ),
  _Route( FontAwesomeIcons.peopleCarryBox , 'Cuadro Animado', CuadradoAnimadoPage() ),
  _Route( FontAwesomeIcons.circleNotch , 'Barra Progreso', GraficasCircularesPage() ),
  _Route( FontAwesomeIcons.pinterest , 'Pinterest', PinterestPage() ),
  _Route( FontAwesomeIcons.mobile , 'Slivers', SliderListPage() ),  
  _Route( FontAwesomeIcons.pager , 'Notification Page', NavegacionPage() ),  
  _Route( FontAwesomeIcons.truckMoving , 'Animation Page', Pagina1Page() ),  
  _Route( FontAwesomeIcons.twitter , 'Twitter Page', TwitterPage() ),  

];





class _Route {

  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);

}