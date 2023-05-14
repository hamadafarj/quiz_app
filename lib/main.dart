import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_app/modules/add_question_screen/view.dart';

import 'data/models/question.dart';
import 'modules/create_quiz/create_quiz.dart';
import 'modules/home_screen/binding.dart';
import 'modules/home_screen/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QuestionsAdapter());

  await Hive.openBox<Questions>("questions");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialBinding: HomeBinding(),
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          initialRoute: "/homePage",
          getPages: [
            GetPage(
              name: "/homePage",
              page: () => const HomePage(),
            ),
            GetPage(
              name: "/createQuiz",
              page: () => CreateQuiz(),
            ),
            GetPage(
              name: "/addQuestionPage",
              page: () => const AddQuestionPage(),
            ),
          ],
        );
      },
    );
  }
}
