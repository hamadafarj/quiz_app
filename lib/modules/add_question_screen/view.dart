import 'package:flutter/material.dart';

class AddQuestionPage extends StatefulWidget {
  const AddQuestionPage({super.key});

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  String? selectedLocation;
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
          child: Column(
            children: [
              CustomTextFiled(
                  hintText: 'Enter your question ?',
                  labelText: 'Question',
                  showIcon: true),
              const SizedBox(
                height: 20,
              ),
              const CustomRowAnswer(
                  answerTitle: "A",
                  hintText: "First Answer",
                  color: Color(0xFFffba00),
                  labelText: "First Answer"),
              const SizedBox(
                height: 20,
              ),
              const CustomRowAnswer(
                  answerTitle: "B",
                  hintText: "Second Answer",
                  color: Color(0xFF00b660),
                  labelText: "Second Answer"),
              const SizedBox(
                height: 20,
              ),
              const CustomRowAnswer(
                  answerTitle: "C",
                  color: Color(0XFF487e8b),
                  hintText: "Third Answer",
                  labelText: "Third Answer"),
              const SizedBox(
                height: 20,
              ),
              const CustomRowAnswer(
                  answerTitle: "D",
                  hintText: "Fourth Answer",
                  color: Color(0XFFff0047),
                  labelText: "Fourth Answer"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Select the correct Answer",
                    style: TextStyle(fontSize: 20),
                  ),
                  DropdownButton<String>(
                    value: selectedLocation,
                    items: <String>['A', 'B', 'C', 'D'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedLocation = newValue!;
                      });
                    },
                  )
                ],
              ),
               const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFF009b8e),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("Add Question",style: TextStyle(color: Colors.white),)),
              )
            ],
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
  CustomTextFiled(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.showIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
  const CustomRowAnswer(
      {super.key,
      required this.answerTitle,
      required this.hintText,
      required this.labelText,
      required this.color});

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
          hintText: hintText,
          labelText: labelText,
          showIcon: false,
        )),
      ],
    );
  }
}
