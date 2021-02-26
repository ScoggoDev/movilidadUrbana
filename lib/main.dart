import 'package:flutter/material.dart';
import 'package:movilidadUrbana/addCi.dart';
import 'package:movilidadUrbana/addPlate.dart';
import 'package:movilidadUrbana/plateValidation.dart';

import 'ciValidation.dart';
  
  void main() => runApp(MyApp());
  
  class MyApp extends StatelessWidget {
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Movilidad Urbana',
        home: _ElevatedButtonExample(),
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              
            ),
          ),
        ),
      );
    }
  }
  
  class _ElevatedButtonExample extends StatelessWidget {
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Movilidad Urbana'),
        ),
        backgroundColor: Colors.white,
        body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: 
              Image(image: AssetImage("assets/images/paysandu2.png"), width: 150,)
            ),
            SizedBox(height: 30),

            Center(
              child: ElevatedButton(
              child: Text('  Verificar cédula  '),
              onPressed: () {
                Navigator.push(context,     MaterialPageRoute(builder: (context) => CiValidation()));
              },
            ),
          ),
            Center(
              child: ElevatedButton(
                child: Text(' Verificar patente '),
                onPressed: () {
                Navigator.push(context,     MaterialPageRoute(builder: (context) => PlateValidation()));
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text('  Ingresar cédula  '),
                onPressed: () {
                Navigator.push(context,     MaterialPageRoute(builder: (context) => AddCi()));
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text(' Ingresar patente '),
                onPressed: () {
                Navigator.push(context,     MaterialPageRoute(builder: (context) => AddPlate()));
                },
              ),
            ),
          ]
        )
      );
    }
  }
