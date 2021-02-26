import 'package:flutter/material.dart';
import 'package:movilidadUrbana/main.dart';

class WarningConfimation extends StatefulWidget {
  @override
  WarningConfimationState createState() => WarningConfimationState();
}

class WarningConfimationState extends State<WarningConfimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(image: AssetImage("assets/images/confirmation.png"), width: 150, height: 150)
          ),

          SizedBox(height: 30),

          Center(
            child: Text("Se ha realizado la advertencia correctamente"),
          ),

          SizedBox(height: 30),


          Center(
            child: ElevatedButton(
                child: Text('Volver a inicio'),
                onPressed: () {
                  Navigator.push(context,     MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
          ),
        ],
      ),
      
    );
  }
}