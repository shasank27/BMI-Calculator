import 'package:flutter/material.dart';

class FinalPage extends StatelessWidget {
  FinalPage({this.Bmi, this.Messag, this.Weight});

  final String Weight;
  final String Bmi;
  final String Messag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculaor'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(top: 15),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFF1E1B31),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Weight.toUpperCase(),
                      style: TextStyle(color: Color(0xFF24D876), fontSize: 22),
                    ),
                    Text(
                      Bmi,
                      style:
                          TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      Messag,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              height: 55,
              width: double.infinity,
              color: Color(0xFFF83058),
            ),
          ],
        ));
  }
}
