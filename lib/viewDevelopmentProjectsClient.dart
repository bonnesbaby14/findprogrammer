import 'package:findprogrammer/login.dart';
import 'package:findprogrammer/profileClient.dart';
import 'package:findprogrammer/profileProgrammer.dart';
import 'package:findprogrammer/viewAvailableProjects.dart';
import 'package:findprogrammer/viewFinishProjectsClient.dart';
import 'package:findprogrammer/viewFinishProjectsProgrammer.dart';
import 'package:findprogrammer/viewProjectClient.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'componentes/variables.dart';
import 'viewProjectProgrammerPanel.dart';
import 'viewProjectProgrammerInfo.dart';
import 'componentes/helperSQFLITE.dart';
import 'homeClient.dart';
import 'package:flutter/cupertino.dart';
import 'customIcons.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

List<Map<String, dynamic>> desarrolladorList = List();

var contextoS;
Helper helper = new Helper();
var projects;

class ViewDevelopmentProjectsClient extends StatefulWidget {
  @override
  _ViewDevelopmentProjectsClient createState() =>
      new _ViewDevelopmentProjectsClient();
}

class _ViewDevelopmentProjectsClient
    extends State<ViewDevelopmentProjectsClient> {
  @override
  void initState() {
    if (statusRed) {
      getDevelopmentsProjects();
    } else {
      getDevelopmentsProjectsOfline();
    }

    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    var _scaffoldKeyhome = new GlobalKey<ScaffoldState>();

    return RefreshIndicator(
      color: Colors.deepPurpleAccent,
      onRefresh: () async {
        if (statusRed) {
          await getDevelopmentsProjects();
        } else {
          await getDevelopmentsProjectsOfline();
        }
        await Future.delayed(Duration(milliseconds: 500));
        setState(() {});
      },
      child: WillPopScope(
          onWillPop: () {
            //esto es provicional para pruebas
            helper.DeleteDesarrollador();
            Navigator.pop(context);
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
                                builder: (context) => ProfileClient()));
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
                                                  client['ID_USUARIO']
                                                      .toString() +
                                                  ".jpg"))),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: client == null
                                        ? Text(
                                            "Cargando",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white),
                                          )
                                        : Container(
                                            width: 150,
                                            child: Text(
                                              client['NOMBRE'].toString() +
                                                  " " +
                                                  client['APELLIDO_P']
                                                      .toString() +
                                                  " " +
                                                  client['APELLIDO_M']
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
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ViewFinishProjectsClient()));
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
                                        "Proyectos Terminados",
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
                                          GroovinMaterialIcons.worker,
                                          size: 35,
                                          color: Colors.deepPurpleAccent,
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
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homeclient()));
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
                                          GroovinMaterialIcons.new_box,
                                          size: 35,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(9),
                                      child: Text(
                                        "Proyectos Publicados",
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
                    )
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
                                        "   En desarrollo",
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
                                                ViewProjectClient(
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
                                            "   En desarrollo",
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

  Future getDevelopmentsProjects() async {
    var cliente1 = new http.Client();
    try {
      print("-------------------------------------");
      print(client['ID_USUARIO'].toString());
      final response = await cliente1.post(
          //"http://192.168.84.114/findProgrammerDB/loadDevelopmentProjects.php",
          server + "/loadDevelopmentsProjectsCliente.php",
          body: {
            "ID": client['ID_USUARIO'].toString(),
          }).timeout(Duration(seconds: 7));

      var datauser = json.decode(response.body);
      print(datauser);
      projects = datauser;
      print(
          "se obtuvo los proyectos en desarrollo********************************");
      print(projects);
    } catch (d) {
      print("hubo un error obteniendo los proyectos en desarrollo");
      print(d.toString());
    } finally {
      setState(() {});
      cliente1.close();
    }
  }

  void getDevelopmentsProjectsOfline() async {
    try {
      projects = await helper.SelectProjectInfoDevelop();
      print("se obtuvo los proyectos ofline");
      print(myProjects);
      setState(() {});
    } catch (e) {
      print("aqui hay un error de no se que, funcion getClient en homecliente" +
          e.toString());
    }
  }
}
