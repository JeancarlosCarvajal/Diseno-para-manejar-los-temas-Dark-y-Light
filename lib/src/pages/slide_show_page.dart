import 'package:flutter/material.dart';
 
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/slide_show.dart';

class SlideShowPage extends StatelessWidget {
   
  SlideShowPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool isLarge;
    final size = MediaQuery.of(context).size;
    isLarge = size.width > 1000 ? true : false;

    List<Widget> widgets = [
      Expanded(child: _MiSlideShow()),
      Expanded(child: _MiSlideShow()), 
    ];

    return Scaffold(
      backgroundColor: Colors.purple,
      body: isLarge
        ? Row(children: widgets) 
        : Column(children: widgets), 
    );
  }
}

class _MiSlideShow extends StatelessWidget {
  const _MiSlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return SizedBox( 
      child: SlideShow(
        bulletPrimario: 15,
        bulletSecundario: 12,
        // puntosArriba: true,
        colorPrimario: Color.fromARGB(255, 0, 153, 255),
        // colorSecundario: Colors.white,
        slides: [
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'), 
          SvgPicture.asset('assets/svgs/slide-4.svg'), 
          SvgPicture.asset('assets/svgs/slide-5.svg'), 
        ]
      ),
    );
  }
}