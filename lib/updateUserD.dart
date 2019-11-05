import 'package:findprogrammer/login.dart';
import 'package:flutter/material.dart';
import 'componentes/variables.dart';
import 'main.dart';
import 'homeProgrammer.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

bool value = false;
bool hiden1 = false;
bool hiden2 = false;
int _groupvalue = 0;
int _groupvalue2 = 0;
bool mac = false,
    windows = false,
    android = false,
    ios = false,
    redes = false,
    web = false;

class UpdateUserD extends StatefulWidget {
  var ID;
  UpdateUserD(this.ID);
  @override
  _UpdateUserD createState() => new _UpdateUserD(this.ID);
}

class _UpdateUserD extends State<UpdateUserD> {
  var ID;
  _UpdateUserD(this.ID);
  File img;
  TextEditingController curp = TextEditingController(),
      telefono = TextEditingController(),
      proyectos = TextEditingController(),
      preparacion = TextEditingController();
      @override
  void initState() {
    // TODO: implement initState
 if (desarrollador['F_D_WEB'] == 1) {
      web = true;
      
    } else {
      web = false;
    }
    if (desarrollador['F_D_M_ANDROID'] == 1) {
      android = true;
    } else {
      android = false;
    }
    if (desarrollador['F_D_M_IOS'] == 1) {
      ios = true;
    } else {
      ios = false;
    }
    if (desarrollador['F_D_E_WINDOWS'] == 1) {
      windows = true;
    } else {
      windows = false;
    }
    if (desarrollador['F_D_E_MAC'] == 1) {
      mac = true;
    } else {
      mac = false;
    }
     if (desarrollador['F_D_REDES'] == 1) {
      redes = true;
    } else {
      redes = false;
    }
telefono.text = desarrollador['TELEFONO'];
    proyectos.text = desarrollador['PROYECTOS_TRABAJADOS'];
    preparacion.text = desarrollador['PREPARACION'];
    curp.text=desarrollador['CURP'];
  }

