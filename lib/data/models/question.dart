import 'package:hive/hive.dart';

part 'question.g.dart';

@HiveType(typeId: 0)
class Questions extends HiveObject {
  @HiveField(0)
  String question;
  @HiveField(1)
  List<String> choices;
  @HiveField(2)
  String rightChoice;

  Questions(
      {required this.question,
      required this.choices,
      required this.rightChoice});
}
