import 'dart:math';

import 'package:bmicalculator/constant.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainPage> {
  int weight = 120;
  int height = 220;
  late double bmi = calculateBMI(height: height, weight: weight);

  String gender = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Male");
                      setState(() {
                        gender = 'M';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: gender == 'M'
                            ? Colors.blue.withAlpha(150)
                            : Colors.blue.withAlpha(50),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      height: 200,
                      width: 175,
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.male, size: 150),
                          Text("Male"),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      print("Female");
                      setState(() {
                        gender = 'F';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: gender == 'F'
                            ? Colors.blue.withAlpha(150)
                            : Colors.blue.withAlpha(50),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      height: 200,
                      width: 175,
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.female, size: 150),
                          Text("Female"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Height"),
                        Text("$height", style: kdesignlabel),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 50) height--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                                print(height);
                              },
                              child: Icon(
                                Icons.remove,
                                size: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 220) height++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 50,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Weight"),
                        Text("$weight", style: kdesignlabel),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 20) weight--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                                print(weight);
                              },
                              child: Icon(
                                Icons.remove,
                                size: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight < 130) weight++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                                print(weight);
                              },
                              child: Icon(
                                Icons.add,
                                size: 50,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Text(
                    "BMI",
                  ),
                  Text(
                    "${bmi.toStringAsFixed(2)}",
                    style: kdesignlabel,
                  ),
                  Text(getResult(bmi)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  static String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return 'Overweight';
    } else {
      return 'Underweight';
    }
  }
}
