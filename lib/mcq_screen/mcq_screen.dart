import 'package:flutter/material.dart';
import 'package:test_project/mcq_screen/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  List<int?> selectedAnswers = [];

  final List<Map<String, dynamic>> quizData = [
    {
      "question": "What is the largest continent in the world?",
      "options": ["Africa", "Asia", "Europe", "Australia"],
      "answerIndex": 1,
    },
    {
      "question": "How many bones are there in the adult human body?",
      "options": ["206", "306", "256", "226"],
      "answerIndex": 0,
    },
    {
      "question": "What is the national flower of Bangladesh?",
      "options": ["Water Lily", "Rose", "Marigold", "Tuberose"],
      "answerIndex": 0,
    },
    {
      "question": "Which is the longest river in the world?",
      "options": ["Nile", "Amazon", "Ganges", "Mississippi"],
      "answerIndex": 0,
    },
    {
      "question": "What is the main part of a computer?",
      "options": [
        "CPU",
        "RAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAMRAM",
        "Monitor",
        "Mouse"
      ],
      "answerIndex": 0,
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedAnswers = List.filled(quizData.length, null);
  }

  void nextQuestion() {
    if (currentIndex < quizData.length - 1) {
      setState(() => currentIndex++);
    }
  }

  void prevQuestion() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  void submitQuiz() {
    int answeredCount =
        selectedAnswers.where((answer) => answer != null).length;

    if (answeredCount < (quizData.length / 2).ceil()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Warning"),
          content: const Text("কমপক্ষে ৫০% প্রশ্নের উত্তর দিন।"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("ঠিক আছে"),
            ),
          ],
        ),
      );
      return;
    }

    int score = 0;
    for (int i = 0; i < quizData.length; i++) {
      if (selectedAnswers[i] == quizData[i]["answerIndex"]) {
        score++;
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          quizData: quizData,
          selectedAnswers: selectedAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuiz = quizData[currentIndex];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Question Text-->>
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Question: ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: '${currentIndex + 1} /',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: ' ${quizData.length}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ])),
              const SizedBox(height: 16),

              //Question Card-->>
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.black12,
                    )),
                child: Text('Question: ${currentQuiz["question"]}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(height: 20),

              //Option Card-->>

              ListView.builder(
                shrinkWrap: true,
                itemCount: currentQuiz["options"].length,
                itemBuilder: (context, i) {
                  final isSelected = selectedAnswers[currentIndex] == i;
                  final optionLabel = String.fromCharCode(65 + i);

                  return GestureDetector(
                    onTap: selectedAnswers[currentIndex] == null
                        ? () {
                            setState(() => selectedAnswers[currentIndex] = i);
                          }
                        : null,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isSelected ? Colors.teal : Colors.white,
                          border: Border.all(
                            color: Colors.black12,
                          )),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.teal.shade50,
                              border: Border.all(color: Colors.teal),
                            ),
                            child: Text(
                              optionLabel,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    isSelected ? Colors.teal : Colors.teal[800],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              currentQuiz["options"][i],
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    isSelected ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (currentIndex > 0)
              ElevatedButton(
                onPressed: prevQuestion,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text("Previous"),
              ),
            currentIndex == quizData.length - 1
                ? ElevatedButton(
                    onPressed: submitQuiz,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    child: const Text("Submit"),
                  )
                : ElevatedButton(
                    onPressed: nextQuestion,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    child: const Text("Next"),
                  ),
          ],
        ),
      ),
    );
  }
}
