import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../dashboard.dart';
import 'dart:math';

class BodyFatFormPage extends StatefulWidget {
  @override
  _BodyFatFormPageState createState() => _BodyFatFormPageState();
}

class _BodyFatFormPageState extends State<BodyFatFormPage> {
  final _formKey = GlobalKey<FormState>();
  String res = "Result";
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController heightController = new TextEditingController();
  final TextEditingController weightController = new TextEditingController();
  final TextEditingController neckController = new TextEditingController();
  final TextEditingController waistController = new TextEditingController();
  int gender = 1;
  double bfp = 0.0;
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
    final dobField = TextFormField(
      autofocus: false,
      controller: ageController,
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
          labelText: 'Enter Age',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final height = TextFormField(
      autofocus: false,
      controller: heightController,
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
      controller: weightController,
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
          labelText: 'Weight in kg',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    // final neck = TextFormField(
    //   autofocus: false,
    //   controller: neckController,
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
    //       labelText: 'Neck in cm',
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       )),
    // );
    // final waist = TextFormField(
    //   autofocus: false,
    //   controller: waistController,
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
    //       labelText: 'Waist in cm',
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       )),
    // );
    final calculateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (gender == 1) {
            print("ho ho");
            print(gender);
            double height = double.parse(heightController.text) / 100;
            double weight = double.parse(weightController.text);
            double age = double.parse(ageController.text);
            double heightt = height * height;
            double bmi = weight / (heightt);
            double bf = 0.0;
            if (age >= 1 && age < 18) {
              bf = 1.51 * bmi - 0.70 * age + 1.4;
            } else {
              bf = 1.20 * bmi + 0.23 * age - 16.2;
            }
            //double bf = (495 / (1.0324 - 0.19077 * log(waist - neck) +  0.15456 * log(height))) - 450;
            bfp = bf;
            print(bfp);
            setState(() {});
          } else {
            print("ho ho");
            print(gender);
            double height = double.parse(heightController.text) / 100;
            double weight = double.parse(weightController.text);
            double age = double.parse(ageController.text);
            double heightt = height * height;
            double bmi = weight / (heightt);
            double bf = 0.0;
            if (age >= 1 && age < 18) {
              bf = 1.51 * bmi - 0.70 * age - 2.2;
            } else {
              bf = 1.20 * bmi + 0.23 * age - 5.4;
            }
            //double bf = (495 / (1.0324 - 0.19077 * log(waist - neck) +  0.15456 * log(height))) - 450;
            bfp = bf;
            print(bfp);
            if (bfp < 2.0) {
              res = "Very Less Fat";
            }
            ;
            if (bfp > 2.0 && bfp < 6.0) {
              res = "Essential";
            }
            ;
            if (bfp > 6.0 && bfp < 14.0) {
              res = "Athletes";
            }
            ;
            if (bfp > 14.0 && bfp < 18.0) {
              res = "Fitness";
            }
            ;
            if (bfp > 18.0 && bfp < 25.0) {
              res = "Average";
            }
            ;
            if (bfp > 25.0) {
              res = "Obese";
            }
            ;
            setState(() {});
          }
        },
        child: Text("Calculate", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final resultSection = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: MaterialButton(
            onPressed: () {},
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Text(
              bfp == null ? "Enter Value" : "BFP : $bfp",
              style: TextStyle(
                color: Color.fromRGBO(61, 96, 152, 1),
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            )));
    final resul = Material(
        elevation: 5,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () {},
          minWidth: MediaQuery.of(context).size.width,
          child: Text(
            bfp == null ? "Enter Value" : "${res}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 19.4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
    final navbar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Color.fromRGBO(61, 96, 152, 1),
        tooltip: 'Menu Icon',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "BodyFat Calculator",
        style: TextStyle(
          fontSize: 23,
          color: Color.fromRGBO(61, 96, 152, 1),
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
    );
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: navbar,
        body: Center(
          child: SingleChildScrollView(
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                        key: _formKey,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                          genderField,
                          SizedBox(height: 10),
                          dobField,
                          SizedBox(height: 10),
                          height,
                          SizedBox(height: 15),
                          weight,
                          // SizedBox(height: 15),
                          // neck,
                          // SizedBox(height: 15),
                          // waist,
                          SizedBox(height: 15),
                          calculateButton,
                          SizedBox(height: 15),
                          resultSection,
                          SizedBox(height: 15),
                          // resul,
                        ])),
                  ))),
        ));
  }
}
