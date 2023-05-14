import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/data/models/question.dart';
import 'package:quiz_app/modules/create_quiz/widgets/question.dart';

class CreateQuiz extends StatelessWidget {
  const CreateQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Quiz"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
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
                onPressed: () {},
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
            for (int i = 0; i < 3; i++) Question(question: Questions.questions),
          ],
        ),
      ),
    );
  }
}