  @override
  Widget build(BuildContext context) {
    
    
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
                              content: Text("Selecciona Camara o Galeria"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () async {
                                    try {
                                      img = null;
                                      img = await ImagePicker.pickImage(
                                          source: ImageSource.camera);
                                    } catch (e) {}

                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: Text("Camara",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                                FlatButton(
                                  onPressed: () async {
                                    try {
                                      img = null;
                                      img = await ImagePicker.pickImage(
                                          source: ImageSource.gallery);
                                    } catch (e) {}

                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: Text("Galeria",
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
                                "Subir Fotografia",
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
                    labelText: "Telefono",
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
                        Theme(
                          data: ThemeData(
                              hintColor: white,
                              primaryColor: white,
                              primaryColorDark: white),
                          child: TextFormField(
                            controller: curp,
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
                          height: 7.0,
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Theme(
                                data: ThemeData(
                                    hintColor: white,
                                    primaryColor: white,
                                    primaryColorDark: white),
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Especialidad",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7.0,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text("Desarrollo web      ",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    )),
                                                Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                            unselectedWidgetColor:
                                                                Colors.white),
                                                    child: Checkbox(
                                                      checkColor: Colors.white,
                                                      activeColor: Colors
                                                          .deepPurpleAccent,
                                                      value: web,
                                                      onChanged: (bool _value) {
                                                        setState(() {
                                                          web = _value;
                                                        });
                                                      },
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                    "Desarrollo \n movil (Android)",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    )),
                                                Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                            unselectedWidgetColor:
                                                                Colors.white),
                                                    child: Checkbox(
                                                      checkColor: Colors.white,
                                                      activeColor: Colors
                                                          .deepPurpleAccent,
                                                      value: android,
                                                      onChanged: (bool _value) {
                                                        setState(() {
                                                          android = _value;
                                                        });
                                                      },
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                    "Desarrollador \n movil (IOS)            ",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    )),
                                                Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                            unselectedWidgetColor:
                                                                Colors.white),
                                                    child: Checkbox(
                                                      checkColor: Colors.white,
                                                      activeColor: Colors
                                                          .deepPurpleAccent,
                                                      value: ios,
                                                      onChanged: (bool _value) {
                                                        setState(() {
                                                          ios = _value;
                                                        });
                                                      },
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                    "Desarrollador \n de RED               ",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    )),
                                                Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                            unselectedWidgetColor:
                                                                Colors.white),
                                                    child: Checkbox(
                                                      checkColor: Colors.white,
                                                      activeColor: Colors
                                                          .deepPurpleAccent,
                                                      value: redes,
                                                      onChanged: (bool _value) {
                                                        setState(() {
                                                          redes = _value;
                                                        });
                                                      },
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                    "Desarrollador \n Windows               ",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    )),
                                                Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                            unselectedWidgetColor:
                                                                Colors.white),
                                                    child: Checkbox(
                                                      checkColor: Colors.white,
                                                      activeColor: Colors
                                                          .deepPurpleAccent,
                                                      value: windows,
                                                      onChanged: (bool _value) {
                                                        setState(() {
                                                          windows = _value;
                                                        });
                                                      },
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                    "Desarrollo \n MAC OS             ",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    )),
                                                Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                            unselectedWidgetColor:
                                                                Colors.white),
                                                    child: Checkbox(
                                                      checkColor: Colors.white,
                                                      activeColor: Colors
                                                          .deepPurpleAccent,
                                                      value: mac,
                                                      onChanged: (bool _value) {
                                                        setState(() {
                                                          mac = _value;
                                                        });
                                                      },
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Theme(
                              data: ThemeData(
                                  hintColor: white,
                                  primaryColor: white,
                                  primaryColorDark: white),
                              child: TextFormField(
                                controller: preparacion,
                                style: new TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Preparación Academica (Mención)",
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
                                controller: proyectos,
                                style: new TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Proyectos Realizados (Mención)",
                                  fillColor: Colors.white,
                                ),
                                cursorColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 55.0,
                            ),
                          ],
                        )
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
                    onPressed: () {
                      
                        if (curp.text == "" ||
                            telefono.text == "" ||
                            proyectos.text == "" ||
                            preparacion.text == "" ||
                            (!mac &&
                                !ios &&
                                !windows &&
                                !web &&
                                !android &&
                                !redes)) {
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
                                        Text("Registrar Usuario",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    content: Text(
                                        "Alguno de los campos esta vacio, llenalos para poder continuar"),
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

                       UpdateDeveloper();
                        
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

  Future UpdateDeveloper() async {
    try {
      print("ññññññññññññññññññññññññññññ");

      print("ññññññññññññññññññññññññññññ");

      final response = await http.post(server + "/updateD.php", body: {
        "ID": ID.toString(),
        "CURP": curp.text,
        "TELEFONO": telefono.text,
        "TIPO": _groupvalue == 1 ? "1" : "0",
        "PROYECTOS": proyectos.text,
        "PREPARACION": preparacion.text,
        "WEB": web ? "1" : "0",
        "IOS": ios ? "1" : "0",
        "ANDROID": android ? "1" : "0",
        "REDES": redes ? "1" : "0",
        "WINDOWS": windows ? "1" : "0",
        "MAC": mac ? "1" : "0",
      }).timeout(Duration(seconds: 7));
      print(response.body);
      print("66666666666666666666666666");
if(img!=null){
      var strem = http.ByteStream(DelegatingStream.typed(img.openRead()));
      var length = await img.length();
      var uri = Uri.parse(server + "/image.php");
      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile("image", strem, length,
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
          //registro completo
       
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
                          "Usuario editado con exito!!!!"),
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
                        "La CURP ya fue registrada, intenta iniciar sesión"),
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
                        "Ocurrió un problema en el servidor o en la red, intentalo mas tarde"),
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
}