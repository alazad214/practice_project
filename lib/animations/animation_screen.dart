import 'package:flutter/material.dart';

class AnimatedWidgetExample extends StatefulWidget {
  const AnimatedWidgetExample({super.key});

  @override
  AnimatedWidgetExampleState createState() => AnimatedWidgetExampleState();
}

class AnimatedWidgetExampleState extends State<AnimatedWidgetExample> {
  bool _isVisible = true; // To toggle the visibility

  // Method to toggle the visibility of the widget
  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible; // Toggle the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Animation Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedOpacity widget
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0, // Fade in or fade out
              duration: Duration(seconds: 1), // Animation duration
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(
                    child: Text("Hello!",
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleVisibility,
              child: Text("Toggle Visibility"),
            ),
          ],
        ),
      ),
    );
  }
}
