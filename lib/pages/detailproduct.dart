import 'package:flutter/material.dart';
import 'package:apptienda/pages/listProduct.dart';
import './editproduct.dart';
import 'package:http/http.dart' as http;


class Detailproduct extends StatefulWidget {
  List list;
  int index;
  Detailproduct({this.index,this.list});
  @override
  _DetailproductState createState() => new _DetailproductState();
}

class _DetailproductState extends State<Detailproduct> {

void deleteProduct(){
  var url="http://192.168.1.9/tienda/deleteProduct.php";
  http.post(url, body: {
    'id': widget.list[widget.index]['id']
  });
}

void confirm (){
  AlertDialog alertDialog = new AlertDialog(
    content: new Text("Esta seguro de eliminar '${widget.list[widget.index]['nombre']}'"),
    actions: <Widget>[
      new RaisedButton(
        child: new Text(" Eliminar",style: new TextStyle(color: Colors.black),),
        color: Colors.red,
        onPressed: (){
          deleteProduct();
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new ListProduct(),
            )
          );
        },
      ),
       VerticalDivider(),
      new RaisedButton(
        child: new Text("CANCELAR",style: new TextStyle(color: Colors.black)),
        color: Colors.green,
        onPressed: ()=> Navigator.pop(context),
      ),
    ],
  );

  showDialog(context: context, child: alertDialog,barrierDismissible: false);
  
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['nombre']}")),
      body: SingleChildScrollView(
              child: new Container(
          /* height: 500.0,  */
          padding: const EdgeInsets.all(20.0),
          child: new Card(
            child: new Center(
              child: new Column(
                children: <Widget>[

                  new Padding(padding: const EdgeInsets.only(top: 30.0),),
                  new Text(widget.list[widget.index]['nombre'], style: new TextStyle(fontSize: 20.0),),
                  Divider(
                    color:Colors.black,
                  ),
                  new Text(widget.list[widget.index]['precio'], style: new TextStyle(fontSize: 20.0),),
                  new Padding(padding: const EdgeInsets.only(top: 30.0),),
                  Divider(
                     color:Colors.black,
                  ),
                  new Text(widget.list[widget.index]['descripcion'], style: new TextStyle(fontSize: 20.0),),
                  new Padding(padding: const EdgeInsets.only(top: 30.0),),
                  Divider(
                     color:Colors.black,
                  ),
                  new Text(widget.list[widget.index]['categoria'], style: new TextStyle(fontSize: 20.0),),
                  new Padding(padding: const EdgeInsets.only(top: 30.0),),
                   Divider(
                      color:Colors.black,
                   ),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new RaisedButton(
                      child: new Text("EDITAR"),                  
                      color: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0)),
                      onPressed: ()=>Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context)=>new EditProduct(list: widget.list, index: widget.index,),
                          )
                        ),                    
                    ),
                    VerticalDivider(),
                    new RaisedButton(
                      child: new Text("ELIMINAR"),                  
                      color: Colors.redAccent, 
                      shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0)),
                      onPressed: ()=>confirm(),                
                    ),
                     VerticalDivider(),
                       new RaisedButton(
                      child: new Text("Salir"),
                      color: Colors.yellow,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)
                      ),
                      onPressed: () {
                       Navigator.pushReplacementNamed(context, '/pageUser');
                    
                      },
                    ),
                    ], 
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}