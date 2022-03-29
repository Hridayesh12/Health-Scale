import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../dashboard.dart';

class IdlWtFormPage extends StatefulWidget {
  @override
  _IdlWtFormPageState createState() => _IdlWtFormPageState();
}

class _IdlWtFormPageState extends State<IdlWtFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController heightController = new TextEditingController();
  int gender = 1;
  double _ideal = 0.0;
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
    final calculateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (gender == 1) {
            double height = double.parse(heightController.text) * 0.03937;
            print(height);
            double age = double.parse(ageController.text);
            if (height > 5) {
              _ideal = 50 + 2.3 * (height - 5);
            } else {
              _ideal = 50.0;
            }
            //double bf = (495 / (1.0324 - 0.19077 * log(waist - neck) +  0.15456 * log(height))) - 450;
            setState(() {});
          } else {
            double height = double.parse(heightController.text) * 0.03937;
            double age = double.parse(ageController.text);
            if (height > 5) {
              _ideal = 45.5 + 2.3 * (height - 5);
            } else {
              _ideal = 45.5;
            }
            //double bf = (495 / (1.0324 - 0.19077 * log(waist - neck) +  0.15456 * log(height))) - 450;
            setState(() {});
          }
        },
        child: Text("Calculate", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final resultSection = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.redAccent,
        child: Text(
          _ideal == 0.0 ? "Enter Value" : "Ideal weight : ${_ideal.toStringAsFixed(4)}",
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
                          calculateButton,
                          SizedBox(height: 15),
                          resultSection,
                        ])),
                  ))),
        ));
  }
}
