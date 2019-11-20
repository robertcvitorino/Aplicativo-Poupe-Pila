import 'package:flutter/material.dart';
import 'package:poupe/app/app_module.dart';
import 'package:poupe/app/modules/home/subpages/cart/cart_page.dart';
import 'package:poupe/app/modules/home/subpages/favorite/favorite_page.dart';
import 'package:poupe/app/modules/home/subpages/search/search_page.dart';
import 'package:poupe/app/modules/login/login_bloc.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "PoupePila"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final  bloc = AppModule.to.getBloc<LoginBloc>();
   int _indiceAtual=0;

  @override
  void dispose() {
    bloc.close();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {   
    List<Widget> telas =[
      SearchPage(),
      FavoritePage(),
      CartPage()
    ];  
   
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green[400],
        actions: <Widget>[
         IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: (){},
         )
        ],
      ),
      body: Container(
        color: Colors.white24,
        child: telas[_indiceAtual],
      ),










      //floatingActionButton: FloatingActionButton(child: Icon(Icons.exit_to_app),onPressed: bloc.logout,),
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual=indice;
          });
        },
        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              title: Text('Pesquisa'),
                backgroundColor: Colors.green,
                icon: Icon(Icons.search)
            ),
            BottomNavigationBarItem(
                title: Text('Favorito'),
                backgroundColor: Colors.green,
                icon: Icon(Icons.star_border)
            ),
            BottomNavigationBarItem(
                title: Text('Carrinho'),
                backgroundColor: Colors.green,
                icon: Icon(Icons.shopping_cart)
            ),
          ]
                ),
    );
  }
}
