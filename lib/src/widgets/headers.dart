import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615aab),
    );
  }
}

class HeaderCircularBorder extends StatelessWidget {
  const HeaderCircularBorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
        color: Color(0xff615aab),

      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}


class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); // es el lapiz
    //propiedades del lapiz
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill; // son los border y el fiil es para rellenar. strock para lineas
    paint.strokeWidth = 5.0; // espesor de la linea

    final path = Path();

    // dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35); // inicia a dibujar
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.5);

    // dibuja canvas
    canvas.drawPath(path, paint); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // siempre en true
    return true;
  }

}


class HeaderTriangle extends StatelessWidget {
  const HeaderTriangle ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderTrianglePainter(),
      ),
    );
  }
}


class _HeaderTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); // es el lapiz
    //propiedades del lapiz
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill; // son los border y el fiil es para rellenar. strock para lineas
    paint.strokeWidth = 10.0; // espesor de la linea

    final path = Path();

    // dibujar con el path y el lapiz
    // path.moveTo(0, 0); // inicia a dibujar en ese punto. delimita todo el dibujo
    path.lineTo(size.width, size.height); // linea vertica que baja desde la derecha hasta abajo al final
    path.lineTo(size.width, 0); // dibuja linea horizontal ocura todo el ancho arriba
    // path.lineTo(0, 0); // vuelve al punto inicial

    // dibuja canvas
    canvas.drawPath(path, paint); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // siempre en true
    return true;
  }

}

class HeaderPike extends StatelessWidget {
  const HeaderPike ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderPikePainter(),
      ),
    );
  }
}


class _HeaderPikePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); // es el lapiz
    //propiedades del lapiz
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill; // son los border y el fiil es para rellenar. strock para lineas
    paint.strokeWidth = 10.0; // espesor de la linea

    final path = Path();

    // dibujar con el path y el lapiz. empieza de izquierda a derecha como el reloj
    path.moveTo(size.width*0.5, size.height*0.40); // inicia a dibujar en ese punto. delimita todo el dibujo
    path.lineTo(0, size.height*0.3);  
    path.lineTo(0, 0);  
    path.lineTo(size.width, 0); // dibuja linea horizontal ocura todo el ancho arriba
    path.lineTo(size.width, size.height*0.3);  
    // path.lineTo(0, size.height*0.3);  
    // path.lineTo(0, 0); // vuelve al punto inicial

    // dibuja canvas
    canvas.drawPath(path, paint); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // siempre en true
    return true;
  }

}


class HeaderCurve extends StatelessWidget {
  const HeaderCurve ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderCurvePainter(),
      ),
    );
  }
}


class _HeaderCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); // es el lapiz
    //propiedades del lapiz
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill; // son los border y el fiil es para rellenar. strock para lineas
    paint.strokeWidth = 10.0; // espesor de la linea

    final path = Path();

    // dibujar con el path y el lapiz. empieza de izquierda a derecha como el reloj 
    path.lineTo(0, size.height*0.20);  
    // los primeroa dos puntos son el eje de curvatura y los otros dos puntos son el inicio y el fin
    // el segundo valor es relativo al ultimo valor, al estar por encima o por debajo del mismo me mueve la curva arriba o abajo
    path.quadraticBezierTo(size.width*0.5, size.height*0.40, size.width, size.height*0.20);
    path.lineTo(size.width, 0);

    // dibuja canvas
    canvas.drawPath(path, paint); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // siempre en true
    return true;
  }

}

class HeaderWave extends StatelessWidget {
  const HeaderWave ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}


class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); // es el lapiz
    //propiedades del lapiz
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill; // son los border y el fiil es para rellenar. strock para lineas
    paint.strokeWidth = 10.0; // espesor de la linea

    final path = Path();

    // dibujar con el path y el lapiz. empieza de izquierda a derecha como el reloj
    // path.moveTo(0, size.height);
    path.lineTo(0, size.height*0.20);  
    // los primeroa dos puntos son el eje de curvatura y los otros dos puntos son el inicio y el fin
    // el segundo valor es relativo al ultimo valor, al estar por encima o por debajo del mismo me mueve la curva arriba o abajo
    path.quadraticBezierTo(size.width*0.25, size.height*0.30, size.width*0.5, size.height*0.20);
    path.quadraticBezierTo(size.width*0.75, size.height*0.10, size.width, size.height*0.20);
    path.lineTo(size.width, 0);

    // dibuja canvas
    canvas.drawPath(path, paint); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // siempre en true
    return true;
  }

}

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}


class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: Offset(0.0, 55.0), 
      radius: 180
    );
    
    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff6d05e8),
        Color(0xffc012ff),
        Color(0xff6d05fa),
        Colors.red
      ],
      stops: [ // si se agrega un nuevo color se debe definir un stop
        0.2, 
        0.5,
        0.8,
        1.0
      ]
    );


    final paint = Paint()..shader = gradient.createShader(rect); // es el lapiz
    //propiedades del lapiz
    // paint.color = Color(0xff615aab);
    // paint.color = Colors.red;
    paint.style = PaintingStyle.fill; // son los border y el fiil es para rellenar. strock para lineas
    paint.strokeWidth = 10.0; // espesor de la linea

    final path = Path();

    // dibujar con el path y el lapiz. empieza de izquierda a derecha como el reloj
    // path.moveTo(0, size.height);
    path.lineTo(0, size.height*0.30);  
    // los primeroa dos puntos son el eje de curvatura y los otros dos puntos son el inicio y el fin
    // el segundo valor es relativo al ultimo valor, al estar por encima o por debajo del mismo me mueve la curva arriba o abajo
    path.quadraticBezierTo(size.width*0.25, size.height*0.40, size.width*0.5, size.height*0.30);
    path.quadraticBezierTo(size.width*0.75, size.height*0.20, size.width, size.height*0.30);
    path.lineTo(size.width, 0);

    // dibuja canvas
    canvas.drawPath(path, paint); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // siempre en true
    return true;
  }

}