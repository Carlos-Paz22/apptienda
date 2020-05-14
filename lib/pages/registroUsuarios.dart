/* import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/pages/listarUsuarios.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerNivel = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void addData() {
    var url = "http://192.168.42.170/tienda/adddata.php";

    http.post(url, body: {
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "nivel": controllerNivel.text,

      //"nivel": _mySelection.toString(), //aqui traemos el DropdownMenuItem lo llamamos _mySelection este es como el controller
      //"nivel": controllerNivel.text
    });
  }
  
  //String _mySelection;
 // List<Map> _myJson = [{"id":0,"name":"ventas"},{"id":1,"name":"admin"}];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Adicionar Usuarios"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerUsername,
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa un nombre de usuario";
                          },
                      decoration: new InputDecoration(
                        hintText: "Usuario", labelText: "Usuario",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.vpn_key, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerPassword,
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa una Contraseña";
                          },
                      decoration: new InputDecoration(
                        hintText: "Contraseña", labelText: "Contraseña",
                      ),
                    ),
                  ),
                  
                   new ListTile(
                    leading: const Icon(Icons.list, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerNivel,
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa un nivel";
                          },
                      decoration: new InputDecoration(
                        hintText: "nivel", labelText: "Nivel",
                      ),
                    ),
                  ),

                    const Divider(
                    height: 1.0,
                  ),                 
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  new RaisedButton(
                    child: new Text("Guardar"),
                    color: Colors.blueAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                    ),
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        addData();
                        Navigator.pop(context);
                      }
                  
                    },
                  ),
                   new RaisedButton(
                    child: new Text("Salir"),
                    color: Colors.red,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                    ),
                    onPressed: () {
                     Navigator.pushReplacementNamed(context, '/powerPage');
                  
                    },
                  ),
                  /*-------------------------*/
               
                       
              
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */