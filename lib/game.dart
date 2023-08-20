import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final String title;

  const GamePage({super.key, required this.title});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _status = false;

  void _functionCallback() {
    setState(() {
      _status = !_status;
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
            CustomButton(status: _status, functionCallback: _functionCallback,)
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final bool status;
  final VoidCallback functionCallback;

  const CustomButton({super.key, required this.status, required this.functionCallback});

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
