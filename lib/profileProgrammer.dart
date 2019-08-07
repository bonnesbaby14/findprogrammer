import 'package:findprogrammer/registerProgrammer.dart';
import 'package:flutter/material.dart';
import 'customIcons.dart';
import 'homeProgrammer.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

var contextoS;

class ProfileProgrammer extends StatefulWidget {
  @override
  _ProfileProgrammer createState() => new _ProfileProgrammer();
}

class _ProfileProgrammer extends State<ProfileProgrammer> {
  @override
  Widget build(BuildContext context) {
    var _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
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
                                        image: AssetImage(
                                            'assets/images/mountains.jpeg'),
                                      )),
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
                                          desarrollador['NOMBRE'].toString() +
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
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeProgrammer()));
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
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                ),
                //otro widget

                Container(
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
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
//nuevo wighet
                SizedBox(
                  height: 15,
                ),
                Container(
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
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),

//nuevo wighet
                SizedBox(
                  height: 15,
                ),
                Container(
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
                                    GroovinMaterialIcons.new_box,
                                    size: 35,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(9),
                                child: Text(
                                  "Proyectos Disponibles",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
//nuevo wighet
                SizedBox(
                  height: 15,
                ),
                Container(
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
                                  "Ingresar Codigo",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),

//nuevo wighet
                SizedBox(
                  height: 15,
                ),
                Container(
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
                                    GroovinMaterialIcons.exit_to_app,
                                    size: 35,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(9),
                                child: Text(
                                  "Cerrar Sesion",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        appBar: null,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: new Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 2) + 60,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState.openDrawer();
                              },
                              icon: Icon(
                                CustomIcons.menu,
                                color: Colors.white,
                                size: 42,
                              )),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/mountains.jpeg'),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      desarrollador['NOMBRE'].toString() +
                          " " +
                          desarrollador['APELLIDO_P'].toString() +
                          " " +
                          desarrollador['APELLIDO_M'].toString(),
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Programador",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.star_half,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                "Califiación",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              Text(
                                desarrollador['CALIFICACION'].toString() + "",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterProgrammer()));
                              },
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    GroovinMaterialIcons.edit_outline,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    "Editar Perfil",
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.white),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 10,
                      color: Color.fromARGB(450, 41, 39, 42),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Icon(
                              Icons.star_half,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 25,
                              ),
                              Text(" Alvaro Pintor",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white)),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 220,
                                child: Text(
                                    "Tardo mucho para entregar los avances del proyecto pero el sistema quedo perfecto.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 10.0,
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
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 10,
                      color: Color.fromARGB(450, 41, 39, 42),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Icon(
                              Icons.star_half,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 25,
                              ),
                              Text(" Alvaro Pintor",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white)),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 220,
                                child: Text(
                                    " Presiona demasiado durante la realizacion del proyecto y el pago se retraso bastante.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 10.0,
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
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 10,
                      color: Color.fromARGB(450, 41, 39, 42),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Icon(
                              Icons.star_half,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 25,
                              ),
                              Text(" Alvaro Pintor",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white)),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 220,
                                child: Text(
                                    " Presiona demasiado durante la realizacion del proyecto y el pago se retraso bastante.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 10.0,
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
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 10,
                      color: Color.fromARGB(450, 41, 39, 42),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Icon(
                              Icons.star_half,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 25,
                              ),
                              Text(" Alvaro Pintor",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white)),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 220,
                                child: Text(
                                    " Presiona demasiado durante la realizacion del proyecto y el pago se retraso bastante.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 10.0,
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
