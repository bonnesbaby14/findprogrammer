import 'dart:convert';

import 'package:findprogrammer/login.dart';
import 'package:flutter/material.dart';
import 'componentes/variables.dart';
import 'main.dart';
import 'homeClient.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

int _groupvalue = 0;
int _groupvalue2 = 0;
bool mac = false,
    windows = false,
    android = false,
    ios = false,
    redes = false,
    web = false;

class UpdateUserC extends StatefulWidget {
  var ID;
  UpdateUserC(this.ID);
  @override
  _UpdateUserC createState() => new _UpdateUserC(this.ID);
}

class _UpdateUserC extends State<UpdateUserC> {
  var ID;
  _UpdateUserC(this.ID);
  File img;
  TextEditingController nombre = TextEditingController(),
      apellidoP = TextEditingController(),
      apellidoM = TextEditingController(),
      curp = TextEditingController(),
      telefono = TextEditingController(),
      proyectos = TextEditingController(),
      preparacion = TextEditingController();
@override
  void initState() {
    // TODO: implement initState
 telefono.text = client['TELEFONO'];
  
    curp.text=client['CURP'];
  }
  @override
  Widget build(BuildContext context) {
 
    print("el id obtenido es: " + ID.toString());
    double mediaw = MediaQuery.of(context).size.width;
    double mediah = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: new Container(
          height: mediah,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            children: <Widget>[
              SizedBox(
                height: kToolbarHeight,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Completa la información",
                    style: TextStyle(fontSize: 38.0, color: Colors.white),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 1, 8.0, 0),
                child: Container(
                  width: 35.0,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => new CupertinoAlertDialog(
                              title: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.devices_other,
                                    size: 80,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Agregar Imagen",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                ],
                              ),
                              content: Text("Selecciona Cámara o Galería"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () async {
                                    try {
                                      img = null;
                                      img = await ImagePicker.pickImage(
                                          source: ImageSource.camera,imageQuality: 20);
                                    } catch (e) {}

                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: Text("Cámara",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                                FlatButton(
                                  onPressed: () async {
                                    try {
                                      img = null;
                                      img = await ImagePicker.pickImage(
                                          source: ImageSource.gallery,imageQuality: 20);
                                    } catch (e) {}

                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: Text("Galería",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                              ],
                            ));
                  },
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Column(
                      children: img == null
                          ? <Widget>[
                              Icon(
                                Icons.camera_front,
                                size: 120.0,
                                color: Colors.white,
                              ),
                              Text(
                                "Subir Fotografía",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ]
                          : <Widget>[Image.file(img)],
                    ),
                  )),

              SizedBox(
                height: 30.0,
              ),
              Theme(
                data: ThemeData(
                    hintColor: white,
                    primaryColor: white,
                    primaryColorDark: white),
                child: TextFormField(
                  controller: curp,
                  maxLength: 18,
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: "CURP",
                    fillColor: Colors.white,
                  ),
                  cursorColor: Colors.white,
                ),
              ),

              SizedBox(
                height: 30.0,
              ),
              Theme(
                data: ThemeData(
                    hintColor: white,
                    primaryColor: white,
                    primaryColorDark: white),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 20,
                  controller: telefono,
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: "Teléfono",
                    fillColor: Colors.white,
                  ),
                  cursorColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),

              Container(
                width: mediaw - 10,
                child: Theme(
                    data: ThemeData(
                        hintColor: white,
                        primaryColor: white,
                        primaryColorDark: white),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Tipo de Cliente",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        ButtonBar(
                          children: <Widget>[
                            Text(
                              "Persona",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white,
                                  hintColor: white,
                                  primaryColor: white,
                                  primaryColorDark: white),
                              child: Radio(
                                activeColor: Colors.white,
                                value: 0,
                                groupValue: _groupvalue,
                                onChanged: (int e) {
                                  setState(() {
                                    _groupvalue = e;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Empresa",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white,
                                  hintColor: white,
                                  primaryColor: white,
                                  primaryColorDark: white),
                              child: Radio(
                                activeColor: Colors.white,
                                value: 1,
                                groupValue: _groupvalue,
                                onChanged: (int e) {
                                  setState(() {
                                    _groupvalue = e;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                      ],
                    )),
              ),

              SizedBox(height: mediah * .03),
              Align(
                child: SizedBox(
                  height: 50.0,
                  width: 270.0,
                  child: OutlineButton(
                    borderSide: BorderSide(color: Colors.white),
                    onPressed: ()async {
                      
                        

                        
                      
                        if (
                            curp.text == "" ||
                            
                           
                            telefono.text == "") {
                         await showDialog(
                              context: context,
                              builder: (context) => new CupertinoAlertDialog(
                                    title: Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.devices_other,
                                          size: 80,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Registrar Usuario",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    content: Text(
                                        "Alguno de los campos esta vacío, llénalos para poder continuar"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("Aceptar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ));
                          return;
                        }
showDialog(
                          context: context,
                          builder: (context) => Center(
                                child: SizedBox(
                                  width: 250,
                                  height: 250,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      elevation: 100,
                                      color: Color.fromARGB(1000, 75, 74, 75),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(20),
                                            child: SizedBox(
                                              height: 120,
                                              width: 120,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 10,
                                                valueColor:
                                                    new AlwaysStoppedAnimation(
                                                        Colors.white),
                                              ),
                                            ),
                                          ),
                                          Text("Cargando",
                                              style: TextStyle(
                                                  fontSize: 30.0,
                                                  color: Colors.white))
                                        ],
                                      )),
                                ),
                              ));
                      await updateCliente(context);
                      
                      
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Finalizar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              //fin de el listview
            ],
          ),
        ));
  }

  Future updateCliente(context) async {
    try {
      print("ññññññññññññññññññññññññññññ");

      print("ññññññññññññññññññññññññññññ");

      final response = await http.post(server + "/updateC.php", body: {
        "ID": ID.toString(),
      
        "CURP": curp.text,
      
        "TELEFONO": telefono.text,
        "TIPO": _groupvalue == 1 ? "1" : "0",
      }).timeout(Duration(seconds: 7));
      print(response.body);
      print("66666666666666666666666666");
if(img!=null){
      var strem = await http.ByteStream(DelegatingStream.typed(img.openRead()));
      var length = await img.length();
      var uri = await Uri.parse(server+"/image.php");
      var request = await http.MultipartRequest("POST", uri);
      var multipartFile = await http.MultipartFile("image", strem, length,
          filename: "image_" + ID.toString() + ".jpg");
      request.files.add(multipartFile);
      var response2 = await request.send();
      if (response2.statusCode == 200) {
        print("si se pudo");
      } else {
        print("no se puedo");
        print(response2.statusCode);
      }

}
      switch (response.body) {
        case "1":
        await getUser();
        await getClient2(context);
        Navigator.pop(context);
          //registro completo
          if (_groupvalue2 == 0) {
            showDialog(
                context: context,
                builder: (context) => new CupertinoAlertDialog(
                      title: Column(
                        children: <Widget>[
                          Icon(
                            Icons.devices_other,
                            size: 80,
                            color: Colors.deepPurpleAccent,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("FindProgrammer",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ],
                      ),
                      content: Text(
                          "Usuario editado con éxito!!!! "),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            
                            Navigator.pop(context);
                             Navigator.pop(context);
                          },
                          child: Text("Aceptar",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ],
                    ));
          }
          break;
        case "5":
          //correo
          showDialog(
              context: context,
              builder: (context) => new CupertinoAlertDialog(
                    title: Column(
                      children: <Widget>[
                        Icon(
                          Icons.devices_other,
                          size: 80,
                          color: Colors.deepPurpleAccent,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("FindProgrammer",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                    content: Text(
                        "El CURP ya fue registrado, intenta iniciar sesión"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Aceptar",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                    ],
                  ));

          break;
        case "":
//error del server
          showDialog(
              context: context,
              builder: (context) => new CupertinoAlertDialog(
                    title: Column(
                      children: <Widget>[
                        Icon(
                          Icons.devices_other,
                          size: 80,
                          color: Colors.deepPurpleAccent,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("FindProgrammer",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                    content: Text(
                        "Ocurrió un problema en el servidor o en la red, inténtalo más tarde"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Aceptar",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                    ],
                  ));

          break;
      }
    } catch (d) {
      print("error registrando el usuario ");
      print(d.toString());
      Navigator.pop(context);
    }
  }
 void getClient() async {
    try {
      clientList = await helper.SelectCliente();
      client = clientList.first;
      print("se obtuvo el cliente en getcliente en homecliente");
    } catch (e) {
      print("aqui hay un error de no se que, funcion getClient en homecliente" +
          e.toString());
    }
    setState(() {});
  }
}
Future getUser() async {
    var cliente1 = new http.Client();
    print(
        "=========================================================================");
    print("se esta obteiendo los reqermientos");

    try {
      final response = await cliente1
          .post(server+"/loadUserC.php",
              // "http://192.168.0.5/findprogrammerDB/loadReq.php",
              body: {"ID": client['ID_USUARIO'].toString()}).timeout(Duration(seconds: 7));

             var respuesta =await json.decode(response.body);

 Map<String, dynamic> MapCliente = Map();

          print(response.body);

helper.DeleteCliente();
         MapCliente['ID_USUARIO'] = respuesta[0]['ID_USUARIO'];
          MapCliente['NOMBRE'] = utf8.decode(base64.decode(respuesta[0]['NOMBRE']));
          MapCliente['APELLIDO_P'] = utf8.decode(base64.decode(respuesta[0]['APELLIDO_P']));
          MapCliente['APELLIDO_M'] = utf8.decode(base64.decode(respuesta[0]['APELLIDO_M']));
          MapCliente['CORREO'] = utf8.decode(base64.decode(respuesta[0]['CORREO']));
          MapCliente['FOTO'] = respuesta[0]['FOTO'];
          MapCliente['CALIFICACION'] = respuesta[0]['CALIFICACION'];
          MapCliente['F_ESTADO_REGISTRO'] = respuesta[0]['F_ESTADO_REGISTRO'];
          MapCliente['PASSWORD'] = respuesta[0]['PASSWORD'];
          MapCliente['TELEFONO'] = utf8.decode(base64.decode(respuesta[0]['TELEFONO']));
          MapCliente['F_BAJA_USUARIO'] = respuesta[0]['F_BAJA_USUARIO'];
          MapCliente['F_ESTADO_LOGIN'] = respuesta[0]['F_ESTADO_LOGIN'];
          MapCliente['CURP'] = utf8.decode(base64.decode(respuesta[0]['CURP']));
          MapCliente['F_USUARIO_APRUEBA'] = respuesta[0]['F_USUARIO_APRUEBA'];

          print(MapCliente.toString());

//insertar datos del programador logueado.
          var insertCliente = await helper.InsertCliente(MapCliente);
          print("//$insertCliente//");


      
      print("se actualizo el usuario");
    } catch (f) {
      print("hubo un error obteniendo los requerimeintos");
      print(f.toString());
    } finally {
      cliente1.close();
      
    }
  }

  void getClient2(context) async {
    try {
      clientList = await helper.SelectCliente();

      print("!!!!!!!!!!!!!!!!!!11");
      print(clientList[0]['NOMBRE']);
      print("!!!!!!!!!!!!!!!!!!11");
      client = clientList.first;
      print("se obtuvo el cliente en getcliente en homecliente");
      print(client['F_BAJA_USUARIO']);
      if (client['F_BAJA_USUARIO'] == 1) {
        print("object");
        helper.DeleteComents();
        helper.DeleteDesarrollador();
        helper.DeleteProyecto1();
        helper.DeleteProyecto2();
        helper.DeleteProyecto6();
        helper.DeleteProyecto4();
        helper.DeleteProyecto5();
        helper.DeleteProyectoInfo();

        helper.DeleteCliente();
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    } catch (e) {
      print("aqui hay un error de no se que, funcion getClient en homecliente" +
          e.toString());
    }

  }
