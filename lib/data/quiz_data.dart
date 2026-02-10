import '../models/question.dart';

final List<Question> examQuestions = [
  Question(
    questionText: "Which programming language is used to build Flutter apps?",
    options: ["Java", "Kotlin", "Dart", "Swift"],
    correctAnswerIndex: 2,
  ),
  Question(
    questionText: "What is a Widget in Flutter?",
    options: [
      "A configuration for an element",
      "A database engine",
      "A network protocol",
      "A hardware component",
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: "Which command is used to run a Flutter app?",
    options: [
      "flutter deploy",
      "flutter run",
      "flutter build",
      "flutter startup",
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    questionText: "What is the purpose of pubspec.yaml?",
    options: [
      "Compile settings",
      "User interface design",
      "Dependency and asset management",
      "Database schema",
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    questionText: "Which company developed Flutter?",
    options: ["Facebook", "Apple", "Google", "Microsoft"],
    correctAnswerIndex: 2,
  ),
];
