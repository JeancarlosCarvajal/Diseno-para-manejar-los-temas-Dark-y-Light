import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';


class TwitterPage extends StatefulWidget {
  const TwitterPage({Key? key}) : super(key: key);


  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {

  bool activar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton( 
        child: FaIcon( FontAwesomeIcons.play ),
        onPressed: () {
          setState(() {
            print('jean: activar');
            activar = true;
          });
        }
      ),

      backgroundColor: Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          animate: activar, 
          from: 30,
          duration: Duration( seconds: 1 ),
          child: FaIcon( FontAwesomeIcons.twitter, color: Colors.white, size: 40 )
        ),
      ),

   );
  }
}