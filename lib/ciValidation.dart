import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movilidadUrbana/alreadyWarned.dart';

import 'constants.dart';


class CiValidation extends StatefulWidget {
  @override
  _CiValidationState createState() => _CiValidationState();
}

class _CiValidationState extends State<CiValidation> {
  final ciController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Movilidad Urbana'),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: 
              Container(
                width: 150,
                child: 
                  TextField(
                  controller: ciController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  maxLengthEnforced: true,
                  maxLength: 8,
                  decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Ingresar cédula'
                  ),
                )
              ),
          ),

          Center(child: 
            ElevatedButton(
              child: Text('     Verificar CI     '),
              onPressed: () {
                Constants.ciId = ciController.text;
                if(ciController.text != null && ciController.text != "") {
                  Navigator.push(context,     MaterialPageRoute(builder: (context) => AlreadyWarned()));
                }
              },
            ),
          ),

          
        ]
      ),
    );
  }
}