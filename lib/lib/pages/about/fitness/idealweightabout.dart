import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../dashboard.dart';

class IdealWeightAbout extends StatefulWidget {
  @override
  _IdealWeightAboutState createState() => _IdealWeightAboutState();
}

class _IdealWeightAboutState extends State<IdealWeightAbout> {
  @override
  Widget build(BuildContext context) {
    final mainabout = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Ideal Weight',
          style: TextStyle(
            color: Color.fromRGBO(240, 75, 76, 1),
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Most everyone has at some point tried to lose weight, or at least known somebody who has. This is largely due to the perception of an "ideal" body weight, which is often based on what we see promoted through various media such as social media, TV, movies, magazines, etc. Although ideal body weight (IBW) today is sometimes based on perceived visual appeal, IBW was actually introduced to estimate dosages for medical use, and the formulas that calculate it are not at all related to how a person looks at a given weight. It has since been determined that the metabolism of certain drugs is more based on IBW than it is total body weight. Today, IBW is also used widely throughout sports, since many sports classify people based on their body weight.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
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
        "Ideal Weight",
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
        backgroundColor: Color.fromRGBO(33, 49, 89, 1),
        appBar: navbar,
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          mainabout,
        ])))));
  }
}
