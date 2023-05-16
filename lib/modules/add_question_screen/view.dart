import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/data/models/question.dart';
import 'package:quiz_app/modules/home_screen/home_controller.dart';

class AddQuestionPage extends GetView<HomeController> {
  const AddQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new question"),
        backgroundColor: const Color(0xFF009b8e),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                CustomTextFiled(
                    textController: controller.questionController,
                    hintText: 'Enter your question ?',
                    labelText: 'Question',
                    showIcon: true),
                const SizedBox(
                  height: 20,
                ),
                ...controller.editController
                    .map((e) => Column(
                          children: [
                            CustomRowAnswer(
                              answerTitle: e["answerTitle"],
                              color: e["color"],
                              controller: e["controller"],
                              hintText: e["labelText"],
                              labelText: e["labelText"],
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ))
                    .toList(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Select the correct Answer",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your task title";
                          }
                        },
                        value: controller.selectedLocation,
                        items: <String>['A', 'B', 'C', 'D'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controller.selectedLocation = newValue!;
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Questions qu;
                    if (controller.formKey.currentState!.validate()) {
                      qu = Questions(
                          question: controller.questionController.text,
                          choices: [
                            for (int i = 0;
                                i < controller.editController.length;
                                i++)
                              controller.editController[i]["controller"].text
                          ],
                          rightChoice: controller
                              .editController[controller.editController
                                      .indexWhere((element) =>
                                          element["answerTitle"] ==
                                          controller.selectedLocation)]
                                  ["controller"]
                              .text);
                      if (controller.duplicatedValue(qu.choices)) {
                        final snackBar = SnackBar(
                          content: const Text('Yay! A SnackBar!'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        controller.addQuestion(qu);
                        controller.questionController.clear();
                        controller.firstQuestionController.clear();
                        controller.secondQuestionController.clear();
                        controller.thirdQuestionController.clear();
                        controller.forthQuestionController.clear();
                        controller.selectedLocation = null;
                        Get.back();
                      }
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color(0xFF009b8e),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "Add Question",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextFiled extends StatelessWidget {
  String hintText, labelText;
  bool showIcon;
  TextEditingController textController;
  CustomTextFiled(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.showIcon,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please enter your task title";
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFF009b8e),
            )),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: showIcon
            ? const Icon(
                Icons.question_mark_outlined,
                color: Color(0xFF009b8e),
              )
            : null,
        prefixText: ' ',
      ),
    );
  }
}

class CustomRowAnswer extends StatelessWidget {
  final String answerTitle, hintText, labelText;
  final Color color;
  final TextEditingController controller;
  const CustomRowAnswer(
      {super.key,
      required this.answerTitle,
      required this.hintText,
      required this.labelText,
      required this.color,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: color),
          child: Center(
              child: Text(
            answerTitle,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: CustomTextFiled(
          textController: controller,
          hintText: hintText,
          labelText: labelText,
          showIcon: false,
        )),
      ],
    );
  }
}
