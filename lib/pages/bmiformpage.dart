import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'homepage.dart';

class BmiFormPage extends StatefulWidget {
  @override
  _BmiFormPageState createState() => _BmiFormPageState();
}

class _BmiFormPageState extends State<BmiFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  int gender = 1;
  double _result = 0.00;
  double _bmi = 0.0;
  DateTime date = DateTime(1900);
  @override
  Widget build(BuildContext context) {
    final genderField = Column(
      children: [
        Row(children: [
          Container(
            child: Text("Gender", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(width: 20.0),
          Radio(
            value: 1,
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value as int;
              });
            },
          ),
          SizedBox(width: 5.0),
          Text("Male"),
          SizedBox(width: 30.0),
          Radio(
            value: 2,
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value as int;
              });
            },
          ),
          SizedBox(width: 5.0),
          Text("Female"),
        ])
      ],
    );
    // final dobField = TextFormField(
    //   autofocus: false,
    //   controller: heightController,
    //   keyboardType: TextInputType.number,
    //   validator: (value) {
    //     if (value == null || value.isEmpty) {
    //       return 'Please enter some text';
    //     }
    //     return null;
    //   },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       labelText: 'Enter Age',
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       )),
    // );
    final height = TextFormField(
      autofocus: false,
      controller: _heightController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: 'Height in cm',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final weight = TextFormField(
      autofocus: false,
      controller: _weightController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (value == 0) {
          print('Please enter proper values');
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: 'Weight in kg',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final calculateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          double height = double.parse(_heightController.text) / 100;
          double weight = double.parse(_weightController.text);

          double heightSquare = height * height;
          double result = weight / heightSquare;
          _result = result;
          print(_result);
          setState(() {});
        },
        child: Text("Calculate",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
    final backButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WelcomePage()));
        },
        child: Text("Back",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
    final resultSection = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.redAccent,
        child: Text(
          _result == 0.0
              ? "Enter Value"
              : "BMI : ${_result.toStringAsFixed(4)}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.4,
            fontWeight: FontWeight.w500,
          ),
        ));
    // final diagnose = Material(
    //     elevation: 5,
    //     borderRadius: BorderRadius.circular(30),
    //     color: Colors.redAccent,
    //     child: Text(
    //       _bmi == 0
    //           ? "Enter values for BMI Calc"
    //           : "BMI : ${_result.toStringAsFixed(4)}",
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 19.4,
    //         fontWeight: FontWeight.w500,
    //       ),
    //     ));

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              genderField,
                              SizedBox(height: 10),
                              //dobField,
                              SizedBox(height: 10),
                              height,
                              SizedBox(height: 15),
                              weight,
                              SizedBox(height: 15),
                              calculateButton,
                              SizedBox(height: 15),
                              backButton,
                              SizedBox(height: 15),
                              resultSection,
                              // SizedBox(height: 15),
                              // diagnose,
                            ])),
                  ))),
            
        ));
  }

  void calculateBMI() {}
}
