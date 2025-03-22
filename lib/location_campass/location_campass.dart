import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

class CompassScreen extends StatefulWidget {
  const CompassScreen({super.key});

  @override
  CompassScreenState createState() => CompassScreenState();
}

class CompassScreenState extends State<CompassScreen> {
  double? _heading;

  @override
  void initState() {
    super.initState();
    _startCompass();
  }

  void _startCompass() {
    FlutterCompass.events?.listen((CompassEvent event) {
      setState(() {
        _heading = event.heading;
      });
    });
  }

  String _getDirection(double heading) {
    List<String> directions = [
      "North",
      "North-North-East",
      "North-East",
      "East-North-East",
      "East",
      "East-South-East",
      "South-East",
      "South-South-East",
      "South",
      "South-South-West",
      "South-West",
      "West-South-West",
      "West",
      "West-North-West",
      "North-West",
      "North-North-West"
    ];
    int index = ((heading + 11.25) ~/ 22.5) % 16;
    return directions[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Compass Direction Text
              Text(
                _heading != null ? _getDirection(_heading!) : 'Waiting...',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),

              // Compass UI
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepOrange,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 280,
                      height: 280,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent
                                .withAlpha((0.2 * 255).toInt()),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: CustomPaint(
                        painter: CompassDialPainter(),
                      ),
                    ),

                    Transform.rotate(
                      angle:
                          _heading == null ? 0 : -(_heading! * (math.pi / 180)),
                      child: Column(
                        children: [
                          Icon(Icons.navigation, size: 45, color: Colors.blue),
                          Container(
                            width: 5,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Degree Text
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.amberAccent, shape: BoxShape.circle),
                        child: Text(
                          _heading != null
                              ? '${_heading!.toStringAsFixed(0)}°'
                              : '0°',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompassDialPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint tickPaint = Paint()
      ..color = Colors.white.withAlpha((0.6 * 255).toInt())
      ..strokeWidth = 2;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    for (int i = 0; i < 360; i += 15) {
      final double angle = (i * math.pi) / 180;
      final double startX = centerX + (radius - 15) * math.cos(angle);
      final double startY = centerY + (radius - 15) * math.sin(angle);
      final double endX = centerX + radius * math.cos(angle);
      final double endY = centerY + radius * math.sin(angle);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), tickPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
