// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unnecessary_string_interpolations, must_be_immutable, prefer_adjacent_string_concatenation
import 'package:flutter/material.dart';
import 'package:myapp/formula.dart';
import 'package:share/share.dart';
import 'package:hexcolor/hexcolor.dart';

class ResultsPage extends StatefulWidget {
  int weight;
  int height;
  int age;
  double cal = 0;
  ResultsPage({required this.height, required this.weight, required this.age});
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  Logic logic = Logic();
  double bmiResults = 0;

  @override
  void initState() {
    bmiResults = logic.calculate(widget.height, widget.weight);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#141414'),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: HexColor('#111111'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              icon: Icon(Icons.share_outlined),
              onPressed: () {
                Share.share(
                    "My BMI Result is" + " ${bmiResults.toStringAsFixed(2)}");
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your BMI Result is ',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " ${bmiResults.toStringAsFixed(2)}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 65,
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
           if(bmiResults < 18.5) ... [
             Text(
              'You are Underweight! Get some healthy diet',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
           ] else if(bmiResults  < 25) ... [
              Text(
              'Yay ! You body is fine',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
           ] else if(bmiResults  < 30) ... [
              Text(
              'You are overweight! Start doing some exercise',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
           ] else ... [
              Text(
              'You are obese !! Get some exercise',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
           ],
          ],
        ),
      ),
    );
  }
}
