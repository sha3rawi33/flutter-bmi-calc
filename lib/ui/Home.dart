import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  double meters = 0.0;
  double result = 0.0;
  String _resultReading = "";
  String _finaBMI = "";

  void _calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      meters = height / 100;
      double weight = double.parse(_weightController.text);
      if (_ageController.text.isNotEmpty ||
          age > 0 && _weightController.text.isNotEmpty ||
          weight > 0 && _heightController.text.isNotEmpty ||
          height > 0) {
        result = weight / (meters * meters);
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "UnderWeight!";
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultReading = "Gtreat Shape!";
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 &&
            double.parse(result.toStringAsFixed(1)) < 29.9) {
          _resultReading = "OverWeight!";
        } else if (double.parse(result.toStringAsFixed(1)) >= 29.9) {
          _resultReading = "Obese";
        }
      } else {
        result = 0.0;
      }
    });
    _finaBMI = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.pink.shade100,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            new Image.asset(
              './images/BMI.png',
              width: 100.0,
              height: 130.0,
            ),
            new Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.grey.shade200,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Fill Up This Form To Calculate Your BMI",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.purple.shade700,
                        fontStyle: FontStyle.italic),
                  ),
                  new TextField(
                    keyboardType: TextInputType.number,
                    controller: _ageController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: "Enter Your Age",
                      hintText: "Your Age; e.g: 15",
                    ),
                  ),
                  new TextField(
                    keyboardType: TextInputType.number,
                    controller: _weightController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.equalizer),
                      labelText: "Enter Your Weight",
                      hintText: "Your Weight in KGMs; e.g: 60",
                    ),
                  ),
                  new TextField(
                    keyboardType: TextInputType.number,
                    controller: _heightController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.accessibility),
                      labelText: "Enter Your Height",
                      hintText: "Your Age in CenteMeters; e.g: 160",
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.all(20.0),
                    child: new RaisedButton(
                      color: Colors.purpleAccent.shade400,
                      onPressed: _calculateBMI,
                      child: new Text(
                        "Calculate BMI",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            new Column(
              children: <Widget>[
                new Text(
                  _finaBMI,
                  style: new TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900),
                ),
                new Text(
                  "$_resultReading",
                  style: new TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.red),
                ),
              ],
            ),
            new Text(
              "Programmed By",
              style: new TextStyle(
                  color: Colors.deepPurpleAccent.shade400,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0),
            ),
            new Text(
              "Ahmed Saad",
              style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
