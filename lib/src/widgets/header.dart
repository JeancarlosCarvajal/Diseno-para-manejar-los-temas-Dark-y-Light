

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  
  final IconData iconHeader;
  final String tituloHeader;
  final String subtituloHeader;
  final Color initialColorShadowHeader;
  final Color finalColorShadowHeader;

  const IconHeader({
    Key? key, 
    required this.iconHeader,
    required this.tituloHeader, 
    required this.subtituloHeader, 
    this.initialColorShadowHeader = const Color(0xff526bf6), 
    this.finalColorShadowHeader = const Color(0xff67acf2)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( 
      child: Stack(
        children: [

          _IconHeaderBackgroud(finalColorShadowHeader: initialColorShadowHeader, initialColorShadowHeader: finalColorShadowHeader),

          Positioned(
            top: -65,
            left: -75,
            child: FaIcon(iconHeader, size: 250, color: Colors.white.withOpacity(0.2)) 
          ),

          Column(
            children: [
              const SizedBox(height: 70, width: double.infinity),
              Text( tituloHeader, style: const TextStyle(fontSize: 20, color: Colors.white)),
              const SizedBox(height: 20),
              Text( subtituloHeader, style: const TextStyle(fontSize: 25, color: Colors.white)),
              const SizedBox(height: 20),
              FaIcon(iconHeader, size: 80, color: Colors.white) 

            ],
          ),

        ]
      ),
    );
  }
}

class _IconHeaderBackgroud extends StatelessWidget {
  final Color initialColorShadowHeader;
  final Color finalColorShadowHeader;
  const _IconHeaderBackgroud({
    Key? key, 
    required this.initialColorShadowHeader, 
    required this.finalColorShadowHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            initialColorShadowHeader,
            finalColorShadowHeader
          ]
        )
      ),
    );
  }
}