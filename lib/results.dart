// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unnecessary_string_interpolations, must_be_immutable, prefer_adjacent_string_concatenation
import 'package:flutter/material.dart';
import 'package:myapp/formula.dart';
import 'package:share/share.dart';

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
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              icon: Icon(Icons.share_outlined),
              onPressed: () {
                Share.share("My BMI Result is" + " ${bmiResults.toStringAsFixed(1)}");
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI RESULTS',
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            Text(
              "Your BMI Result is" + " ${bmiResults.toStringAsFixed(1)}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
