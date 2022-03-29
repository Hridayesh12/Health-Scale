import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../dashboard.dart';

class BmrFormPage extends StatefulWidget {
  @override
  _BmrFormPageState createState() => _BmrFormPageState();
}

class _BmrFormPageState extends State<BmrFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  int gender = 1;
  double _bmr = 0.0;
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
      controller: _ageController,
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
          if (gender == 1) {
            print("ho ho");
            print(gender);
            double height = double.parse(_heightController.text);
            double weight = double.parse(_weightController.text);
            double age = double.parse(_ageController.text);
            double bmr = 10.0 * weight + 6.25 * height - 5 * age + 5;
            _bmr = bmr;
            print(_bmr);
            setState(() {});
          } else {
            print("are you approaching me");
            print(gender);
            double height = double.parse(_heightController.text);
            double weight = double.parse(_weightController.text);
            double age = double.parse(_ageController.text);
            print(height);
            print(weight);
            print(age);
            double bmr = 10.0 * weight + 6.25 * height - 5 * age - 161;
            _bmr = bmr;
            print(_bmr);
            setState(() {});
          }
          print(gender);
        },
        child: Text("Calculate", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
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
    final resultSection = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.redAccent,
        child: Text(
          _bmr == null ? "Enter Value" : "BMR : $_bmr",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.4,
            fontWeight: FontWeight.w500,
          ),
        ));
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
                          calculateButton,
                          SizedBox(height: 15),
                          resultSection,
                        ])),
                  ))),
        ));
  }
}
