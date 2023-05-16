import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/data/models/question.dart';
import 'package:quiz_app/modules/home_screen/home_controller.dart';
import 'package:quiz_app/modules/quiz_result_screen/view.dart';

class QuizzesPage extends StatelessWidget {
  const QuizzesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Quiz App"),
              backgroundColor: const Color(0xFF009b8e),
              centerTitle: true,
              elevation: 0,
              // actions: [
              //   controller.currentPage + 1 == controller.questions.length
              //       ? GestureDetector(
              //           onTap: () {
              //             Get.offAll(
              //               () => QuizResultPage(
              //                   userScore: controller.result(),
              //                   totalQuestion: controller.questions.length),
              //             );
              //           },
              //           child: Container(
              //             alignment: Alignment.center,
              //             padding: EdgeInsets.symmetric(horizontal: 12.w),
              //             child: const Text(
              //               "End",
              //               style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //         )
              //       : Container(),
              // ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.questions.length,
                    controller: controller.pageController,
                    allowImplicitScrolling: false,
                    onPageChanged: (int page) {
                      controller.changeCurrentPage(page);
                    },
                    itemBuilder: (context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
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
                                        text:
                                            "/ ${controller.questions.length}",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                              onPressed: () {
                                controller.pageController.previousPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.linear,
                                );
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                              label: const Text("previous"),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (controller.currentPage + 1 ==
                                    controller.questions.length) {
                                  Get.offAll(
                                    () => QuizResultPage(
                                        userScore: controller.result(),
                                        totalQuestion:
                                            controller.questions.length),
                                  );
                                }
                                controller.pageController.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.linear,
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    controller.currentPage + 1 ==
                                            controller.questions.length
                                        ? "End"
                                        : "Next",
                                    style: const TextStyle(
                                      color: Colors.teal,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.teal,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ));
      },
    );
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
            .map((option) => GetBuilder<HomeController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        controller.addAnswer({
                          "questionNum": controller.currentPage + 1,
                          "answer": option,
                          "question": questions
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(
                            color: option ==
                                    controller
                                        .chosenValue(controller.currentPage + 1)
                                ? Colors.grey
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF009b8e),
                              width: 2,
                            ),
                          ),
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
                    );
                  },
                ))
            .toList(),
      ],
    );
  }
}

// class QuizOption extends StatelessWidget {
//   final String option;
//   bool isChoice;

//   QuizOption({Key? key, required this.option, this.isChoice = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [],
//     );
//   }
// }
