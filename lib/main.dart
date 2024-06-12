import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(LoveCalculatorApp());
}

class LoveCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LoveCalculatorHomePage(),
    );
  }
}

class LoveCalculatorHomePage extends StatefulWidget {
  @override
  _LoveCalculatorHomePageState createState() => _LoveCalculatorHomePageState();
}

class _LoveCalculatorHomePageState extends State<LoveCalculatorHomePage> {
  final TextEditingController nameController1 = TextEditingController();
  final TextEditingController nameController2 = TextEditingController();
  String resultText = '';

  void calculateLove() {
    if (nameController1.text.isEmpty || nameController2.text.isEmpty) {
      setState(() {
        resultText = 'Please enter both names!';
      });
      return;
    }
    final Random random = Random();
    final int lovePercentage = random.nextInt(101);
    setState(() {
      resultText = '$lovePercentage%';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love Calculator'),
        backgroundColor: Colors.pink,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/LOVE.jpg',
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.3),
            colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Love Calculator',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nameController1,
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    labelStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    filled: true,
                    fillColor: Colors.red.withOpacity(0.3),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nameController2,
                  decoration: InputDecoration(
                    labelText: 'Their Name',
                    labelStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    filled: true,
                    fillColor: Colors.red.withOpacity(0.3),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateLove,
                  child: Text('Calculate Love'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Updated property
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  resultText,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
