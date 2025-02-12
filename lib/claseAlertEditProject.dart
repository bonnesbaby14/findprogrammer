import 'package:findprogrammer/viewProjectClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';




//clase para la alerta con estado
class AlertEditPorject extends StatefulWidget {
  var ID;
  AlertEditPorject(this.ID);
  @override
  _AlertEditPorject createState() => new _AlertEditPorject(ID);
}

class _AlertEditPorject extends State<AlertEditPorject>{
 var ID;
  _AlertEditPorject(this.ID);

  @override
  Widget build(BuildContext context) {



    return SingleChildScrollView(
        child: CupertinoAlertDialog(

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
          Text("Proyecto", style: TextStyle(color: Colors.black, fontSize: 20)),
        ],
      ),
      content: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          CupertinoTextField(
            controller: tdcTitulo,
            placeholder: "Título...",
            placeholderStyle: TextStyle(color: Colors.black38),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.5, color: Colors.deepPurpleAccent)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            child: CupertinoTextField(
              placeholder: "Descripción...",
              controller: tdcDescripcion,
              placeholderStyle: TextStyle(color: Colors.black38),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(width: 0.5, color: Colors.deepPurpleAccent)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoTextField(
            controller: tdcPresupuesto,
            placeholder: "Presupuesto...",
            placeholderStyle: TextStyle(color: Colors.black38),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.5, color: Colors.deepPurpleAccent)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Tipo de Proyecto",
            style: TextStyle(color: Colors.black45),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Aplicación Movil (Android)  ",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Radio(
                  activeColor: Colors.deepPurpleAccent,
                  groupValue: intTipo,
                  value: 0,
                  onChanged: (int e) {
                    setState(() {
                      intTipo = e;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Aplicación Movil (IOS)     ",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Radio(
                  groupValue: intTipo,
                  value: 1,
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (int e) {
                    setState(() {
                      intTipo = e;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Aplicación Windows",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Radio(
                  activeColor: Colors.deepPurpleAccent,
                  groupValue: intTipo,
                  value: 2,
                  onChanged: (int e) {
                    setState(() {
                      intTipo = e;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Aplicación Mac OS",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Radio(
                  groupValue: intTipo,
                  activeColor: Colors.deepPurpleAccent,
                  value: 3,
                  onChanged: (int e) {
                    setState(() {
                      intTipo = e;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Sistema Web             ",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Radio(
                  groupValue: intTipo,
                  activeColor: Colors.deepPurpleAccent,
                  value: 4,
                  onChanged: (int e) {
                    setState(() {
                      intTipo = e;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Proyecto Redes      ",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Radio(
                  groupValue: intTipo,
                  value: 5,
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (e) {
                    setState(() {
                      intTipo = e;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Frecuencia de entrega de avance",
            style: TextStyle(color: Colors.black45),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Cada 15 dias ",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Radio(
                  groupValue: intFrecuencia,
                  value: 0,
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (int e) {
                    setState(() {
                      intFrecuencia = e;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Cada mes   ",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Radio(
                  groupValue: intFrecuencia,
                  activeColor: Colors.deepPurpleAccent,
                  value: 1,
                  onChanged: (int e) {
                    setState(() {
                      intFrecuencia = e;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Cada 2 meses",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Radio(
                  groupValue: intFrecuencia,
                  activeColor: Colors.deepPurpleAccent,
                  value: 2,
                  onChanged: (int e) {
                    setState(() {
                      intFrecuencia = e;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Solicitar Entregables",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Material(
                  color: Colors.transparent,
                  child: Checkbox(
                    activeColor: Colors.deepPurpleAccent,
                    onChanged: (e) {
                      setState(() {
                        flat = e;
                      });
                    },
                    value: flat,
                  )),
            ],
          ),
          
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancelar",
              style: TextStyle(color: Colors.black, fontSize: 15)),
        ),
        FlatButton(
          onPressed: () {
            editProject(ID);
            Navigator.pop(context);
          },
          child: Text("Guardar",
              style: TextStyle(color: Colors.black, fontSize: 15)),
        ),
      ],
    ));
  }
}
