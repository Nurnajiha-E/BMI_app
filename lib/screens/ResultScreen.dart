import 'package:bmi_app/color/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});
  final double result; // Example BMI result

  String get healthiness {
    String healthinessString;
    if (result < 18.5) {
      healthinessString = "Underweight";
    } else if (result <= 24.9) {
      healthinessString = "Normal";
    } else if (result <= 29.9) {
      healthinessString = "Overweight";
    } else if (result <= 34.9) {
      healthinessString = "Obose";
    } else {
      healthinessString = "Exstreme Obese";
    }
    return healthinessString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 30, 51, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(10, 14, 33, 1),
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                'Result Screen',
                style: TextStyle(color: Colors.white, fontSize: 24,),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(17, 17, 40, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your BMI is:',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  Text(
                    result.toStringAsFixed(2),
                    style: TextStyle(color: red, fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Healthiness: $healthiness',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
              style: ElevatedButton.styleFrom(
                
                backgroundColor: red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              ),
              child: Text(
                'Calculate',
                style: TextStyle(
                  color: white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
