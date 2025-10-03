import '../../models/simple_models.dart';

class BeginnerLessons {
  static List<Lesson> getLessons() {
    return [
      // Lesson 1: What is Java?
      Lesson(
        id: 'beginner_1',
        title: 'What is Java?',
        description: 'Introduction to Java programming language',
        content:
            'Java is a language used to tell computers what to do.\n\nReal-life example: Like giving instructions to a robot to cook food.',
        level: LearningLevel.beginner,
        order: 1,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_1_ex1',
            title: 'Hello Java Program',
            code:
                'class HelloJava {\n    public static void main(String[] args) {\n        System.out.println("Hello, Java!");\n    }\n}',
            output: 'Hello, Java!',
            explanation: 'This is the basic structure of a Java program.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Class', definition: 'container for code'),
          GlossaryTerm(term: 'main()', definition: 'starting point of program'),
          GlossaryTerm(term: 'println()', definition: 'print text on screen'),
        ],
      ),

      // Lesson 2: Printing Text
      Lesson(
        id: 'beginner_2',
        title: 'Printing Text',
        description: 'How to display messages on screen',
        content:
            'To show messages on screen, we use System.out.println().\n\nReal-life example: Like writing a note on a board for everyone to see.',
        level: LearningLevel.beginner,
        order: 2,
        estimatedMinutes: 4,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_2_ex1',
            title: 'Printing Messages',
            code:
                'System.out.println("Welcome to Java!");\nSystem.out.println("Learning is fun!");',
            output: 'Welcome to Java!\nLearning is fun!',
            explanation: 'println() prints text with a new line.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'println()',
            definition: 'print text with new line',
          ),
        ],
      ),

      // Lesson 3: Comments
      Lesson(
        id: 'beginner_3',
        title: 'Comments',
        description: 'Adding notes to your code',
        content:
            'Comments are notes in code. Computer ignores them.\n\nReal-life example: Like writing a reminder in your notebook.',
        level: LearningLevel.beginner,
        order: 3,
        estimatedMinutes: 4,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_3_ex1',
            title: 'Single and Multi-line Comments',
            code:
                '// This is a single-line comment\n/* This is a \n   multi-line comment */\nSystem.out.println("Comments are ignored by computer");',
            output: 'Comments are ignored by computer',
            explanation:
                'Comments help explain code but are ignored by the compiler.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: '//', definition: 'single-line comment'),
          GlossaryTerm(term: '/* */', definition: 'multi-line comment'),
        ],
      ),

      // Lesson 4: Variables
      Lesson(
        id: 'beginner_4',
        title: 'Variables',
        description: 'Storing information in your program',
        content:
            'Variable = box to store information.\n\nReal-life example: Like a jar where you keep candies.',
        level: LearningLevel.beginner,
        order: 4,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_4_ex1',
            title: 'Different Variable Types',
            code:
                'int age = 20;\ndouble price = 99.5;\nString name = "Monarch";\nboolean isStudent = true;\n\nSystem.out.println("Name: " + name);\nSystem.out.println("Age: " + age);',
            output: 'Name: Monarch\nAge: 20',
            explanation: 'Variables store different types of data.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'int', definition: 'whole number'),
          GlossaryTerm(term: 'double', definition: 'decimal number'),
          GlossaryTerm(term: 'String', definition: 'text'),
          GlossaryTerm(term: 'boolean', definition: 'true/false'),
        ],
      ),

      // Lesson 5: Data Types
      Lesson(
        id: 'beginner_5',
        title: 'Data Types',
        description: 'Understanding different types of information',
        content:
            'Data types tell the computer what kind of info we store.\n\nReal-life example: Storing coins (int), water (double), or names (String).',
        level: LearningLevel.beginner,
        order: 5,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_5_ex1',
            title: 'Using Different Data Types',
            code:
                'int coins = 10;\ndouble waterLiters = 1.5;\nString city = "Bangalore";\nboolean isRaining = false;',
            output: 'No output - just variable declarations',
            explanation:
                'Each data type is used for specific kinds of information.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'data type', definition: 'type of info'),
        ],
      ),

      // Continue with all 40 beginner lessons...
      // (I'll add the remaining lessons in the next part to keep the response manageable)
    ];
  }
}
