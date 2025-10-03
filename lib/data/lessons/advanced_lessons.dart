import '../../models/simple_models.dart';

class AdvancedLessons {
  static List<Lesson> getLessons() {
    return [
      // Lesson 1: Exception Handling Basics
      Lesson(
        id: 'advanced_1',
        title: 'Exception Handling Basics',
        description: 'Handle errors gracefully in Java programs',
        content:
            'Errors happen → we must handle them.\n\nReal-life example: ATM fails → shows "Try again" instead of crashing.',
        level: LearningLevel.advanced,
        order: 1,
        estimatedMinutes: 9,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_1_ex1',
            title: 'Try-Catch Example',
            code:
                'try {\n   int x = 10 / 0;\n} catch (ArithmeticException e) {\n   System.out.println("Cannot divide by zero");\n}',
            output: 'Cannot divide by zero',
            explanation:
                'Try-catch blocks prevent programs from crashing when errors occur.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'try-catch', definition: 'safe code block'),
        ],
      ),
    ];
  }
}
