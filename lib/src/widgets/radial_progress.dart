import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget { 

  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  const RadialProgress({
    Key? key, 
    required this.porcentaje, 
    this.colorPrimario    = Colors.blue, // por defecto
    this.colorSecundario  = Colors.grey,
    this.grosorSecundario = 4,
    this.grosorPrimario   = 10,
  }) : super(key: key);


  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;

    controller = AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 200)
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    controller.forward( from:0.0 );

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje; 
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) { 
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              porcentaje: (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value), 
              colorPrimario: widget.colorPrimario,
              colorSecundario: widget.colorSecundario,
              grosorSecundario: widget.grosorSecundario,
              grosorPrimario: widget.grosorPrimario
            ),
          )
        );
      }, 
    );
  }
}

class _MiRadialProgress extends CustomPainter {

  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  _MiRadialProgress({
    required this.porcentaje,
    required this.colorPrimario,
    required this.colorSecundario,
    required this.grosorSecundario,
    required this.grosorPrimario
  });

  // Circulo completado
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(center: Offset(0, 0), radius: 180);
    final Gradient gradiente = new LinearGradient(
      colors: <Color>[
        Color(0xffc012ff),
        Color(0xff6085e8),
        colorPrimario
      ]

    );
    
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color       = colorSecundario
      ..style       = PaintingStyle.stroke;
    
    final Offset center = new Offset(size.width * 0.5, size.height * 0.5); 
    final double radio = min( size.width * 0.5, size.height * 0.5 );

    canvas.drawCircle(center, radio, paint);
    
    // Arco
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      // ..color       = colorPrimario
      ..shader      = gradiente.createShader(rect)
      ..strokeCap   = StrokeCap.round
      ..style       = PaintingStyle.stroke;

    double arcAngle = (2 * pi) * ( porcentaje / 100 ); // (2 * pi) es unna vuelta completa

    // dibujar el arco
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi/2, 
      arcAngle, 
      false, 
      paintArco
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;


}