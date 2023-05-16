import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/data/models/question.dart';
import 'package:quiz_app/modules/home_screen/home_controller.dart';
import 'package:quiz_app/modules/quiz_result_screen/view.dart';

class QuizzesPage extends StatelessWidget {
  const QuizzesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
          backgroundColor: const Color(0xFF009b8e),
          centerTitle: true,
          elevation: 0,
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.questions.length,
                    controller: controller.pageController,
                    allowImplicitScrolling: false,
                    onPageChanged: (int page) {
                      controller.questions.length == controller.currentPage + 1
                          ? Get.offAll(() =>
                              QuizResultPage(userScore: 5, totalQuestion: 10))
                          : controller.changeCurrentPage(page);
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
                                    text:
                                        "Question ${controller.currentPage + 1} of ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF009b8e),
                                        fontSize: 24),
                                  ),
                                  TextSpan(
                                    text: "/ ${controller.questions.length}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            )),
                        QuizQuestionPage(
                          questions: controller.questions[index],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}

class QuizQuestionPage extends GetView<HomeController> {
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
            .map(
              (option) => GestureDetector(
                onTap: () {
                  print("object");
                  if (option == questions.rightChoice) controller.result += 1;
                  controller.pageController.nextPage(
                      duration: const Duration(seconds: 1), curve: Curves.ease);
                },
                child: QuizOption(option: option),
              ),
            )
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
