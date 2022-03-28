import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bmiformpage.dart';
import 'bmrformpage.dart';
import 'idealweightformpage.dart';
import 'bodyfatpage.dart';
import 'macroformpage.dart';
import 'caloriecalcform.dart';
import 'proteinform.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String bmi = "bmi";
  String cal = "cal";
  String macro = "macro";
  String ideal = "ideal";
  String body_fat = "body_fat";
  @override
  Widget build(BuildContext context) {
    final button1 = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BmiFormPage()));
        },
        child: Text("BMI", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final button2 = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BmrFormPage()));
        },
        child: Text("BMR", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final button3 = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => IdlWtFormPage()));
        },
        child: Text("IdealWeight", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final button4 = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BodyFatFormPage()));
        },
        child: Text("Body fat", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final button5 = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MacroFormPage()));
        },
        child: Text("Macro", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final button6 = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CalorieFormPage()));
        },
        child: Text("Calorie", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final button7 = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProteinFormPage()));
        },
        child: Text("Protein", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(children: <Widget>[
                      button1,
                      SizedBox(height: 5),
                      button2,
                      SizedBox(height: 5),
                      button3,
                      SizedBox(height: 5),
                      button4,
                      SizedBox(height: 5),
                      button5,
                      SizedBox(height: 5),
                      button6,
                      SizedBox(height: 5),
                      button7,
                    ]),
                  ))),
        ));
  }
}
