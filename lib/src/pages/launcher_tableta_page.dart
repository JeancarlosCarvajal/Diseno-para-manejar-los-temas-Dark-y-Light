import 'package:flutter/material.dart'; 

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/layout_resposive_model.dart';
import '../routes/routes.dart';
import '../theme/theme.dart';
import 'slide_show_page.dart';
 
class LauncherTabletaPage extends StatelessWidget {
  const LauncherTabletaPage({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutResponsiveModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Diseños en Flutter Tableta'),
      ),
      drawer: _MenuPrincipal(),
      body: Row(
        children: [

          SizedBox(
            width: 300,
            height: double.infinity,
            child: _ListaOpciones(),
          ),

          Container(
            height: double.infinity, 
            width: 4.0, 
            color: theme.currentTheme.dividerColor,
          ),

          Expanded(
            child:  layoutModel.currentPage,
          )

        ],
      ),



      // body: _ListaOpciones(),
   );
  }

}

class _ListaOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final layoutModel = Provider.of<LayoutResponsiveModel>(context);


    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: ( context, i) => Divider(
        color: appTheme.primaryColorLight,
      ), 
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile( 
        leading: FaIcon( pageRoutes[i].icon , color: appTheme.colorScheme.secondary ),
        title: Text( pageRoutes[i].titulo ),
        trailing: Icon( Icons.chevron_right, color: appTheme.colorScheme.secondary ),
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> pageRoutes[i].page ));  // lo calle por hacerlo responsive 
          layoutModel.currentPage = pageRoutes[i].page;
        },

      ), 
    );
  }
}

class _MenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Drawer(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: const Text('JC', style: TextStyle( fontSize: 50),),
              ),
            ),
          ),


          Expanded(
            child: _ListaOpciones()
          ),


          Container(
            color: Provider.of<ThemeChanger>(context).currentTheme.colorScheme.background,
            child: Column( 
              children: [
                ListTile(
                  leading: Icon( Icons.lightbulb_outline, color: accentColor ),
                  title: const Text('Dark Mode'),
                  trailing: Switch.adaptive(
                    value: appTheme.darkTheme ,
                    activeColor: accentColor,
                    onChanged: ( value ) => appTheme.darkTheme = value
                  ),
                ),
                SafeArea(
                  bottom: true,
                  top: false,
                  left: false,
                  right: false,
                  child: ListTile(
                    leading: Icon( Icons.add_to_home_screen, color: accentColor ),
                    title: const Text('Custom Theme'),
                    trailing: Switch.adaptive(
                      value: appTheme.customTheme, 
                      activeColor: accentColor,
                      onChanged: ( value ) => appTheme.customTheme = value
                    ),
                  ),
                ),
              ],
            ),
          )

          

        ],
      ),
    );
  }
}