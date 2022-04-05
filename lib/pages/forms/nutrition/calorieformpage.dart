import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../dashboard.dart';

class CalorieFormPage extends StatefulWidget {
  @override
  _CalorieFormPageState createState() => _CalorieFormPageState();
}

class _CalorieFormPageState extends State<CalorieFormPage> {
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
  int gender = 1;
  DateTime date = DateTime(1900);
  double _finalCalorie = 0;

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
        onPressed: calculateCalorie,
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
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        },
        child: Text("Back",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    // final Finalresult = Material(
    //     elevation: 5,
    //     child: MaterialButton(
    //       padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       onPressed: () {},
    //       minWidth: MediaQuery.of(context).size.width,
    //       child: Text(
    //         "For Maintaining Weight :" +
    //             (_finalCalorie).toStringAsFixed(4) +
    //             "\n\nFor mild weight loss(0.5 lb/week) :" +
    //             (_finalCalorie - 250).toStringAsFixed(4) +
    //             "\n\nFor weight loss(1lb/week) :" +
    //             (_finalCalorie - 500).toStringAsFixed(4) +
    //             "\n\nFor extreme weight loss(2lb/week) :" +
    //             (_finalCalorie - 1000).toStringAsFixed(4),
    //         style: TextStyle(
    //           color: Colors.black,
    //           fontSize: 19.4,
    //           fontWeight: FontWeight.w500,
    //         ),
    //       ),
    //     ));

    final Finalresult = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "For Maintaining Weight :" +
                (_finalCalorie).toStringAsFixed(4) +
                "\n\nFor mild weight loss(0.5 lb/week) :" +
                (_finalCalorie - 250).toStringAsFixed(4) +
                "\n\nFor weight loss(1lb/week) :" +
                (_finalCalorie - 500).toStringAsFixed(4) +
                "\n\nFor extreme weight loss(2lb/week) :" +
                (_finalCalorie - 1000).toStringAsFixed(4),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
              child: Container(
                  color: Colors.white,
                  child: Container(
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
                                backButton,
                                SizedBox(height: 15),
                                Finalresult
                              ])),
                    ),
                  ))),
        ));
  }

  void calculateCalorie() {
    double _height = double.parse(heightController.text);
    double _weight = double.parse(weightController.text);
    double _age = double.parse(ageController.text);
    double _BMR, _maintainence;
    _BMR = _maintainence = 0;
    if (gender == 1) {
      _BMR = 10 * _weight + 6.25 * _height - 5 * _age + 5;
    } else if (gender == 2) {
      _BMR = 10 * _weight + 6.25 * _height - 5 * _age - 161;
    }
    switch (valueForActivity) {
      case "Basal Metabollic Rate":
        {
          _maintainence = _BMR;
        }
        break;
      case "Sedentary: Little Or No Exercise":
        {
          _maintainence = _BMR * 1.22;
        }
        break;
      case "Light:Exercise 1-3times/week":
        {
          _maintainence = _BMR * 1.375;
        }
        break;
      case "Moderate:Exercise 4-5times/week":
        {
          _maintainence = _BMR * 1.465;
        }
        break;
      case "Active:Exercise 3-4times/week":
        {
          _maintainence = _BMR * 1.549;
        }
        break;
      case "Very Active:Exercise 6-7times/week":
        {
          _maintainence = _BMR * 1.725;
        }
        break;
      case "Extra Active:Very Intense Exercise Daily":
        {
          _maintainence = _BMR * 1.9;
        }
        break;
    }
    _finalCalorie = _maintainence;
    setState(() {});
  }
}
