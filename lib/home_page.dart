import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController inputOne = TextEditingController();
  TextEditingController inputTwo = TextEditingController();

  String weight = '';
  String height = '';
  bool widgetVisible = false;
  String text = '';

  void showWidget() {
    setState(() {
      widgetVisible = true;
      weight = inputOne.text;
      height = inputTwo.text;
      double w = double.parse(weight);
      double h = double.parse(height);
      h = h / 100;
      double bmi = w / (h * h);
      if (bmi < 18.5) {
        text =
            'You Are Underweight\n BMI ${double.parse(bmi.toStringAsFixed(1))}';
      } else if (bmi >= 18.5 && bmi <= 25.5) {
        text = 'You Are Healthy\n BMI ${double.parse(bmi.toStringAsFixed(1))}';
      } else {
        text =
            'You Are Over Weight\n BMI ${double.parse(bmi.toStringAsFixed(1))}';
      }
    });
  }

  void hideWidget() {
    setState(() {
      widgetVisible = false;
      inputOne.clear();
      inputTwo.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: Text('BMI calculator'),
        backgroundColor: Colors.deepPurple.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: inputOne,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.balance),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2),
                        borderRadius: BorderRadius.circular(25)),
                    hintText: "Enter your Weight (kg)"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextField(
                  controller: inputTwo,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.align_vertical_bottom_rounded),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepPurple, width: 2),
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Enter your Height (cm)"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.all(15),
                            backgroundColor: Colors.red.shade400,
                            foregroundColor: Colors.amber),
                        onPressed: showWidget,
                        child: Text(
                          'Show Result',
                          style: TextStyle(color: Colors.white),
                        )),
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.all(15),
                            backgroundColor: Colors.red.shade400,
                            foregroundColor: Colors.amber),
                        onPressed: hideWidget,
                        child: Text(
                          'Clear Result',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: widgetVisible,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepPurple.shade700,
                              offset: Offset(10, 10),
                              blurRadius: 10,
                              spreadRadius: 10,
                              blurStyle: BlurStyle.outer)
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 45.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.message,
                                size: 50,
                                color: Colors.deepPurple,
                              ),
                              Text(
                                'Your Result :',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          text,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.white,
                            color: Colors.purple.shade100,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
