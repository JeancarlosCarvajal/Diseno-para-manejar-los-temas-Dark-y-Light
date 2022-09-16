 
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
   
  PinterestPage({Key? key}) : super(key: key);

  final List<int> items = List.generate(200, (index) => index);

  @override
  Widget build(BuildContext context) {
    print('jean: estoy en el Build');

    return ChangeNotifierProvider(
      create: (BuildContext context) => _MenuModelProvider(),
      child: Scaffold(
        // body: PinterestGrid(items: items),
        // body: PinterestMenu(),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            PinterestGrid(items: items),
            PinterestMenuExternal()
          ],
        ),
      ),
    );
  }
}

class PinterestMenuExternal extends StatelessWidget {
  const PinterestMenuExternal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuModelProvider = Provider.of<_MenuModelProvider>(context);
    return PinterestMenu(canShow: menuModelProvider.canShow);
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<int> items;

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> with SingleTickerProviderStateMixin {

  ScrollController scrollController = new ScrollController();
  double scrollControllerAntes = 0;

  @override
  void initState() {
    scrollController.addListener(() {
    final menuModelProvider = Provider.of<_MenuModelProvider>(context, listen: false);
      // print('jean: Scroll Controller ${scrollController.offset}');
      scrollController.offset > scrollControllerAntes && scrollController.offset > 100
        ? menuModelProvider.canShow = false 
        : menuModelProvider.canShow = true;
      scrollControllerAntes = scrollController.offset;      
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7),
      child: Center(
         child: GridView.custom(
          controller: scrollController,
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: [
              // el primer numero es lo alto se divide en 4 partes
              // el segundo numero es lo ancho se divide en 4 partes a lo ancho
              // se necesitan los 4 iwdgets
              QuiltedGridTile(3, 2),
              QuiltedGridTile(2, 2),
              QuiltedGridTile(3, 2),
              QuiltedGridTile(2, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate( 
            childCount: widget.items.length,
            (context, index) {
              return _PinterestItem(index: index);
            },
          ),
        )
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({
    Key? key, 
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(child: Text( 'Hola mundo $index' ))
        );
      }
    );
  }
}

class _MenuModelProvider with ChangeNotifier {
  bool _canShow = true;

  bool get canShow => this._canShow;
  set canShow(bool index){
    this._canShow = index;
    notifyListeners();
  }

}