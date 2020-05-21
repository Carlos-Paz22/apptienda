import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:apptienda/pages/crear_cuenta.dart';
import 'package:apptienda/pages/crear_producto.dart';
import 'package:apptienda/pages/list_product.dart';
import 'package:apptienda/pages/listarUsuarios.dart';
import 'package:apptienda/pages/powerPage.dart';
//import 'package:apptienda/pages/crear_producto.dart';
import 'package:apptienda/pages/vendedoresPage.dart';
import 'package:http/http.dart' as http;
 void main () => runApp(LoginApp());

 String username;

 class LoginApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Mercado Libre',
       home: LoginPage(),
       routes: <String, WidgetBuilder>{
        '/powerPage': (BuildContext context)=> new SuperV(),
        '/vendedoresPage': (BuildContext context)=> new Vendedores(),
         '/pages/list_product': (BuildContext context)=> new LisProduct(),
        '/LoginPage': (BuildContext context)=> new LoginPage(),
        '/pages/listarUsuarios': (BuildContext context)=> new ListarUser(),
        '/pages/crear_cuenta': (BuildContext context)=> new AddData(),
        '/pages/crear_producto': (BuildContext context)=> new AddProduct(),
        
       },
     );
   }
 }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  String mensaje = '';
  Future<List> login() async{ 
    final response = await http.post("http://192.168.1.9/tienda/login.php",body: {

    "username": controllerUser.text,
    "password": controllerPass.text,
    });
   
  //

var datauser = json.decode(response.body);
  if(datauser.length==0){
    setState(() {
     
       
showDialog(
    context: context,
    barrierDismissible:false,

    builder: (context){
     return AlertDialog(
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(20.0)
       ),
       title: Text("Error"),
       content: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
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
           child: Text("Aceptar"),
           onPressed: (){
             Navigator.of(context).pop();
           },
         ),
        
       ],
     );
    }
    );

      
        });
  }else{
    
   if(datauser[0]['estado']=='admin'){
       Navigator.pushReplacementNamed(context, '/powerPage');
    }else if(datauser[0]['estado']=='ventas'){
      Navigator.pushReplacementNamed(context, '/pages/list_product');
    }

    setState(() {
          username= datauser[0]['username'];
        });
  }
    return datauser;
  }

 



  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async => false,
         child: new Scaffold(
           resizeToAvoidBottomPadding: false,
      // appBar: AppBar(title: Text("Login"),),
      body: Container(
        child: Container(
          decoration: new BoxDecoration(
           image: new DecorationImage(
             image: new AssetImage("assets/images/digital.jpg"),
             fit: BoxFit.cover
           ),
          ),
          child: Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 77.0),
                child: new CircleAvatar(
                  backgroundColor: Colors.green[200],
                  child: new Image(
                    width: 135,
                    height: 135,
                    image: new AssetImage('assets/images/avatar7.png'),
                  ),
                ),
                width: 170.0,
                height: 170.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height /2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  top: 93
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width /1.2,
                      padding: EdgeInsets.only(
                        top: 4, left: 16, bottom: 4
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow:[
                          BoxShadow(
                          color: Colors.red,
                          blurRadius: 5
                        ),
                        ] 
                      ),
                      child:  TextFormField(
                        controller: controllerUser,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email, color: Colors.black,
                          ),
                           hintText: 'User'
                        ),
                      ),
                    ),
                    //Password
                    Container(
                      width: MediaQuery.of(context).size.width /1.2,
                      height: 50,
                      margin: EdgeInsets.only(
                        top: 32
                      ),
                      padding: EdgeInsets.only(
                        top: 4, left: 16, right: 16,bottom: 4
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                         color: Colors.white,
                        boxShadow:[
                          BoxShadow(
                          color: Colors.red,
                          blurRadius: 5
                        ),
                        ] 
                      ),
                      child:  TextFormField(
                        controller: controllerPass,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key, color: Colors.black,
                          ),
                          hintText: 'Password'
                        ),
                
                      ),
                    ),
                    Spacer(),
                    new RaisedButton(
                      child: new Text('Ingresar'),
                      color: Colors.red[100],
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                      ),
                      onPressed: (){
                       login();
                     //   Navigator.pop(context);
                     
                      },
                    ),
                       Spacer(),
                    new RaisedButton(
                      child: new Text('Crear cuenta'),
                      color: Colors.orangeAccent,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                      ),
                      onPressed: (){
                      
                     Navigator.pushReplacementNamed(context, '/pages/crear_cuenta');
                      },
                    ),
                    Text(mensaje, style: TextStyle(fontSize: 1 ,color: Colors.red),),
                  ],
                ),
              ),
            ],
          ),
          ),
        ),
    ), 
    );
  }
}
