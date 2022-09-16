import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/boton_gordo.dart';
import '../widgets/header.dart';
 


class ItemButton {
  // VoidCallback  evita el error de:
  // The argument type 'Function' can't be assigned to the parameter type 'void Function()?'
  final IconData iconButton;
  final String textButton;
  final Color initialColorShadowButton;
  final Color finalColorShadowButton;
  // final VoidCallback  onPressed;

  ItemButton({  
    required this.iconButton, 
    required this.textButton, 
    required this.initialColorShadowButton, 
    required this.finalColorShadowButton,
    // required this.onPressed, 
  });
  
}

class EmergencyPage extends StatelessWidget {


   
  EmergencyPage({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    final List<ItemButton> buttons = [
      ItemButton( iconButton: FontAwesomeIcons.carCrash, textButton: 'Motor Accident', initialColorShadowButton: Color(0xff6989F5), finalColorShadowButton: Color(0xff906EF5) ),
      ItemButton( iconButton: FontAwesomeIcons.plus, textButton: 'Medical Emergency', initialColorShadowButton: Color(0xff66A9F2), finalColorShadowButton: Color(0xff536CF6) ),
      ItemButton( iconButton: FontAwesomeIcons.theaterMasks, textButton: 'Theft / Harrasement', initialColorShadowButton: Color(0xffF2D572), finalColorShadowButton: Color(0xffE06AA3) ),
      ItemButton( iconButton: FontAwesomeIcons.biking, textButton: 'Awards', initialColorShadowButton: Color(0xff317183), finalColorShadowButton: Color(0xff46997D) ),
      ItemButton( iconButton: FontAwesomeIcons.carCrash, textButton: 'Motor Accident', initialColorShadowButton: Color(0xff6989F5), finalColorShadowButton: Color(0xff906EF5) ),
      ItemButton( iconButton: FontAwesomeIcons.plus, textButton: 'Medical Emergency', initialColorShadowButton: Color(0xff66A9F2), finalColorShadowButton: Color(0xff536CF6) ),
      ItemButton( iconButton: FontAwesomeIcons.theaterMasks, textButton: 'Theft / Harrasement', initialColorShadowButton: Color(0xffF2D572), finalColorShadowButton: Color(0xffE06AA3) ),
      ItemButton( iconButton: FontAwesomeIcons.biking, textButton: 'Awards', initialColorShadowButton: Color(0xff317183), finalColorShadowButton: Color(0xff46997D) ),
      ItemButton( iconButton: FontAwesomeIcons.carCrash, textButton: 'Motor Accident', initialColorShadowButton: Color(0xff6989F5), finalColorShadowButton: Color(0xff906EF5) ),
      ItemButton( iconButton: FontAwesomeIcons.plus, textButton: 'Medical Emergency', initialColorShadowButton: Color(0xff66A9F2), finalColorShadowButton: Color(0xff536CF6) ),
      ItemButton( iconButton: FontAwesomeIcons.theaterMasks, textButton: 'Theft / Harrasement', initialColorShadowButton: Color(0xffF2D572), finalColorShadowButton: Color(0xffE06AA3) ),
      ItemButton( iconButton: FontAwesomeIcons.biking, textButton: 'Awards', initialColorShadowButton: Color(0xff317183), finalColorShadowButton: Color(0xff46997D) ),
    ];

    List<Widget> buttonWidgets = buttons.map(((dataButton) => 
      FadeInLeft(
        duration: const Duration(milliseconds: 500),
        child: BotonGordo(
          iconButton: dataButton.iconButton, 
          textButton: dataButton.textButton, 
          initialColorShadowButton: dataButton.initialColorShadowButton, 
          finalColorShadowButton: dataButton.finalColorShadowButton, 
          onPress: () { print('jean: Click en Boton gordo');},
        ),
      ) 
    )).toList();

    return Scaffold(
      // backgroundColor: Colors.red,
      body: Stack(
        children: [
  
          ListView(
            // padding: EdgeInsets.only(top: size.height*0.40), // tambien se podia colocar aqui la separacion para ver el header
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: size.height*0.37),
              ...buttonWidgets // ... se llama operador express muy util
            ]
          ),

          // lo coloco abajo para que cubra a los ListView
          PageHeader(),


        ],
      ),
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: BotonGordo(
        iconButton: FontAwesomeIcons.carBurst, 
        textButton: 'Motor accidentee', 
        initialColorShadowButton: const Color(0xff6989f5), 
        finalColorShadowButton: const Color(0xff906ef5), 
        onPress: () { print('jean: Click en Boton gordo');},
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ 
        const IconHeader(
          iconHeader: FontAwesomeIcons.plus,
          tituloHeader: 'Haz Solicitado',
          subtituloHeader: 'Asistencia Médica', 
          initialColorShadowHeader: Color(0xff526bf6),
          finalColorShadowHeader: Color(0xff67acf2),
        ),

        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: (){ print('jean: Click en tres puntos');},
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            child: const FaIcon(FontAwesomeIcons.ellipsisVertical, color: Colors.white)
          )
        )
      ],
    );
  }
}