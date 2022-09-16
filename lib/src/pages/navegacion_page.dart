import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import '../theme/theme.dart';
 


class NavegacionPage extends StatelessWidget {
  const NavegacionPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),

      child: Scaffold(

        appBar: AppBar(
          centerTitle: true, 
          title: const Text('Notifications Page'),
        ),

        // appBar: MyAppBar(), // otra forma de incluir el appbar

        floatingActionButton: const BotonFlotante(),
         
        bottomNavigationBar: const BottomNavigation(),
 
      ),

    );
  }
} 


class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Provider.of<ThemeChanger>(context).currentTheme.colorScheme.secondary,
      items: [

        const BottomNavigationBarItem(
          label: 'Fish',
          icon: FaIcon( FontAwesomeIcons.fish )
        ),

        
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: <Widget>[

              const FaIcon( FontAwesomeIcons.bell ),

              Positioned(
                top: 0.0,
                right: 0.0,
                // child: Icon( Icons.brightness_1, size: 8, color: Colors.redAccent, ) // otra forma de hacer una notificacion
                child: BounceInDown(
                  from: 10,
                  animate: ( numero > 0 ) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller, 
                    child: Container(
                      alignment: Alignment.center,
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                      child: Text( '$numero', style: const TextStyle(color: Colors.white, fontSize: 7 ), ),
                    ),
                  ),
                ),
              )
            
            ],
          )
        ),

        const BottomNavigationBarItem(
          label: 'My Octopus',
          icon: FaIcon( FontAwesomeIcons.octopusDeploy )
        ),


      ],
    );
  }
}



class BotonFlotante extends StatelessWidget {
  const BotonFlotante({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon( FontAwesomeIcons.play ),
      backgroundColor: Provider.of<ThemeChanger>(context).currentTheme.colorScheme.secondary,
      onPressed: (){
        print('jean: CLick en Play');
        
        final notiModel = Provider.of<_NotificationModel>(context, listen: false);

        int numero = notiModel.numero;
        numero++;

        notiModel.numero = numero;

        if ( numero >= 2 ) {
          final controller = notiModel.bounceController;
          // resetea el controllador la animacion en el punto inicial
          controller.forward( from: 0.0 );
        }

      }
    );
  }
}



class _NotificationModel extends ChangeNotifier {

  late int _numero = 0;
  late AnimationController _bounceController;

  int get numero => this._numero;

  set numero( int valor ) {
    this._numero = valor;
    notifyListeners();
  }


  AnimationController get bounceController => this._bounceController;
  set bounceController( AnimationController controller ) {
    this._bounceController = controller;
  }

}