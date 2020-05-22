import 'package:apptienda/pages/createAccount.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apptienda/pages/createProduct.dart';
import 'package:apptienda/pages/detailUser.dart';
import 'dart:async';
import 'dart:convert';

/* import 'package:apptienda/pages/registroUsuarios.dart'; */
 

class ListUser extends StatefulWidget {
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {


  Future<List> getData() async{
    final response = await http.get("http://192.168.1.9/tienda/getData.php",);
    return json.decode(response.body);

   
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Listado Usuarios"),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search), onPressed:(){})

        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(
          Icons.add ,
          color: Colors.black,
           ),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
             builder: (BuildContext context) => new AddData(),
            )),
      ), 
      

      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                            list: list,
                            index: i,
                          )
                          ),
                ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['username'],
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                ),
                leading: new Icon(
                  Icons.person_pin,
                  size: 77.0,
                  color: Colors.red,
                ),
                subtitle: new Text(
                  "Telefono : ${list[i]['telefono']}",
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}