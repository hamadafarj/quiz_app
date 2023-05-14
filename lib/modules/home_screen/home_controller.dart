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
  String? selectedLocation;
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
}
