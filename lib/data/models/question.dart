class Questions {
  String question;
  List<String> choices;
  String rightChoice;

  Questions(
      {required this.question,
      required this.choices,
      required this.rightChoice});

  static Questions questions = Questions(
      question: "What is flutter?",
      choices: [
        "A mobile development framework",
        "A database management system",
        "A Programming language",
        "An operation system",
      ],
      rightChoice: "A mobile development framework");
}
