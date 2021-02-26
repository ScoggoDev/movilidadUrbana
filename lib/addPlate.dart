import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'confirmation.dart';

class AddPlate extends StatefulWidget {
  @override
  _AddPlateState createState() => _AddPlateState();
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

addData(String plateController, String reasonController, String inspectorController) {
  Map<String,dynamic> demoData = {
    "plateId" : plateController,
    "reason" : reasonController,
    "inspectorId" : inspectorController,
    "warningDate" : DateTime.now(),
  };

  CollectionReference collectionReference = Firestore.instance.collection('plates');
  collectionReference.document(plateController).setData(demoData);
}

class _AddPlateState extends State<AddPlate> {

  
  @override
  Widget build(BuildContext context) {
    final plateController = TextEditingController();
    final reasonController = TextEditingController();
    final inspectorController = TextEditingController();

    checkControllersAreEmpty() {
      if ((plateController.text != null && plateController.text != '') && (reasonController.text != null && reasonController.text != '') && (inspectorController.text != null && inspectorController.text != '')) {
          return true;
      }

      return false;
    }
    
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
                width: 250,
                child: 
                  TextField(
                    controller: plateController,
                        inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                    maxLengthEnforced: true,
                    maxLength: 8,
                    decoration: InputDecoration(
                      counterText: "",
                      border: const OutlineInputBorder(),
                      hintText: 'Ingresar patente'
                  ),
                )
              ),
          ),

          SizedBox(height: 10),

          Center(
            child: 
            Container(
              width: 250,
              child: TextField(
                controller: reasonController,
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                decoration: InputDecoration(
                    counterText: "",
                    border: const OutlineInputBorder(),
                    hintText: 'Motivo de advertencia'
                    ),
              ),
            ),
          ),

          SizedBox(height: 10),

          Center(
            child: 
            Container(
              width: 250,
              child: TextField(
                controller: inspectorController,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                maxLengthEnforced: true,
                maxLength: 4,
                decoration: InputDecoration(
                    counterText: "",
                    border: const OutlineInputBorder(),
                    hintText: 'N° Inspector'
                ),
              ),
            ),
          ),

          SizedBox(height: 10),

          Center(child: 
            ElevatedButton(
              child: Text('Ingresar patente'),
              onPressed: () {
                if (checkControllersAreEmpty()) {
                      addData(plateController.text, reasonController.text, inspectorController.text);
                      Navigator.push(context,     MaterialPageRoute(builder: (context) => WarningConfimation()));
                }              
              },
            ),
          )
        ]
      ),
    );
  }
}