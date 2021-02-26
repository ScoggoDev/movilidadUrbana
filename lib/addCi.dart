import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'confirmation.dart';
import 'constants.dart';

class AddCi extends StatefulWidget {
  @override
  _AddCiState createState() => _AddCiState();
}

addData(String reasonController, String ciController, String inspectorController) {
    Map<String,dynamic> demoData = {
    "ciId" : ciController,
    "reason" : reasonController,
    "inspectorId" : inspectorController,
    "warningDate" : DateTime.now(),
  };

  CollectionReference collectionReference = Firestore.instance.collection('ci');
    collectionReference.document(ciController).setData(demoData);

}

class _AddCiState extends State<AddCi> {

  final reasonController = TextEditingController();
  final ciController = TextEditingController();
  final inspectorController = TextEditingController();


    checkControllersAreEmpty() {
      if ((ciController.text != null && ciController.text != '') && (reasonController.text != null && reasonController.text != '') && (inspectorController.text != null && inspectorController.text != '')) {
          return true;
      }

      return false;
    }

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
                width: 250,
                child: 
                  TextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  maxLengthEnforced: true,
                  maxLength: 8,
                  controller: ciController,
                  decoration: InputDecoration(
                    counterText: "",
                    border: const OutlineInputBorder(),
                    hintText: 'Ingresar cédula'
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
              child: Text('Ingresar cédula'),
              onPressed: () {
                if(checkControllersAreEmpty()) {
                  addData(reasonController.text, ciController.text, inspectorController.text);
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