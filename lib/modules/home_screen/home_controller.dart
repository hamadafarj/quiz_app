import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_app/data/models/question.dart';
import 'package:quiz_app/data/services/quiz_services.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    questions = box.values.toList().cast<Questions>();
    super.onInit();
  }

  @override
  void dispose() {
    questionController.dispose();
    firstQuestionController.dispose();
    secondQuestionController.dispose();
    thirdQuestionController.dispose();
    forthQuestionController.dispose();
    Hive.box("questions").close();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  int currentPage = 0;

  String? selectedLocation;
  final PageController pageController = PageController();
  TextEditingController questionController = TextEditingController();
  TextEditingController firstQuestionController = TextEditingController();
  TextEditingController secondQuestionController = TextEditingController();
  TextEditingController thirdQuestionController = TextEditingController();
  TextEditingController forthQuestionController = TextEditingController();
  final box = QuizServices.getQuestions();
  late List editController = [
    {
      "controller": firstQuestionController,
      "answerTitle": "A",
      "color": const Color(0xFFffba00),
      "labelText": "First Answer"
    },
    {
      "controller": secondQuestionController,
      "answerTitle": "B",
      "color": const Color(0xFF00b660),
      "labelText": "Second Answer"
    },
    {
      "controller": thirdQuestionController,
      "answerTitle": "C",
      "color": const Color(0XFF487e8b),
      "labelText": "Third Answer"
    },
    {
      "controller": forthQuestionController,
      "answerTitle": "D",
      "color": const Color(0XFFff0047),
      "labelText": "Fourth Answer"
    },
  ];

  List questions = [].obs;
  List answers = [];
  Future addQuestion(Questions qus) async {
    box.add(qus);
    questions = box.values.toList().cast<Questions>();
    print(questions);
    update();
  }

  deleteQuestion(Questions que) {
    que.delete();
    questions = box.values.toList().cast<Questions>();
    update();
  }

  changeCurrentPage(int index) {
    currentPage = index;
    update();
  }

  addAnswer(Map answer) {
    for (int i = 0; i < answers.length; i++) {
      if (answers[i]["questionNum"] == answer["questionNum"]) {
        answers.removeAt(i);
      }
    }
    answers.add(answer);
    update();
  }

  String chosenValue(int questionNum) {
    for (int i = 0; i < answers.length; i++) {
      if (answers[i]["questionNum"] == questionNum) {
        return answers[i]["answer"];
      }
    }
    return "";
  }

  int result() {
    int res = 0;
    for (int i = 0; i < answers.length; i++) {
      if (answers[i]["answer"] == answers[i]["question"].rightChoice) {
        res++;
      }
    }
    return res;
  }

  bool duplicatedValue(List values) {
    bool hasDuplicates = values.length != values.toSet().length;

    return hasDuplicates;
  }
}
