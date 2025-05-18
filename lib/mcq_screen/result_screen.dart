import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<Map<String, dynamic>> quizData;
  final List<int?> selectedAnswers;

  const ResultScreen({
    super.key,
    required this.quizData,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Results"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: quizData.length,
        itemBuilder: (context, index) {
          final question = quizData[index];
          final userAnswer = selectedAnswers[index];
          final correctAnswer = question["answerIndex"];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question
              Text(
                'Q${index + 1}: ${question["question"]}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),

              // Options
              ...List.generate(question["options"].length, (i) {
                final isCorrect = i == correctAnswer;
                final isSelected = i == userAnswer;

                Color bgColor = Colors.white;
                Color textColor = Colors.black87;
                BorderSide border = BorderSide(color: Colors.black12);

                if (isCorrect) {
                  bgColor = Colors.green.shade100;
                  textColor = Colors.green.shade800;
                  border = BorderSide(color: Colors.green);
                } else if (isSelected && !isCorrect) {
                  bgColor = Colors.red.shade100;
                  textColor = Colors.red.shade800;
                  border = BorderSide(color: Colors.red);
                }

                final optionLabel = String.fromCharCode(65 + i); // A, B, C...

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border.all(width: 1.2, color: border.color),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.teal.withOpacity(0.1),
                          border: Border.all(color: Colors.teal),
                        ),
                        child: Text(
                          optionLabel,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          question["options"][i],
                          style: TextStyle(
                            fontSize: 15,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const Divider(height: 30),
            ],
          );
        },
      ),
    );
  }
}
