// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:quizapp/main.dart';

void main() {
  testWidgets('Quiz App initial UI smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the first question is displayed.
    expect(find.text('Question 1'), findsOneWidget);
    expect(find.text('What is your favorite sport?'), findsOneWidget);

    // Verify that the answer options are displayed.
    expect(find.text('Football'), findsOneWidget);
    expect(find.text('Basketball'), findsOneWidget);
    expect(find.text('Volleyball'), findsOneWidget);
    expect(find.text('Kick boxing'), findsOneWidget);
  });
}
