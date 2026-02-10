import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultPage({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (score / totalQuestions) * 100;
    final isPassed = percentage >= 60;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: Icon(
                  isPassed
                      ? Icons.emoji_events_rounded
                      : Icons.sentiment_very_dissatisfied_rounded,
                  size: 100,
                  color: isPassed ? const Color(0xFFFFD700) : Colors.redAccent,
                ),
              ),
            ),
            const SizedBox(height: 48),
            FadeInUp(
              child: Text(
                isPassed ? 'Congratulations!' : 'Keep Trying!',
                style: GoogleFonts.outfit(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: Text(
                'You scored $score out of $totalQuestions',
                style: GoogleFonts.outfit(fontSize: 20, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 48),
            FadeIn(
              delay: const Duration(milliseconds: 500),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      '${percentage.toInt()}%',
                      style: GoogleFonts.outfit(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: isPassed ? Colors.green : Colors.redAccent,
                      ),
                    ),
                    Text(
                      'OVERALL SCORE',
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        color: Colors.black38,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            FadeInUp(
              delay: const Duration(milliseconds: 800),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2575FC),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Back to Dashboard',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
