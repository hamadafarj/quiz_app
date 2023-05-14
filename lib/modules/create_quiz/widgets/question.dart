import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/data/models/question.dart';
import 'package:quiz_app/modules/home_screen/home_controller.dart';

class Question extends GetView<HomeController> {
  Question({super.key, required this.question});
  Questions question;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 18.h),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  question.question,
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.bottomSheet(
                      Center(
                        child: Container(
                          width: 300.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delete Question",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp),
                                ),
                                Text(
                                  "Are you sure you want to delete this question?",
                                  softWrap: true,
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        "cancel",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        controller.deleteQuestion(question);
                                        Get.back();
                                      },
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      isDismissible: false,
                      isScrollControlled: true,
                      enableDrag: false,
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          for (int i = 0; i < question.choices.length; i++)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: question.choices[i] == question.rightChoice
                    ? Colors.green
                    : Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 15.h,
              ),
              margin: EdgeInsets.only(bottom: 10.h),
              child: Text(
                question.choices[i],
                style: TextStyle(
                  fontSize: 15.sp,
                  color: question.choices[i] == question.rightChoice
                      ? Colors.white
                      : Colors.black,
                ),
                softWrap: true,
              ),
            ),
        ],
      ),
    );
  }
}
