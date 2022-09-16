import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//modelos del pinterest button
class PinterestButton {
  final IconData icon;
  // VoidCallback  evita el error de:
  // The argument type 'Function' can't be assigned to the parameter type 'void Function()?'
  final VoidCallback  onPressed; //

  PinterestButton({
    required this.icon,
    required this.onPressed, 
  });
}

class PinterestMenu extends StatelessWidget {

  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: () { print('jean: Icono PieChart');}),
    PinterestButton(icon: Icons.search, onPressed: () { print('jean: Icono Search');}),
    PinterestButton(icon: Icons.notification_add, onPressed: () { print('jean: Icono Notification');}),
    PinterestButton(icon: Icons.supervisor_account, onPressed: () { print('jean: Icono Supervise');}),
  ];

  final bool canShow;
   
  PinterestMenu({
    Key? key, 
    this.canShow = true
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _MenuModelProvider(),
      child: AnimatedPositioned(
        bottom: canShow ? 0 : -65,
        duration: Duration(milliseconds: 250),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: canShow ? 1 : 0,
          child: _PinterestMenuBarBackground(
            child: _MenuItems(menuItems: items),
          ),
        ),
      ),
    );
  }
}

class _PinterestMenuBarBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBarBackground({
    Key? key, 
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      margin: EdgeInsets.only(bottom: 5),
      // color: Colors.red,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            // offset: Offset(10, 10),
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List <PinterestButton> menuItems;
  
  const _MenuItems({
    Key? key, 
    required this.menuItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index: index, item: menuItems[index])) // opcion 1
      // children: menuItems.asMap().entries.map((widget) => _PinterestMenuButton(index: widget.key, item: widget.value,)).toList(), // opcion 2
      
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;

  final PinterestButton item;

  const _PinterestMenuButton({
    Key? key, 
    required this.index, 
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuModelProvider = Provider.of<_MenuModelProvider>(context);
    final itemSelected = menuModelProvider.itemSeleccionado;

    return GestureDetector(
      onTap: (){
        menuModelProvider.itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: itemSelected == index ? 30 : 25,
          color: itemSelected == index ? Colors.red[400] : Colors.blueGrey
        ),
      ),
    );
  }
}


class _MenuModelProvider with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int index){
    this._itemSeleccionado = index;
    notifyListeners();
  }

}