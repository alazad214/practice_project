import 'package:flutter/material.dart';

class QuizInstructionScreen extends StatelessWidget {
  final String categoryTitle;

  const QuizInstructionScreen({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle Quiz'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Instructions',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            instructionPoint('Read each question carefully.'),
            instructionPoint('Select only one option per question.'),
            instructionPoint('Once selected, the option cannot be changed.'),
            instructionPoint('You can go back to previous questions.'),
            instructionPoint('Try to answer all the questions.'),
            instructionPoint('No time limit to complete the quiz.'),
            instructionPoint('You can exit the quiz at any time.'),
            instructionPoint(
                'If you answer less than 50% of the questions, the result screen will not be shown.'),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Start Quiz',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget instructionPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_outline, color: Colors.teal),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
