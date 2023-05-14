import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:quiz_app/data/models/question.dart';

class QuizServices {
  static Box<Questions> getQuestions() {
    return Hive.box<Questions>("questions");
  }
}
