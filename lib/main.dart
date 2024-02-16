import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  final List<String> units = ['meters', 'kilometers', 'miles', 'inches', 'feet'];
  String selectedInputUnit = 'meters';
  String selectedOutputUnit = 'kilometers';
  double inputValue = 0;
  double outputValue = 0;

  void convert() {
    setState(() {
      switch (selectedInputUnit) {
        case 'meters':
          {
            switch (selectedOutputUnit) {
              case 'meters':
                outputValue = inputValue;
                break;
              case 'kilometers':
                outputValue = inputValue / 1000;
                break;
              case 'miles':
                outputValue = inputValue * 0.000621371;
                break;
              case 'inches':
                outputValue = inputValue * 39.3701;
                break;
              case 'feet':
                outputValue = inputValue * 3.28084;
                break;
            }
          }
          break;
        case 'kilometers':
          {
            switch (selectedOutputUnit) {
              case 'meters':
                outputValue = inputValue * 1000;
                break;
              case 'kilometers':
                outputValue = inputValue;
                break;
              case 'miles':
                outputValue = inputValue * 0.621371;
                break;
              case 'inches':
                outputValue = inputValue * 39370.1;
                break;
              case 'feet':
                outputValue = inputValue * 3280.84;
                break;
            }
          }
          break;
        case 'miles':
          {
            switch (selectedOutputUnit) {
              case 'meters':
                outputValue = inputValue / 0.000621371;
                break;
              case 'kilometers':
                outputValue = inputValue / 0.621371;
                break;
              case 'miles':
                outputValue = inputValue;
                break;
              case 'inches':
                outputValue = inputValue * 63360;
                break;
              case 'feet':
                outputValue = inputValue * 5280;
                break;
            }
          }
          break;
        case 'inches':
          {
            switch (selectedOutputUnit) {
              case 'meters':
                outputValue = inputValue * 0.0254;
                break;
              case 'kilometers':
                outputValue = inputValue * 0.0000254;
                break;
              case 'miles':
                outputValue = inputValue * 0.000015783;
                break;
              case 'inches':
                outputValue = inputValue;
                break;
              case 'feet':
                outputValue = inputValue * 0.0833333;
                break;
            }
          }
          break;
        case 'feet':
          {
            switch (selectedOutputUnit) {
              case 'meters':
                outputValue = inputValue * 0.3048;
                break;
              case 'kilometers':
                outputValue = inputValue * 0.0003048;
                break;
              case 'miles':
                outputValue = inputValue * 0.000189394;
                break;
              case 'inches':
                outputValue = inputValue * 12;
                break;
              case 'feet':
                outputValue = inputValue;
                break;
            }
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Enter value to convert'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedInputUnit,
              onChanged: (String? newValue) {
                setState(() {
                  selectedInputUnit = newValue!;
                });
              },
              items: units.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text(
              'Output:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '$outputValue $selectedOutputUnit',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedOutputUnit,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOutputUnit = newValue!;
                });
              },
              items: units.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
