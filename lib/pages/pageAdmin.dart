import 'package:apptienda/pages/listUser.dart';
import 'package:apptienda/pages/listProduct.dart';
import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Pagina Admin'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return  AboutWidget(); 
                }),
            /*    icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/LoginPage');
                showAboutDialog(context: context);
              } */
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          ListTile(
            title: Text("Registro de Usuarios"),
            subtitle: Text("Administrar"),
            leading: Icon(Icons.list),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new ListUser(),
              ));
              /*  Navigator.pushReplacementNamed(context, '/pages/listUser'); */
            },
          ),
          Divider(),
          Divider(),
          ListTile(
            title: Text("Registro de Productos"),
            subtitle: Text("Administrar"),
            leading: Icon(Icons.list),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new ListProduct(),
              ));
              /*  Navigator.pushReplacementNamed(context, '/pages/listUser'); */
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: AlertDialog(
        
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text("Error"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Password / User "),
            Text(" Incorrect"),
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 73.0,
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
             child: Text("Aceptar"),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/LoginPage');
            },
          )
        ],
      ),
    );
  }
} 
