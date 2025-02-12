import 'package:findprogrammer/login.dart';
import 'package:findprogrammer/profileProgrammer.dart';
import 'package:findprogrammer/viewProjectProgrammerPanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'componentes/variables.dart';
import 'viewProjectProgrammerInfo.dart';
import 'componentes/helperSQFLITE.dart';
import 'homeProgrammer.dart';
import 'viewDevelopmentProjectsProgrammer.dart';
import 'viewFinishProjectsProgrammer.dart';
import 'package:flutter/cupertino.dart';
import 'customIcons.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

var projects;

class ViewAvailableProjects extends StatefulWidget {
  @override
  _ViewAvailableProjects createState() => new _ViewAvailableProjects();
}

class _ViewAvailableProjects extends State<ViewAvailableProjects> {
  @override
  void initState() {
    getProjects();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _scaffoldKeyhome = new GlobalKey<ScaffoldState>();

    Helper helper = new Helper();

    return RefreshIndicator(
      color: Colors.deepPurpleAccent,
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 500));
        setState(() {});
      },
      child: WillPopScope(
          onWillPop: () {
            //esto es provicional para pruebas
          },
          child: Scaffold(
              key: _scaffoldKeyhome,
              drawer: Container(
                width: 260.0,
                decoration: BoxDecoration(
                  color: Color(0xFF272D34),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileProgrammer()));
                      },
                      child: Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(server +
                                                  "/images/image_" +
                                                  desarrollador['ID_USUARIO']
                                                      .toString() +
                                                  ".jpg"))),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: desarrollador == null
                                        ? Text(
                                            "Cargando",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white),
                                          )
                                        : Container(
                                            width: 150,
                                            child: Text(
                                              desarrollador['NOMBRE']
                                                      .toString() +
                                                  " " +
                                                  desarrollador['APELLIDO_P']
                                                      .toString() +
                                                  " " +
                                                  desarrollador['APELLIDO_M']
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
//linea de separacin
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Container(
                        width: 450.0,
                        height: 0.5,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!statusRed) {
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
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    content: Text(
                                        "No hay conexión a internet, intenta más tarde"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Aceptar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                    ],
                                  ));
                          return;
                        }
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeProgrammer()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(1),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                                      child: Container(
                                        child: Icon(
                                          GroovinMaterialIcons.flash_circle,
                                          size: 35,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Tendencias",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    //otro widget

                    GestureDetector(
                      onTap: () {
                        if (!statusRed) {
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
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    content: Text(
                                        "No hay conexión a internet, intenta más tarde"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Aceptar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                    ],
                                  ));
                          return;
                        }
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ViewFinishProjectsProgrammer()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(1),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                                      child: Container(
                                        child: Icon(
                                          GroovinMaterialIcons.check_all,
                                          size: 35,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Proyectos Realizados",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
//nuevo wighet
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ViewDevelopmentProjectsProgrammer()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(1),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                                      child: Container(
                                        child: Icon(
                                          GroovinMaterialIcons.worker,
                                          size: 35,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(9),
                                      child: Text(
                                        "Proyectos en Desarrollo",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),

//nuevo wighet
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!statusRed) {
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
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    content: Text(
                                        "No hay conexión a internet, intenta más tarde"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Aceptar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                    ],
                                  ));
                          return;
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent.withOpacity(0.3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(1),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                                      child: Container(
                                        child: Icon(
                                          GroovinMaterialIcons.new_box,
                                          size: 35,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(9),
                                      child: Text(
                                        "Proyectos Disponibles",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
//nuevo wighet
                    SizedBox(
                      height: 15,
                    ),

                      GestureDetector(
                  onTap: () {
if (!statusRed) {
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
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    content: Text(
                                        "No hay conexión a internet, intenta más tarde"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Aceptar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                    ],
                                  ));
                          return;
                        }
                        if (sistemaBloqueado) {
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
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    content: Text("Sistema bloqueado :c"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Aceptar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                    ],
                                  ));
                        } else {
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
                                        Text("Código de Proyecto",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    content: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          child: CupertinoTextField(
                                            controller: tecCodigo,
                                            placeholder:
                                                "Código de proyecto...",
                                            placeholderStyle: TextStyle(
                                                color: Colors.black38),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors
                                                        .deepPurpleAccent)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () async {
                                          await createPanel2(context);
                                        },
                                        child: Text("Aceptar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancelar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                    ],
                                  ));
                        }
                        },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(1),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                                  child: Container(
                                    child: Icon(
                                      GroovinMaterialIcons.keyboard,
                                      size: 35,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(9),
                                  child: Text(
                                    "Ingresar Código",
                                    style: TextStyle(
                                        fontSize: 17.0, color: Colors.white),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),


//nuevo wighet
                    SizedBox(
                      height: 15,
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
                                      Text("Cerrar Sesión",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)),
                                    ],
                                  ),
                                  content: Text(
                                      "¿Seguro que quieres cerrar sesión?"),
                                  actions: <Widget>[
                                    FlatButton(
                                    onPressed: () async{
                                 await helper.DeleteComents();
                                  await helper.DeleteDesarrollador();
                                  await helper.DeleteProyecto1();
                                  await helper.DeleteProyecto2();
                                  await helper.DeleteProyecto6();
                                  await helper.DeleteProyecto4();
                                  await helper.DeleteProyecto5();
                                  await helper.DeleteProyectoInfo();

                                  await helper.DeleteCliente();
                                  Navigator.pop(context);
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                      child: Text("Cerrar Sesión",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancelar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                  ],
                                ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(1),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                                      child: Container(
                                        child: Icon(
                                          GroovinMaterialIcons.exit_to_app,
                                          size: 35,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(9),
                                      child: Text(
                                        "Cerrar Sesión",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              appBar: null,
              resizeToAvoidBottomPadding: false,
              backgroundColor: Colors.white,
              body: projects != null
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.3), BlendMode.dstATop),
                          image: AssetImage('assets/images/mountains.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: kToolbarHeight,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        onPressed: () {
                                          _scaffoldKeyhome.currentState
                                              .openDrawer();
                                        },
                                        icon: Icon(
                                          CustomIcons.menu,
                                          color: Colors.white,
                                          size: 42,
                                        ),
                                      ),
                                      Text(
                                        "   Bienvenido",
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                    child: Container(
                                      width: 450.0,
                                      height: 1.5,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          ),
                          Text(
                            "Disponibles                       ",
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                            child: Container(
                              width: 450.0,
                              height: 1.5,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: projects == null ? 0 : projects.length,
                              itemBuilder:
                                  (BuildContext context, int position) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewProjectProgrammerInfo(
                                                    projects[position]
                                                        ['ID_PROYECTO'])));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    elevation: 10,
                                    color: Color.fromARGB(450, 41, 39, 42),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.face,
                                          size: 100,
                                          color: Colors.white,
                                        ),
                                        Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                              width: ((MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          4) *
                                                      2) +
                                                  20,
                                              child: Text(
                                                  projects[position]['TITULO']
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 30.0,
                                                      color: Colors.white)),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4) *
                                                  2),
                                              child: Text(
                                                  projects[position][
                                                          'FECHA_DE_PUBLICACION']
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  : Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.dstATop),
                              image: AssetImage('assets/images/mountains.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: kToolbarHeight,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          IconButton(
                                            onPressed: () {
                                              _scaffoldKeyhome.currentState
                                                  .openDrawer();
                                            },
                                            icon: Icon(
                                              CustomIcons.menu,
                                              color: Colors.white,
                                              size: 42,
                                            ),
                                          ),
                                          Text(
                                            "   Bienvenido",
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(70, 0, 0, 0),
                                        child: Container(
                                          width: 450.0,
                                          height: 1.5,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int position) {
                                    return GestureDetector(
                                      onTap: () {},
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        elevation: 10,
                                        color: Color.fromARGB(450, 41, 39, 42),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.face,
                                              size: 100,
                                              color: Colors.white,
                                            ),
                                            Column(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 25,
                                                ),
                                                Container(
                                                  width:
                                                      ((MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  4) *
                                                              2) +
                                                          20,
                                                  child: Text("___________",
                                                      style: TextStyle(
                                                          fontSize: 30.0,
                                                          color: Colors.white)),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  width:
                                                      ((MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4) *
                                                          2),
                                                  child: Text("________",
                                                      style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 25,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 250,
                            height: 250,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
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
                        )
                      ],
                    ))),
    );
  }

  Future getProjects() async {
    var cliente1 = new http.Client();
    try {
      final response = await cliente1.post(
          //"http://192.168.84.114/findProgrammerDB/loadProjects.php",

          server + "/loadProjects.php",
          body: {
            "ID": desarrollador['ID_USUARIO'].toString(),
            "F_D_WEB": desarrollador["F_D_WEB"].toString(),
            "F_D_M_ANDROID": desarrollador["F_D_M_ANDROID"].toString(),
            "F_D_M_IOS": desarrollador["F_D_M_IOS"].toString(),
            "F_D_E_WINDOWS": desarrollador["F_D_E_WINDOWS"].toString(),
            "F_D_E_MAC": desarrollador["F_D_E_MAC"].toString(),
            "F_D_REDES": desarrollador["F_D_REDES"].toString(),
          }).timeout(Duration(seconds: 7));

      var datauser = json.decode(response.body);
      print(datauser);
      projects = datauser;
      print("se obtuvo los proyectos********************************");
      print(projects);
    } catch (d) {
      print("hubo un error obteniendo los proyectoss");
      print(d.toString());
    } finally {
      cliente1.close();
      setState(() {});
    }
  }
}
