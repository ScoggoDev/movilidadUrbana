import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'alreadyWarnedPlate.dart';
import 'constants.dart';

class PlateValidation extends StatefulWidget {
  @override
  _PlateValidationState createState() => _PlateValidationState();
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

class _PlateValidationState extends State<PlateValidation> {
  @override
    final plateController = TextEditingController();

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
                  controller: plateController,
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                  ],
                  maxLengthEnforced: true,
                  maxLength: 9,
                  decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Ingresar patente'
                  ),
                )
              ),
          ),

          Center(child: 
            ElevatedButton(
              child: Text('Verificar patente'),
              onPressed: () {
                Constants.plateId = plateController.text;
                if(plateController.text != null && plateController.text != "") {
                  Navigator.push(context,     MaterialPageRoute(builder: (context) => AlreadyWarnedPlate()));
                }
              },
            ),
          ),

          
        ]
      ),
    );
  }
}