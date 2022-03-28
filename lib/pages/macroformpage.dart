import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'homepage.dart';

class MacroFormPage extends StatefulWidget {
  @override
  _MacroFormPageState createState() => _MacroFormPageState();
}

class _MacroFormPageState extends State<MacroFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController heightController = new TextEditingController();
  final TextEditingController weightController = new TextEditingController();
  List activityList = [
    "Basal Metabollic Rate",
    "Sedentary: Little Or No Exercise",
    "Light:Exercise 1-3times/week",
    "Moderate:Exercise 4-5times/week",
    "Active:Exercise 3-4times/week",
    "Very Active:Exercise 6-7times/week",
    "Extra Active:Very Intense Exercise Daily"
  ];
  String valueForActivity = "Basal Metabollic Rate";
  List goalList = [
    "Maintain Weight",
    "Mild Weight Loss 0.5lb/week",
    "Weight Loss 1lb/week",
    "Extreme Weight Loss 2lb/week",
    "Mild Weight Gain 0.5lb/week",
    "Weight Gain 1lb/week",
    "Extreme Weight Gain 2lb/week"
  ];
  String valueForGoal = "Maintain Weight";
  int gender = 1;
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
    final goal = Container(
      child: DropdownButton(
        value: valueForGoal.isNotEmpty ? valueForGoal : null,
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
            valueForGoal = newValue as String;
          });
        },
        items: goalList.map((valueItem) {
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
        onPressed: () {},
        child: Text("Calculate", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
        },
        child: Text("Back", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
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
                          goal,
                          SizedBox(height: 15),
                          calculateButton,
                          SizedBox(height: 15),
                          backButton,
                        ])),
                  ))),
        ));
  }
}
