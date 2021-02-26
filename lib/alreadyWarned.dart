import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movilidadUrbana/addCi.dart';
import 'package:movilidadUrbana/main.dart';
import 'constants.dart';

class AlreadyWarned extends StatefulWidget {
  @override
  _AlreadyWarnedState createState() => _AlreadyWarnedState();
}

class _AlreadyWarnedState extends State<AlreadyWarned> {
  @override
  Widget build(BuildContext context) {
        return StreamBuilder(
                  stream: Firestore.instance.collection("ci").where('ciId', isEqualTo: Constants.ciId).snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData || snapshot.data.documents.isEmpty) {
                      return Scaffold(body: 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Image(image: AssetImage("assets/images/error.png"), width: 150, height: 150)
                            ),
                            SizedBox(height: 40),
                            Text("La cédula " + Constants.ciId + " no existe"),
                            SizedBox(height: 15),
                            Center(
                              child: ElevatedButton(
                                child: Text('Ingresar la cédula'),
                                onPressed: () {
                                Navigator.push(context,     MaterialPageRoute(builder: (context) => AddCi()));
                                },
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                child: Text('   Volver al inicio   '),
                                onPressed: () {
                                  Constants.addCi = Constants.ciId;
                                  Constants.ciId = "";
                                  Navigator.push(context,     MaterialPageRoute(builder: (context) => MyApp()));
                                },
                              ),
                            )
                          ]
                        ) 
                      );
                    }
                  else if (snapshot.hasData || !snapshot.data.documents.isEmpty) {
                    Timestamp t = snapshot.data.documents[0]['warningDate'];
                    DateTime d = t.toDate();
                    return Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget> [
                            Text("La cédula " + snapshot.data.documents[0]['ciId']),
                            SizedBox(height: 10),
                            Text("Fue advertida por el inspector N° " + snapshot.data.documents[0]['inspectorId']),
                            SizedBox(height: 10),
                            Text("Por el siguiente motivo: " + snapshot.data.documents[0]['reason']),
                            SizedBox(height: 10),
                            Text("El día: " + d.toString()),
                            SizedBox(height: 25),
                            Center(
                              child: ElevatedButton(
                                child: Text('Volver al Inicio'),
                                onPressed: () {
                                Navigator.push(context,     MaterialPageRoute(builder: (context) => MyApp()));
                                },
                              ),
                            ),
                          ],),
                        ),
                      );
                    }
                  },
                );
  }
}