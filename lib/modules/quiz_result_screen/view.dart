import 'package:flutter/material.dart';

class QuizResultPage extends StatelessWidget {
  final int userScore, totalQuestion;
  const QuizResultPage(
      {super.key, required this.userScore, required this.totalQuestion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
          backgroundColor: const Color(0xFF009b8e),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              userScore < totalQuestion / 2 ? "OOPS!" : "congratulations",
              style: const TextStyle(color: Color(0xFF009b8e), fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              userScore < totalQuestion / 2
                  ? "assets/images/fail.png"
                  : "assets/images/result.jpg",
              height: 300,
              width: MediaQuery.of(context).size.width,
            ),
              const SizedBox(
              height: 20,
            ),
            Text(
              "Your Score $userScore / $totalQuestion",
              style: const TextStyle(color: Colors.green, fontSize: 20),
            ),
             const SizedBox(
              height: 5,
            ),
             Text(
                userScore < totalQuestion / 2 ? "Sorry,better luck next time!" :  "Your're a superstar!",
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
              const SizedBox(
              height: 20,
            ),
             Container(
              height: 45,
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                  color: const Color(0xFF009b8e),
                  borderRadius: BorderRadius.circular(10)),
              child:const Center(
                  child: Text(
               "Back to home",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ));
  }
}
