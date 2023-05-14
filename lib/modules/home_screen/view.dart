import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/modules/home_screen/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
          backgroundColor: const Color(0xFF009b8e),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/quiz.png",
              height: 300,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed("/createQuiz");
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: const Color(0xFF009b8e),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "Create Quiz",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: const Color(0xFF009b8e),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                "Start Quiz",
                style: TextStyle(color: Colors.white),
              )),
            )
          ],
        ));
  }
}
