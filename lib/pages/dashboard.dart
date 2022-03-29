import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'forms/fitness/bmiformpage.dart';
import 'forms/fitness/bmrformpage.dart';
import 'forms/fitness/bodyfatformpage.dart';
import 'forms/fitness/tdeeformpage.dart';
import 'forms/fitness/idealweightformpage.dart';
import 'forms/nutrition/macroformpage.dart';
import 'forms/nutrition/calorieformpage.dart';
import 'forms/nutrition/proteinform.dart';
import 'forms/nutrition/carbformpage.dart';
import 'forms/nutrition/fatintformpage.dart';
import 'about/fitness/bmrabout.dart';
import 'about/fitness/bmiabout.dart';
import 'about/fitness/bodyfatabout.dart';
import 'about/fitness/tdeeabout.dart';
import 'about/fitness/idealweightabout.dart';
import 'about/nutrition/calorieabout.dart';
import 'about/nutrition/carbabout.dart';
import 'about/nutrition/fatintabout.dart';
import 'about/nutrition/macroabout.dart';
import 'about/nutrition/proteinabout.dart';
import 'aboout.dart';

class Dashboard extends StatefulWidget {
  Dashboard({key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String bmi = "bmi";
  String cal = "cal";
  String macro = "macro";
  String ideal = "ideal";
  String body_fat = "body_fat";
  @override
  Widget build(BuildContext context) {
    double appbar_height = MediaQuery.of(context).size.height * 0.1;
    double column_height = MediaQuery.of(context).size.height * 0.9;
    double div1_height = MediaQuery.of(context).size.height * 0.45;
    double div2_height = MediaQuery.of(context).size.height * 0.45;
    double text_height = MediaQuery.of(context).size.height * 0.15;
    double slider_height = MediaQuery.of(context).size.height * 0.25;
    final fitnessText = Container(
        height: text_height,
        child: Row(children: <Widget>[
          SizedBox(width: 20),
          Container(
            child: Text(
              "FITNESS",
              style: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(61, 96, 152, 1),
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
          )
        ]));
    final fitnessSlider = ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: <Widget>[
      CarouselSlider(
        options: CarouselOptions(
          height: slider_height,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        items: [
          Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(33, 49, 89, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'BMI',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BmiFormPage()));
                      },
                      child: new Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromRGBO(240, 75, 76, 1),
                          ),
                          child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 18.0)))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BmiFormAbout()));
                      },
                      icon: const Icon(Icons.info, color: Colors.white),
                      tooltip: 'More Info',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(240, 75, 76, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'BMR',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BmrFormPage()));
                      },
                      child: new Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromRGBO(33, 49, 89, 1),
                          ),
                          child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 18.0)))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BmrFormAbout()));
                      },
                      icon: const Icon(Icons.info, color: Colors.white),
                      tooltip: 'More Info',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(33, 49, 89, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'BODY FAT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BodyFatFormPage()));
                      },
                      child: new Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromRGBO(240, 75, 76, 1),
                          ),
                          child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 18.0)))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BodyFatAbout()));
                      },
                      icon: const Icon(Icons.info, color: Colors.white),
                      tooltip: 'More Info',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(240, 75, 76, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'IDEAL WEIGHT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => IdlWtFormPage()));
                      },
                      child: new Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromRGBO(33, 49, 89, 1),
                          ),
                          child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 18.0)))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => IdealWeightAbout()));
                      },
                      icon: const Icon(Icons.info, color: Colors.white),
                      tooltip: 'More Info',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(33, 49, 89, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'TDEE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TdeeFormPage()));
                      },
                      child: new Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromRGBO(240, 75, 76, 1),
                          ),
                          child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 18.0)))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TdeeFormAbout()));
                      },
                      icon: const Icon(Icons.info, color: Colors.white),
                      tooltip: 'More Info',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ]);

    final nutritionText = Container(
        height: text_height,
        child: Row(children: <Widget>[
          SizedBox(width: 20),
          Container(
            child: Text(
              "NUTRITION",
              style: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(61, 96, 152, 1),
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
          )
        ]));
    final nutritionSlider = ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: <Widget>[
      CarouselSlider(
        options: CarouselOptions(
          height: slider_height,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          reverse: true,
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          viewportFraction: 0.8,
        ),
        items: [
          Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(240, 75, 76, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'CALORIE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CalorieFormPage()));
                      },
                      child: new Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromRGBO(33, 49, 89, 1),
                          ),
                          child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 18.0)))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CalorieAbout()));
                      },
                      icon: const Icon(Icons.info, color: Colors.white),
                      tooltip: 'More Info',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color.fromRGBO(33, 49, 89, 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'MACRO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MacroFormPage()));
                      },
                      child: new Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromRGBO(240, 75, 76, 1),
                          ),
                          child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 18.0)))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MacroAbout()));
                      },
                      icon: const Icon(Icons.info, color: Colors.white),
                      tooltip: 'More Info',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(240, 75, 76, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'PROTEIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProteinFormPage()));
                      },
                      child: new Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromRGBO(33, 49, 89, 1),
                          ),
                          child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 18.0)))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProteinAbout()));
                      },
                      icon: const Icon(Icons.info, color: Colors.white),
                      tooltip: 'More Info',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color.fromRGBO(33, 49, 89, 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'CARBOHYDRATES',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CarbFormPage()));
                      },
                      child: new Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromRGBO(240, 75, 76, 1),
                          ),
                          child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 18.0)))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CarbAbout()));
                      },
                      icon: const Icon(Icons.info, color: Colors.white),
                      tooltip: 'More Info',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(240, 75, 76, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'FAT INTAKE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FatIntFormPage()));
                      },
                      child: new Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromRGBO(33, 49, 89, 1),
                          ),
                          child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 18.0)))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FatIntAbout()));
                      },
                      icon: const Icon(Icons.info, color: Colors.white),
                      tooltip: 'More Info',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
    final navigation = AppBar(
      toolbarHeight: appbar_height,
      title: Text(
        "Health Scale",
        style: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'About Health Scale',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Aboout())); // handle the press
            },
          ),
        ),
      ],
      backgroundColor: Color.fromRGBO(61, 96, 152, 1),
    );
    final fitnessContainer = Container(
        height: div1_height,
        color: Colors.white,
        child: Column(children: <Widget>[
          fitnessText,
          fitnessSlider,
        ]));
    final nutritionContainer = Container(
        height: div2_height,
        color: Colors.white,
        child: Column(children: <Widget>[
          nutritionText,
          nutritionSlider,
        ]));
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: navigation,
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    height: column_height,
                    color: Colors.yellow,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      fitnessContainer,
                      nutritionContainer,
                    ])))));
  }
}
