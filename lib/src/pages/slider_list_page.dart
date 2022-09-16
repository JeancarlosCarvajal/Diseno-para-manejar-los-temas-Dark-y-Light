import 'package:flutter/material.dart';

class SliderListPage extends StatelessWidget {
   
  const SliderListPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _Titulo(),  
      // body: _ListaTareas(),
      // body: _MainScroll(),
      body: Stack(
        children: [
          _MainScroll(),
          const Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList()
          )
        ],
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      buttonColor: Colors.red, 
      minWidth: size.width*0.9, 
      child: Container(
        // color: Colors.red, 
        height: 75,
        width: size.width*0.9,
        child: ElevatedButton( 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => 
              states.contains(MaterialState.pressed)
                ? Color.fromARGB(255, 224, 18, 11)
                : Color.fromARGB(255, 221, 62, 56)
            ),
            shape:  MaterialStateProperty.resolveWith((_) => 
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(55))
              )
            ),
          ),
          onPressed: () {  },
          child: Text( 'Hello click Here' )
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final List<Widget> items = [
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66) ),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A) ),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF) ),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66) ),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A) ),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF) ),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66) ),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A) ),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF) ),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66) ),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A) ),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF) ),
  ];

  _MainScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView( // recibe slider
        physics: BouncingScrollPhysics(),
        slivers: [
    
          SliverAppBar(
            // leading: Icon( Icons.arrow_back, size: 30, color: Color.fromARGB(255, 0, 0, 0) ),
            // automaticallyImplyLeading: false,
            // leadingWidth: 00.0,// ancho del boton flecha de atras
            // toolbarTextStyle: TextStyle(color: Color.fromARGB(255, 61, 61, 61), fontWeight: FontWeight.bold),
            titleTextStyle:  const TextStyle(color: Color.fromARGB(255, 61, 61, 61), fontWeight: FontWeight.bold, fontSize: 20),
            toolbarHeight: 170,
            floating: true,
            forceElevated: true,
            elevation: 3,
            backgroundColor: Color(0xFFFCEBAF),
            // title: _Titulo(  ),
            centerTitle: true,
            title: Column(
              children: [
                const Icon( Icons.adb_rounded, size: 100, color: Color.fromARGB(255, 43, 186, 48) ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text( 'Hi I`m Android', 
                    // style: TextStyle( // si agregas aqui el estilo no funcionara el efecto de degradado al hacer el scroll
                    //   color: Color.fromARGB(255, 61, 61, 61), 
                    //   fontWeight: FontWeight.bold
                    // ), 
                  )
                ),
              ]
            ),
          
          ), 
    
          // SliverPersistentHeader(
          //   floating: true, // al bajar el menu aparece
          //   delegate: _SliverCustomHeaderDelegate(
          //     minHeight: 170,
          //     maxHeight: 200, 
          //     child: _Titulo(), 
          //   )        
          // ),
    
          SliverList(
            delegate: SliverChildListDelegate([
              ...items,
              SizedBox(height: 70,)
            ])
          ),
    
        ],
      ),
    );
  }
}


class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight, 
    required this.maxHeight, 
    required this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    //  : implement build
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  //  : implement maxExtent
  double get maxExtent => maxHeight;

  @override
  //  : implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

}



class _Titulo extends StatelessWidget {
    _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text( 'New', style: TextStyle(color: Color(0xff532128), fontSize: 50), ),
        ),

        Stack(

          children: [

            const SizedBox(width: 100),

            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: const Color(0xfff7cdd5),
              ),
            ),
            
            const Text('List', style: TextStyle(color: Color(0xffd93a30), fontSize: 50, fontWeight: FontWeight.bold)),
 
          ],

        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {

  final List<Widget> items = [
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66) ),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A) ),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF) ),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66) ),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A) ),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF) ),
  ];

  _ListaTareas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('jean: ${items.length}');
    
    return ListView.builder( 
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index]
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;
  const _ListItem({
    Key? key, 
    required this.titulo, 
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130, 
      margin: const EdgeInsets.all(10),
      // color: Colors.red,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30)
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      child: Text( titulo, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20) ),
    );
  }
}