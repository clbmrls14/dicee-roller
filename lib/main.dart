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
  int modifiedTotal = 0;

  TextEditingController modifierController = TextEditingController();

  rollDie() {
    return Random().nextInt(6) + 1;
  }

  getModifiedTotal() {
    if (!modifierController.text.contains(new RegExp(r'[0-9]'))) {
      modifierController.text = '0';
    }
      return leftDieValue + rightDieValue + int.parse(modifierController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Modifier: ',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  controller: modifierController,
                  cursorColor: Colors.red.shade900,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.red.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
              'Total Value: ${getModifiedTotal()}',
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
