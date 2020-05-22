import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apptienda/pages/listProduct.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => new _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController controllerNombre = new TextEditingController();
  TextEditingController controllerPrecio = new TextEditingController();
  TextEditingController controllerDescripcion = new TextEditingController();
  TextEditingController controllerCategoria = new TextEditingController();
  // TextEditingController controllerImagen = new TextEditingController();  //Por agg imagen

  var _formKey = GlobalKey<FormState>();

  void addProduct() {
    var url = "http://192.168.1.9/tienda/addProduct.php";

    http.post(url, body: {
      "nombre": controllerNombre.text,
      "precio": controllerPrecio.text,
      "descripcion": controllerDescripcion.text,
      "categoria": controllerCategoria.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Agregar Producto"),
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
                    leading: const Icon(Icons.rate_review, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerNombre,
                      validator: (value) {
                        if (value.isEmpty)
                          return " Ingrese el nombre del producto ";
                      },
                      decoration: new InputDecoration(
                        hintText: "Producto",
                        labelText: "Producto",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.monetization_on, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerPrecio,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa un precio";
                      },
                      decoration: new InputDecoration(
                        hintText: "Precio",
                        labelText: "Precio",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.description, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerDescripcion,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Ingrese una descricion de su producto";
                      },
                      decoration: new InputDecoration(
                        hintText: "Descripcion",
                        labelText: "Descripcion",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.category, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerCategoria,
                      validator: (value) {
                        if (value.isEmpty) return "Ingrese una Categoria";
                      },
                      decoration: new InputDecoration(
                        hintText: "Categoria",
                        labelText: "Categoria",
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
                    color: Colors.green,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addProduct();
                        Navigator.pop(context);
                      }
                    },
                  ),
                  new RaisedButton(
                    child: new Text("Salir"),
                    color: Colors.red,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/pageUser');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}