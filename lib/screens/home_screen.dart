import 'dart:math';

import 'package:bmi_app/color/colors.dart';
import 'package:bmi_app/screens/ResultScreen.dart';
import 'package:bmi_app/widget/gender_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double height = 180.0;
  int age = 20;
  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      appBar: AppBar(
        backgroundColor: darker,
        title: Text(
          'BMI  CALCULATOR',
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                GenderContainer(
                  txt: 'male',
                  isMale: isMale,
                  ontap: () {
                    isMale = true;
                    setState(() {});
                  },
                ),
                GenderContainer(
                  txt: 'female',
                  isMale: isMale,
                  ontap: () {
                    isMale = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: dark,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.round().toString(),
                        style: TextStyle(
                          color: white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(color: lightGrey, fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 100.0,
                    max: 220.0,
                    onChanged: (value) {
                      height = value;
                      setState(() {});
                    },
                    activeColor: red,
                    inactiveColor: lightGrey,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: dark,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            color: white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            color: white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove, color: red),
                              onPressed: () {
                                if (age > 0) {
                                  age--;
                                  setState(() {});
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add, color: red),
                              onPressed: () {
                                age++;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: dark,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            color: white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            color: white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove, color: red),
                              onPressed: () {
                                if (weight > 0) {
                                  weight--;
                                  setState(() {});
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add, color: red),
                              onPressed: () {
                                weight++;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0,top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    result: weight / pow(height / 100, 2),
                    
                  ),
                ));
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
          ),],
      ),
    );
  }
}
