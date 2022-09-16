import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BotonGordo extends StatelessWidget {

  final IconData iconButton;
  final String textButton; 
  final Color initialColorShadowButton;
  final Color finalColorShadowButton;
  final VoidCallback onPress;
   
  const BotonGordo({
    Key? key, 
    required this.iconButton, 
    required this.textButton, 
    this.initialColorShadowButton =const Color(0xff6989f5),
    this.finalColorShadowButton =const Color(0xff906ef5), 
    required this.onPress
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [ 
    
          _BotonGordoBackGround(
            iconButton: iconButton, 
            initialColorShadowButton: initialColorShadowButton, 
            finalColorShadowButton: finalColorShadowButton
          ),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140, width: 40),
              FaIcon(iconButton, color: Colors.white, size: 40),
              const SizedBox(width: 20),
              Expanded(child: Text( textButton, style: const TextStyle(color: Colors.white, fontSize: 18))),
              const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              const SizedBox(width: 40)
            ],
          ),
    
        ],
      ),
    );
  }
}

abstract class Provider {
  
}


class _BotonGordoBackGround extends StatelessWidget {
  final IconData iconButton;
  final Color initialColorShadowButton; 
  final Color finalColorShadowButton; 

  const _BotonGordoBackGround({
    Key? key, 
    required this.initialColorShadowButton, 
    required this.finalColorShadowButton, 
    required this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Colors.red,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), 
            offset: const Offset(4, 6), 
            blurRadius: 10
          )
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            initialColorShadowButton,
            finalColorShadowButton
          ]
        )
      ),
      child: ClipRRect( // para hacer border radius a todo el stack y no sobre salga el icono
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(iconButton, size: 150, color: Colors.white.withOpacity(0.2))
            )
          ],
        ),
      ),
    );
  }
}