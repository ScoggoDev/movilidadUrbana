import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movilidadUrbana/addPlate.dart';
import 'package:movilidadUrbana/main.dart';
import 'constants.dart';

class AlreadyWarnedPlate extends StatefulWidget {
  @override
  _AlreadyWarnedPlateState createState() => _AlreadyWarnedPlateState();
}

class _AlreadyWarnedPlateState extends State<AlreadyWarnedPlate> {
  @override
  Widget build(BuildContext context) {
        return StreamBuilder(
                  stream: Firestore.instance.collection("plates").where('plateId', isEqualTo: Constants.plateId).snapshots(),
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
                            Text("La patente " + Constants.plateId + " no existe"),
                            SizedBox(height: 15),
                            Center(
                              child: ElevatedButton(
                                child: Text('Ingresar la patente'),
                                onPressed: () {
                                Navigator.push(context,     MaterialPageRoute(builder: (context) => AddPlate()));
                                },
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                child: Text('   Volver al inicio   '),
                                onPressed: () {
                                  Constants.addCi = Constants.plateId;
                                  Constants.plateId = "";
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
                            Text("La patente " + snapshot.data.documents[0]['plateId']),
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
                          ],
                          ),
                        ),
                        
                      );
                    }
                  },
                );
              }
            }