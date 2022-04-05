import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../dashboard.dart';

class TdeeFormPage extends StatefulWidget {
  @override
  _TdeeFormPageState createState() => _TdeeFormPageState();
}

class _TdeeFormPageState extends State<TdeeFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController heightController = new TextEditingController();
  final TextEditingController weightController = new TextEditingController();
  List activityList = [
    "Basal Metabollic Rate",
    "Sedentary: Little Or No Exercise",
    "Light:Exercise 1-3times/week",
    "Moderately Active:Exercise 4-5times/week",
    "Very Active:Exercise 6-7times/week",
    "Extra Active:Very Intense Exercise Daily"
  ];
  String valueForActivity = "Basal Metabollic Rate";
  // List goalList = [
  //   "Maintain Weight",
  //   "Mild Weight Loss 0.5lb/week",
  //   "Weight Loss 1lb/week",
  //   "Extreme Weight Loss 2lb/week",
  //   "Mild Weight Gain 0.5lb/week",
  //   "Weight Gain 1lb/week",
  //   "Extreme Weight Gain 2lb/week"
  // ];
  // String valueForGoal = "Maintain Weight";
  int gender = 1;
  double _bmr = 0.0;
  double _tdee = 0.0;
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
    final activity = Container(
      child: DropdownButton(
        value: valueForActivity.isNotEmpty ? valueForActivity : null,
        hint: Text("Choose One Activity"),
        dropdownColor: Colors.lightBlue.shade200,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 17,
        isExpanded: true,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        onChanged: (newValue) {
          setState(() {
            valueForActivity = newValue as String;
          });
        },
        items: activityList.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      ),
    );

    final calculateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (gender == 1) {
            double height = double.parse(heightController.text);
            double weight = double.parse(weightController.text);
            double age = double.parse(ageController.text);
            double bmr = 10.0 * weight + 6.25 * height - 5 * age + 5;
            _bmr = bmr;
            print(_bmr);
            print(valueForActivity);
            if (valueForActivity == "Basal Metabollic Rate") {
              _tdee = 0.0;
            } else if (valueForActivity == "Sedentary: Little Or No Exercise") {
              _tdee = bmr * 1.2;
              print(_tdee);
            } else if (valueForActivity == "Light:Exercise 1-3times/week") {
              _tdee = bmr * 1.375;
              print(_tdee);
            } else if (valueForActivity == "Moderately Active:Exercise 4-5times/week") {
              _tdee = bmr * 1.55;
              print(_tdee);
            } else if (valueForActivity == "Very Active:Exercise 6-7times/week") {
              _tdee = bmr * 1.725;
              print(_tdee);
            } else {
              _tdee = bmr * 1.9;
              print(_tdee);
            }
            setState(() {});
          } else {
            double height = double.parse(heightController.text);
            double weight = double.parse(weightController.text);
            double age = double.parse(ageController.text);
            print(height);
            print(weight);
            print(age);
            double bmr = 10.0 * weight + 6.25 * height - 5 * age - 161;
            _bmr = bmr;
            print(_bmr);
            print(valueForActivity);
            if (valueForActivity == "Basal Metabollic Rate") {
              _tdee = 0.0;
            } else if (valueForActivity == "Sedentary: Little Or No Exercise") {
              _tdee = bmr * 1.2;
              print(_tdee);
            } else if (valueForActivity == "Light:Exercise 1-3times/week") {
              _tdee = bmr * 1.375;
              print(_tdee);
            } else if (valueForActivity == "Moderately Active:Exercise 4-5times/week") {
              _tdee = bmr * 1.55;
              print(_tdee);
            } else if (valueForActivity == "Very Active:Exercise 6-7times/week") {
              _tdee = bmr * 1.725;
              print(_tdee);
            } else {
              _tdee = bmr * 1.9;
              print(_tdee);
            }
            setState(() {});
          }
          print(gender);
        },
        child: Text("Calculate", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final resultSection = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.redAccent,
        child: Text(
          _tdee == 0.0 ? "Enter Value" : "The estimated TDEE or body weight maintenance energy requirement is ${_tdee.toStringAsFixed(4)} Calories per day.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.4,
            fontWeight: FontWeight.w500,
          ),
        ));
    final navbar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        tooltip: 'Menu Icon',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
        },
      ),
      title: Text(
        "Health Scale",
        style: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color.fromRGBO(61, 96, 152, 1),
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
                          SizedBox(height: 15),
                          activity,
                          SizedBox(height: 15),
                          calculateButton,
                          SizedBox(height: 15),
                          resultSection,
                        ])),
                  ))),
        ));
  }
}
