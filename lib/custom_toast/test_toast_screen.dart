import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class TestToastScreen extends StatelessWidget {
  const TestToastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Toast'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Toastification().show(
                    title: Text('This is toast!!'),
                    type: ToastificationType.success,
                    description: Text(
                      'This is toast description!!',
                    ),
                  );
                },
                child: Text('Toast')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Toastification().show(
                      title: Text('This is toast!!'),
                      description: Text('This is toast description!!'),
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.amber,
                      ));
                },
                child: Text('Toast')),
          ],
        ),
      ),
    );
  }
}
