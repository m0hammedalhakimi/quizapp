import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../data/quiz_data.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _isAnswered = false;

  void _handleAnswer(int index) {
    if (_isAnswered) return;

    setState(() {
      _selectedAnswerIndex = index;
      _isAnswered = true;
      if (index == examQuestions[_currentQuestionIndex].correctAnswerIndex) {
        _score++;
      }
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (_currentQuestionIndex < examQuestions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _selectedAnswerIndex = null;
          _isAnswered = false;
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ResultPage(score: _score, totalQuestions: examQuestions.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = examQuestions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / examQuestions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.black12,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2575FC)),
            minHeight: 8,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                '${_currentQuestionIndex + 1}/${examQuestions.length}',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            FadeInDown(
              key: ValueKey(_currentQuestionIndex),
              child: Text(
                question.questionText,
                style: GoogleFonts.outfit(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 48),
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return FadeInUp(
                    delay: Duration(milliseconds: 100 * index),
                    key: ValueKey('${_currentQuestionIndex}_$index'),
                    child: _buildOption(index, question.options[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(int index, String text) {
    Color? borderColor;
    Color? bgColor;
    Widget? trailing;

    if (_isAnswered) {
      if (index == examQuestions[_currentQuestionIndex].correctAnswerIndex) {
        borderColor = Colors.green;
        bgColor = Colors.green.withOpacity(0.1);
        trailing = const Icon(Icons.check_circle_rounded, color: Colors.green);
      } else if (index == _selectedAnswerIndex) {
        borderColor = Colors.red;
        bgColor = Colors.red.withOpacity(0.1);
        trailing = const Icon(Icons.cancel_rounded, color: Colors.red);
      }
    } else if (index == _selectedAnswerIndex) {
      borderColor = const Color(0xFF2575FC);
      bgColor = const Color(0xFF2575FC).withOpacity(0.1);
    }

    return GestureDetector(
      onTap: () => _handleAnswer(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor ?? Colors.black12, width: 2),
          boxShadow: [
            if (!_isAnswered)
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: _selectedAnswerIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
