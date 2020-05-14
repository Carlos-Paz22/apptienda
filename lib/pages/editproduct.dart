import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apptienda/pages/list_product.dart';

class EditProduct extends StatefulWidget {
  final List list;
  final int index;

  EditProduct({this.index, this.list});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  //para la base
  TextEditingController controllerNombre;
  TextEditingController controllerPrecio;
  TextEditingController controllerDescripcion;
  TextEditingController controllerCategoria;


  void editProduct() {
    var url="http://192.168.1.6/tienda/editproduct.php";
    http.post(url,body: {
      "id": widget.list[widget.index]['id'],
      "nombre": controllerNombre.text,
      "precio": controllerPrecio.text,
      "descripcion": controllerDescripcion.text,
      "categoria": controllerCategoria.text
    });
  }
 @override
void initState() {
      controllerNombre= new TextEditingController(text: widget.list[widget.index]['nombre'] );
      controllerPrecio= new TextEditingController(text: widget.list[widget.index]['precio'] );
      controllerDescripcion= new TextEditingController(text: widget.list[widget.index]['descripcion'] );
      controllerCategoria= new TextEditingController(text: widget.list[widget.index]['categoria'] );
      super.initState();
    }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDITAR"),
      ),
      body: Form(       
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              new Column(
                children: <Widget>[
                 new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerNombre,
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa un nombre de Producto";
                          },
                      decoration: new InputDecoration(
                        hintText: "Producto", labelText: "Producto",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerPrecio,
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa una precio";
                          },
                      decoration: new InputDecoration(
                        hintText: "Precio", labelText: "precio",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.settings_input_component, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerDescripcion,
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa una descripcion";
                          },
                      decoration: new InputDecoration(
                        hintText: "Descripcion", labelText: "Descripcion",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.settings_input_component, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerCategoria,
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa una Categoria";
                          },
                      decoration: new InputDecoration(
                        hintText: "Categoria", labelText: "Categoria",
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
                    onPressed: () {
                      editProduct();
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new LisProduct()
                        )
                      );
                    },
                  )
                ],
              ),
            ],
          ),
      ),
    );
  }
  }

