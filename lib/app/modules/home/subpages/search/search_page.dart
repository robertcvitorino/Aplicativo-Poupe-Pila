import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key key, this.title = "Search"}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
     _logo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(35, 50, 35, 25),
      child: Container(
        height: 200,
        width: 150,
        child: Image.asset('assets/image/barcode.png'),
      ),
    );

      }
      final _pesquisa =TextField(
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              focusColor: Colors.white,
              hintText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
  );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,        
        children: <Widget>[ 
          Padding(
            padding: EdgeInsets.fromLTRB(50, 50, 40, 50),
                child: Text('Informe nome do produto',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                      )
                    ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                  width: 290,
                  height: 50,
                  child: _pesquisa,
                ),
                SizedBox(height: 15,),
                SizedBox(
                  child:Text('Ou se preferir',
                       style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                )),
                ),
            _logo(context),
            
        ],
      ),
    
   
  );

  }
}
