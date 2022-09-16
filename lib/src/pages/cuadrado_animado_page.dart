import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
   
  const CuadradoAnimadoPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _CuadradoAnimado()
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;


  @override
  void initState() {

    controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 4000)
    );

    moverDerecha = Tween(begin: 0.0, end: 100.0).animate( 
      CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.25, curve: Curves.easeInOutCirc))

    );
    moverArriba = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.25, 0.50, curve: Curves.easeInOutCirc))
    );    
    moverIzquierda = Tween(begin: 0.0, end: -100.0).animate( 
      CurvedAnimation(parent: controller, curve: const Interval(0.50, 0.75, curve: Curves.easeInOutCirc))

    );    
    moverAbajo = Tween(begin: 0.0, end: 100.0).animate( 
      CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.00, curve: Curves.easeInOutCirc)) 
    );

    controller.addListener(() {
      if(controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
        animation: controller,
        child: const _Rectangulo(),
        builder: (BuildContext context, Widget? child) { 
          print('jean: moverDerecha: ${moverDerecha.value}');

          return Transform.translate(
            offset: Offset(moverDerecha.value + moverIzquierda.value, moverArriba.value + moverAbajo.value),
            child: const _Rectangulo()
          );

        },
      );
  }
}


class _Rectangulo extends StatelessWidget {
    const _Rectangulo({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {  
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}