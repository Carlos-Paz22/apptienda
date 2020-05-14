import 'package:flutter/material.dart';


class SuperV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar( title: Text('Pagina Admin'),),
      body: new Column(
        children: <Widget>[
        Row(      //FIla 1
      children: <Widget>[
          Container(
            padding: EdgeInsets.all(2.0),
            child: new RawMaterialButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/pages/listarUsuarios');
              },
              child: new Icon(
                Icons.people,
                color: Colors.black,
                size: 73.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.white,
              
              ),
              ),
              
      ],
        ),
/*
        Row(      //FIla 2
      children: <Widget>[
          Container(
            padding: EdgeInsets.all(2.0),
            child: new RawMaterialButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/pages/listarUsuarios');
              },
              child: new Icon(
                Icons.people,
                color: Colors.black,
                size: 73.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.white,
              
              ),
              ),
              
           
            
      ],
        ),*/
        
        Row(      //FIla 3
      children: <Widget>[
         /* Container(
            padding: EdgeInsets.all(2.0),
            child: new RawMaterialButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/pages/listarUsuarios');
              },
              child: new Icon(
                Icons.people,
                color: Colors.black,
                size: 73.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.white,
              
              ),
              ),*/
              
            
               Container(
            padding: EdgeInsets.all(2.0),
            child: new RawMaterialButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/LoginPage');
              },
              child: new Icon(
                Icons.exit_to_app,
                color: Colors.red,
                size: 73.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.white,
              
              ),
              ),
      ],
        )
        ],
      ),
       
    );
  }
}

