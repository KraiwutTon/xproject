import 'package:flutter/material.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  final String title;

  const GamePage({super.key, required this.title});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final List<bool> _status = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  @override
  void initState() {
    super.initState();
    _setStatus();
  }

  List<int> _generateRandomNonDuplicates(int min, int max, int count) {
    if (count > max - min + 1) {
      throw ArgumentError(
          "Count must be less than or equal to the range size.");
    }

    List<int> result = [];
    Set<int> generatedNumbers = Set<int>();

    while (result.length < count) {
      int randomNumber = min + Random().nextInt(max - min + 1);
      if (!generatedNumbers.contains(randomNumber)) {
        generatedNumbers.add(randomNumber);
        result.add(randomNumber);
      }
    }

    return result;
  }

  void _setStatus() {
    List<int> randomNumbers = _generateRandomNonDuplicates(1, 9, 6);
    for (var number in randomNumbers) {
      setState(() {
        _status[number] = false;
      });
    }
  }

  void _functionCallback(int index) {
    setState(() {
      _status[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomButton(
                    status: _status[0],
                    functionCallback: () => {_functionCallback(0)},
                  ),
                  CustomButton(
                    status: _status[1],
                    functionCallback: () => {_functionCallback(1)},
                  ),
                  CustomButton(
                    status: _status[2],
                    functionCallback: () => {_functionCallback(2)},
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomButton(
                    status: _status[3],
                    functionCallback: () => {_functionCallback(3)},
                  ),
                  CustomButton(
                    status: _status[4],
                    functionCallback: () => {_functionCallback(4)},
                  ),
                  CustomButton(
                    status: _status[5],
                    functionCallback: () => {_functionCallback(5)},
                  ),
                  CustomButton(
                    status: _status[6],
                    functionCallback: () => {_functionCallback(6)},
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomButton(
                    status: _status[7],
                    functionCallback: () => {_functionCallback(7)},
                  ),
                  CustomButton(
                    status: _status[8],
                    functionCallback: () => {_functionCallback(8)},
                  ),
                  CustomButton(
                    status: _status[9],
                    functionCallback: () => {_functionCallback(9)},
                  )
                ],
              ),
            ]),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final bool status;
  final VoidCallback functionCallback;

  const CustomButton(
      {super.key, required this.status, required this.functionCallback});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: functionCallback,
      elevation: 2.0,
      fillColor: status ? Colors.white : Colors.red,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
    );
  }
}
