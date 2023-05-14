import 'package:flutter/material.dart';
import 'package:quiz_app/data/models/question.dart';

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({super.key});

  @override
  State<QuizzesPage> createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  final PageController pageController = PageController();
  final List<Questions> quizQuestions = [
    Questions(
      question: 'What is the capital of France?',
      choices: ['Paris', 'London', 'Berlin', 'Rome'],
      rightChoice: 'Rome',
    ),
    Questions(
      question: 'Who invented the telephone?',
      choices: [
        'Alexander Graham Bell',
        'Thomas Edison',
        'Nikola Tesla',
        'Guglielmo Marconi'
      ],
      rightChoice: 'Thomas Edison',
    ),
  ];

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        backgroundColor: const Color(0xFF009b8e),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: quizQuestions.length,
              controller: pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Question ${currentPage + 1} of ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF009b8e),
                                fontSize: 24
                              ),
                            ),
                            TextSpan(
                              text: "/ ${quizQuestions.length}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                      // Text(
                      //   "Question ${currentPage + 1} of ",
                      //   style: TextStyle(fontSize: 16),
                      // ),
                      ),
                  QuizQuestionPage(
                    questions: quizQuestions[index],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizQuestionPage extends StatelessWidget {
  final Questions questions;

  const QuizQuestionPage({Key? key, required this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF009b8e),
              // border: Border.all(color: const Color(0xFF009b8e), width: 2)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  questions.question,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        ...questions.choices
            .map((option) => QuizOption(option: option))
            .toList(),
      ],
    );
  }
}

class QuizOption extends StatelessWidget {
  final String option;

  const QuizOption({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF009b8e), width: 2)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5,
                ),
                Text(option),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
