// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:xproject/mode.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.landscapeRight,
//     ]);
//     return MaterialApp(
//       title: 'Xproject',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: const Text('Play'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const ModePage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// dart
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Dot Grid'),
        ),
        body: Center(
          child: RandomDotGrid(),
        ),
      ),
    );
  }
}

class RandomDotGrid extends StatefulWidget {
  @override
  _RandomDotGridState createState() => _RandomDotGridState();
}

class _RandomDotGridState extends State<RandomDotGrid> {
  int gridSize = 10; // 10x10 grid
  int dotX = 0;
  int dotY = 0;

  void _generateRandomPosition() {
    final random = Random();
    setState(() {
      dotX = random.nextInt(gridSize);
      dotY = random.nextInt(gridSize);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _generateRandomPosition,
          child: Text('Generate Random Dot'),
        ),
        SizedBox(height: 16), // Spacer
        CustomPaint(
          size: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.6, // Adjust height as needed
          ),
          painter: DotGridPainter(gridSize, dotX, dotY),
        ),
      ],
    );
  }
}

class DotGridPainter extends CustomPainter {
  final int gridSize;
  final int dotX;
  final int dotY;

  DotGridPainter(this.gridSize, this.dotX, this.dotY);

  @override
  void paint(Canvas canvas, Size size) {
    final cellSize = size.width / gridSize;
    final dotSize = cellSize; // Make dot size equal to cell size

    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final dotXOffset = dotX * cellSize;
    final dotYOffset = dotY * cellSize;

    canvas.drawRect(
      Rect.fromPoints(
        Offset(dotXOffset, dotYOffset),
        Offset(dotXOffset + dotSize, dotYOffset + dotSize),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
