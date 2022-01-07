import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDieValue = Random().nextInt(6) + 1;
  int rightDieValue = Random().nextInt(6) + 1;

  rollDie() {
    return Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      leftDieValue = rollDie();
                    });
                  },
                  child: Image.asset('images/dice$leftDieValue.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      rightDieValue = rollDie();
                    });
                  },
                  child: Image.asset('images/dice$rightDieValue.png'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Total Value: ${ leftDieValue + rightDieValue}',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                leftDieValue = rollDie();
                rightDieValue = rollDie();
              });
            },
            backgroundColor: Colors.white,
            child: Icon(
              Icons.refresh,
              color: Colors.red,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
