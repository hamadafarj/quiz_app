import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/modules/create_quiz/widgets/question.dart';
import 'package:quiz_app/modules/home_screen/home_controller.dart';

class CreateQuiz extends GetView<HomeController> {
  CreateQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Quiz"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView(
          padding: EdgeInsets.only(top: 15.h),
          children: [
            SizedBox(
              height: 40.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed("/addQuestionPage");
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  '+ \t Add new question',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GetBuilder<HomeController>(
              builder: (controller2) {
                return controller2.questions.isNotEmpty
                    ? Column(
                        children: [
                          for (int i = 0; i < controller2.questions.length; i++)
                            Question(question: controller2.questions[i]),
                        ],
                      )
                    : Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
