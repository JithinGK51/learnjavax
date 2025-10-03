import '../../models/simple_models.dart';

class ScratchLessons {
  static List<Lesson> getLessons() {
    return [
      // Lesson 1: What is Java?
      Lesson(
        id: 'scratch_1',
        title: 'What is Java?',
        description: 'Introduction to Java programming language',
        content:
            'Java is a programming language created by Sun Microsystems.\n\nIt is object-oriented, platform independent, and secure.\n\nJava code is written once and can run anywhere (WORA = Write Once, Run Anywhere).',
        level: LearningLevel.scratch,
        order: 1,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_1_ex1',
            title: 'My first Java Program',
            code:
                '// My first Java Program\nclass HelloWorld {\n    public static void main(String[] args) {\n        System.out.println("Hello, Java!");\n    }\n}',
            output: 'Hello, Java!',
            explanation: 'This is the basic structure of a Java program.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Java', definition: 'programming language'),
          GlossaryTerm(
            term: 'Object-oriented',
            definition: 'programming using objects',
          ),
          GlossaryTerm(
            term: 'Platform independent',
            definition: 'runs on any operating system',
          ),
          GlossaryTerm(term: 'WORA', definition: 'Write Once, Run Anywhere'),
        ],
      ),

      // Lesson 2: Java Program Structure
      Lesson(
        id: 'scratch_2',
        title: 'Java Program Structure',
        description: 'Understanding the basic structure of Java programs',
        content:
            'Every Java program has:\n\nClass → container for code.\n\nmain() method → starting point of program.\n\nSystem.out.println() → prints text to screen.',
        level: LearningLevel.scratch,
        order: 2,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_2_ex1',
            title: 'Basic Java Structure',
            code:
                'class ClassName {\n    public static void main(String[] args) {\n        // Your code here\n    }\n}',
            output: 'No output - structure example',
            explanation:
                'This is the basic structure every Java program follows.',
          ),
          CodeExample(
            id: 'scratch_2_ex2',
            title: 'Welcome Program',
            code:
                'class Welcome {\n    public static void main(String[] args) {\n        System.out.println("Welcome to Java Learning!");\n    }\n}',
            output: 'Welcome to Java Learning!',
            explanation: 'A complete working Java program example.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Class', definition: 'container for code'),
          GlossaryTerm(term: 'main()', definition: 'starting point of program'),
          GlossaryTerm(
            term: 'System.out.println()',
            definition: 'prints text to screen',
          ),
        ],
      ),

      // Lesson 3: Variables in Java
      Lesson(
        id: 'scratch_3',
        title: 'Variables in Java',
        description: 'Storing data in your program',
        content:
            'Variable = container to store data.\n\nTypes:\n\nint → whole numbers.\n\ndouble → decimal numbers.\n\nString → text/words.',
        level: LearningLevel.scratch,
        order: 3,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_3_ex1',
            title: 'Different Variable Types',
            code:
                'class VariablesDemo {\n    public static void main(String[] args) {\n        int age = 20;\n        double price = 99.5;\n        String name = "Monarch";\n        \n        System.out.println("Name: " + name);\n        System.out.println("Age: " + age);\n        System.out.println("Price: " + price);\n    }\n}',
            output: 'Name: Monarch\nAge: 20\nPrice: 99.5',
            explanation: 'Variables store different types of data.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Variable', definition: 'container to store data'),
          GlossaryTerm(term: 'int', definition: 'whole numbers'),
          GlossaryTerm(term: 'double', definition: 'decimal numbers'),
          GlossaryTerm(term: 'String', definition: 'text/words'),
        ],
      ),

      // Lesson 4: Operators
      Lesson(
        id: 'scratch_4',
        title: 'Operators',
        description: 'Math and comparison tools in Java',
        content:
            'Operators are symbols used for calculations.\n\n+ , - , * , / → math.\n\n== , != , > , < → comparisons.',
        level: LearningLevel.scratch,
        order: 4,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_4_ex1',
            title: 'Arithmetic Operators',
            code:
                'class OperatorsDemo {\n    public static void main(String[] args) {\n        int a = 10, b = 5;\n        System.out.println("Sum = " + (a + b));\n        System.out.println("Difference = " + (a - b));\n        System.out.println("Greater? " + (a > b));\n    }\n}',
            output: 'Sum = 15\nDifference = 5\nGreater? true',
            explanation:
                'Operators perform mathematical and comparison operations.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Operators',
            definition: 'symbols used for calculations',
          ),
          GlossaryTerm(term: 'Arithmetic', definition: 'math operations'),
          GlossaryTerm(term: 'Comparison', definition: 'comparing values'),
        ],
      ),

      // Lesson 5: Printing in Java
      Lesson(
        id: 'scratch_5',
        title: 'Printing in Java',
        description: 'Displaying output in Java',
        content:
            'To print something, we use System.out.println().\n\nprintln prints with a new line, print prints on the same line.',
        level: LearningLevel.scratch,
        order: 5,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_5_ex1',
            title: 'Print vs Println',
            code:
                'class PrintDemo {\n    public static void main(String[] args) {\n        System.out.println("Hello");\n        System.out.print("Java ");\n        System.out.print("World");\n    }\n}',
            output: 'Hello\nJava World',
            explanation:
                'println adds a new line, print continues on the same line.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'System.out.println()',
            definition: 'prints with new line',
          ),
          GlossaryTerm(
            term: 'System.out.print()',
            definition: 'prints without new line',
          ),
        ],
      ),

      // Lesson 6: Comments in Java
      Lesson(
        id: 'scratch_6',
        title: 'Comments in Java',
        description: 'Adding notes to your code',
        content:
            'Comments are ignored by Java, used for notes.\n\nSingle-line: //\n\nMulti-line: /* ... */',
        level: LearningLevel.scratch,
        order: 6,
        estimatedMinutes: 4,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_6_ex1',
            title: 'Single and Multi-line Comments',
            code:
                'class CommentsDemo {\n    public static void main(String[] args) {\n        // This is a single line comment\n        System.out.println("Learning comments"); \n        \n        /* This is\n           a multi-line\n           comment */\n        System.out.println("Comments ignored by compiler");\n    }\n}',
            output: 'Learning comments\nComments ignored by compiler',
            explanation:
                'Comments help explain code but are ignored by the compiler.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: '//', definition: 'single-line comment'),
          GlossaryTerm(term: '/* */', definition: 'multi-line comment'),
        ],
      ),

      // Lesson 7: Data Types
      Lesson(
        id: 'scratch_7',
        title: 'Data Types',
        description: 'Understanding different types of information',
        content:
            'Java has many data types:\n\nint → whole number (10, 50, -7)\n\ndouble → decimal number (5.5, 7.99)\n\nchar → single character (\'A\', \'b\')\n\nString → text ("Hello")\n\nboolean → true or false',
        level: LearningLevel.scratch,
        order: 7,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_7_ex1',
            title: 'Different Data Types',
            code:
                'class DataTypesDemo {\n    public static void main(String[] args) {\n        int age = 25;\n        double price = 19.99;\n        char grade = \'A\';\n        String name = "Monarch";\n        boolean passed = true;\n\n        System.out.println("Name: " + name);\n        System.out.println("Age: " + age);\n        System.out.println("Grade: " + grade);\n        System.out.println("Price: " + price);\n        System.out.println("Passed? " + passed);\n    }\n}',
            output:
                'Name: Monarch\nAge: 25\nGrade: A\nPrice: 19.99\nPassed? true',
            explanation:
                'Each data type is used for specific kinds of information.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'int', definition: 'whole number'),
          GlossaryTerm(term: 'double', definition: 'decimal number'),
          GlossaryTerm(term: 'char', definition: 'single character'),
          GlossaryTerm(term: 'String', definition: 'text'),
          GlossaryTerm(term: 'boolean', definition: 'true or false'),
        ],
      ),

      // Lesson 8: Keywords in Java
      Lesson(
        id: 'scratch_8',
        title: 'Keywords in Java',
        description: 'Reserved words in Java',
        content:
            'Keywords = reserved words in Java (can\'t use them as variable names).\n\nExample: class, int, if, for, public, static, void.',
        level: LearningLevel.scratch,
        order: 8,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_8_ex1',
            title: 'Wrong Use of Keywords',
            code:
                '// ❌ This will give error\nclass KeywordDemo {\n    public static void main(String[] args) {\n        int class = 5;  // ❌ "class" is a keyword\n        System.out.println(class);\n    }\n}',
            output: 'Compilation Error!',
            explanation: 'Keywords cannot be used as variable names.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Keywords', definition: 'reserved words in Java'),
          GlossaryTerm(
            term: 'Reserved words',
            definition: 'words that have special meaning',
          ),
        ],
      ),

      // Lesson 9: Basic Math in Java
      Lesson(
        id: 'scratch_9',
        title: 'Basic Math in Java',
        description: 'Performing mathematical calculations',
        content:
            'Java can do simple calculations.\n\nUse +, -, *, /, % for arithmetic operations.',
        level: LearningLevel.scratch,
        order: 9,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_9_ex1',
            title: 'Math Operations',
            code:
                'class MathDemo {\n    public static void main(String[] args) {\n        int a = 10, b = 3;\n        System.out.println("Addition: " + (a + b));\n        System.out.println("Subtraction: " + (a - b));\n        System.out.println("Multiplication: " + (a * b));\n        System.out.println("Division: " + (a / b));\n        System.out.println("Remainder: " + (a % b));\n    }\n}',
            output:
                'Addition: 13\nSubtraction: 7\nMultiplication: 30\nDivision: 3\nRemainder: 1',
            explanation: 'Java can perform all basic mathematical operations.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Addition', definition: 'adding numbers (+)'),
          GlossaryTerm(
            term: 'Subtraction',
            definition: 'subtracting numbers (-)',
          ),
          GlossaryTerm(
            term: 'Multiplication',
            definition: 'multiplying numbers (*)',
          ),
          GlossaryTerm(term: 'Division', definition: 'dividing numbers (/)'),
          GlossaryTerm(
            term: 'Remainder',
            definition: 'leftover after division (%)',
          ),
        ],
      ),

      // Lesson 10: Combining Text and Variables
      Lesson(
        id: 'scratch_10',
        title: 'Combining Text and Variables',
        description: 'Joining text with variable values',
        content:
            'Use + to join text with variables.\n\nThis is called string concatenation.',
        level: LearningLevel.scratch,
        order: 10,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_10_ex1',
            title: 'String Concatenation',
            code:
                'class CombineDemo {\n    public static void main(String[] args) {\n        String name = "Monarch";\n        int age = 20;\n        System.out.println("Hello " + name + ", you are " + age + " years old.");\n    }\n}',
            output: 'Hello Monarch, you are 20 years old.',
            explanation: 'Use + to combine text and variables.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'String concatenation',
            definition: 'joining text with variables',
          ),
          GlossaryTerm(term: 'Concatenation', definition: 'combining strings'),
        ],
      ),

      // Lesson 11: Arithmetic Operators
      Lesson(
        id: 'scratch_11',
        title: 'Arithmetic Operators',
        description: 'Math symbols for calculations',
        content:
            'Symbols for math: +, -, *, /, %.\n\nUse to perform calculations in Java.',
        level: LearningLevel.scratch,
        order: 11,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_11_ex1',
            title: 'Arithmetic Operations',
            code:
                'int a = 10, b = 3;\nSystem.out.println(a + b); // 13\nSystem.out.println(a % b); // 1',
            output: '13\n1',
            explanation:
                'Arithmetic operators perform mathematical operations.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Arithmetic operators',
            definition: 'math symbols',
          ),
        ],
      ),

      // Lesson 12: Relational Operators
      Lesson(
        id: 'scratch_12',
        title: 'Relational Operators',
        description: 'Compare values with operators',
        content:
            'Compare values: >, <, >=, <=, ==, !=.\n\nUsed to check conditions.',
        level: LearningLevel.scratch,
        order: 12,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_12_ex1',
            title: 'Comparison Example',
            code:
                'int a = 5, b = 10;\nSystem.out.println(a < b); // true\nSystem.out.println(a == b); // false',
            output: 'true\nfalse',
            explanation:
                'Relational operators compare two values and return true or false.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Relational operators',
            definition: 'comparison symbols',
          ),
        ],
      ),

      // Lesson 13: Logical Operators
      Lesson(
        id: 'scratch_13',
        title: 'Logical Operators',
        description: 'Combine conditions with logical operators',
        content:
            'Combine conditions: && (and), || (or), ! (not)\n\nUsed to make complex decisions.',
        level: LearningLevel.scratch,
        order: 13,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_13_ex1',
            title: 'Logical Operations',
            code:
                'boolean a = true, b = false;\nSystem.out.println(a && b); // false\nSystem.out.println(a || b); // true\nSystem.out.println(!a); // false',
            output: 'false\ntrue\nfalse',
            explanation: 'Logical operators combine boolean values.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: '&&', definition: 'and operator'),
          GlossaryTerm(term: '||', definition: 'or operator'),
          GlossaryTerm(term: '!', definition: 'not operator'),
        ],
      ),

      // Lesson 14: Assignment Operators
      Lesson(
        id: 'scratch_14',
        title: 'Assignment Operators',
        description: 'Shortcut operators for assignments',
        content: '=, +=, -=, *=, /=\n\nShortcuts for common operations.',
        level: LearningLevel.scratch,
        order: 14,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_14_ex1',
            title: 'Assignment Operations',
            code:
                'int a = 5;\na += 3; // a = 8\na *= 2; // a = 16\nSystem.out.println(a);',
            output: '16',
            explanation:
                'Assignment operators provide shortcuts for common operations.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Assignment operators',
            definition: 'shortcut operators',
          ),
        ],
      ),

      // Lesson 15: Increment & Decrement
      Lesson(
        id: 'scratch_15',
        title: 'Increment & Decrement',
        description: 'Add or subtract 1 from variables',
        content: '++ → add 1, -- → subtract 1\n\nCommon operations in loops.',
        level: LearningLevel.scratch,
        order: 15,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_15_ex1',
            title: 'Increment Example',
            code:
                'int a = 5;\na++;\nSystem.out.println(a); // 6\na--;\nSystem.out.println(a); // 5',
            output: '6\n5',
            explanation: 'Increment and decrement operators add or subtract 1.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: '++', definition: 'increment operator'),
          GlossaryTerm(term: '--', definition: 'decrement operator'),
        ],
      ),

      // Lesson 16: Parentheses in Expressions
      Lesson(
        id: 'scratch_16',
        title: 'Parentheses in Expressions',
        description: 'Control calculation order with parentheses',
        content:
            'Use () to control calculation order.\n\nLike in math, parentheses change the order of operations.',
        level: LearningLevel.scratch,
        order: 16,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_16_ex1',
            title: 'Parentheses Example',
            code:
                'int result1 = 2 + 3 * 4; // 14\nint result2 = (2 + 3) * 4; // 20\nSystem.out.println(result1);\nSystem.out.println(result2);',
            output: '14\n20',
            explanation: 'Parentheses change the order of operations.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Parentheses', definition: 'order control'),
        ],
      ),

      // Lesson 17: Variables Recap
      Lesson(
        id: 'scratch_17',
        title: 'Variables Recap',
        description: 'Review of variable concepts',
        content: 'Name, type, value.\n\nVariables store data that can change.',
        level: LearningLevel.scratch,
        order: 17,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_17_ex1',
            title: 'Variable Examples',
            code:
                'int num = 10;\ndouble price = 99.99;\nString name = "Java";\nSystem.out.println(num + " " + price + " " + name);',
            output: '10 99.99 Java',
            explanation:
                'Different types of variables store different kinds of data.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Variable', definition: 'data container'),
        ],
      ),

      // Lesson 18: Printing Variables
      Lesson(
        id: 'scratch_18',
        title: 'Printing Variables',
        description: 'Display variable values',
        content:
            'Combine text and variables using +\n\nShow the value stored in variables.',
        level: LearningLevel.scratch,
        order: 18,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_18_ex1',
            title: 'Print Variables',
            code:
                'int age = 20;\nString name = "Alice";\nSystem.out.println("Name: " + name + ", Age: " + age);',
            output: 'Name: Alice, Age: 20',
            explanation: 'Combine text and variables to display information.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Printing', definition: 'displaying output'),
        ],
      ),

      // Lesson 19: Simple Expressions
      Lesson(
        id: 'scratch_19',
        title: 'Simple Expressions',
        description: 'Combining operators in expressions',
        content:
            'Example: a + b * c / d\n\nComplex calculations using multiple operators.',
        level: LearningLevel.scratch,
        order: 19,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_19_ex1',
            title: 'Expression Example',
            code:
                'int a = 5, b = 2, c = 10, d = 4;\nint result = a + b * c / d;\nSystem.out.println(result); // 10',
            output: '10',
            explanation:
                'Expressions combine multiple operations following operator precedence.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Expression', definition: 'calculation formula'),
        ],
      ),

      // Lesson 20: String Concatenation
      Lesson(
        id: 'scratch_20',
        title: 'String Concatenation',
        description: 'Join strings together',
        content: 'Join strings with +\n\nCombine text to make longer messages.',
        level: LearningLevel.scratch,
        order: 20,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_20_ex1',
            title: 'String Concatenation',
            code:
                'String first = "Hello";\nString last = "World";\nString message = first + " " + last;\nSystem.out.println(message);',
            output: 'Hello World',
            explanation:
                'String concatenation joins multiple strings together.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Concatenation', definition: 'joining strings'),
        ],
      ),

      // Lesson 21: String Length
      Lesson(
        id: 'scratch_21',
        title: 'String Length',
        description: 'Find the length of strings',
        content:
            '.length() returns number of characters\n\nCount how many letters are in a word.',
        level: LearningLevel.scratch,
        order: 21,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_21_ex1',
            title: 'String Length Example',
            code:
                'String text = "Java";\nSystem.out.println(text.length()); // 4',
            output: '4',
            explanation:
                'The length() method returns the number of characters in a string.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'length()', definition: 'count characters'),
        ],
      ),

      // Lesson 22: String Upper & Lower Case
      Lesson(
        id: 'scratch_22',
        title: 'String Upper & Lower Case',
        description: 'Change text to uppercase or lowercase',
        content: '.toUpperCase(), .toLowerCase()\n\nChange how text looks.',
        level: LearningLevel.scratch,
        order: 22,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_22_ex1',
            title: 'Case Conversion',
            code:
                'String name = "monarch";\nSystem.out.println(name.toUpperCase()); // MONARCH\nSystem.out.println(name.toLowerCase()); // monarch',
            output: 'MONARCH\nmonarch',
            explanation: 'String methods can change the case of text.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'toUpperCase()', definition: 'make all caps'),
          GlossaryTerm(term: 'toLowerCase()', definition: 'make all small'),
        ],
      ),

      // Lesson 23: String CharAt
      Lesson(
        id: 'scratch_23',
        title: 'String CharAt',
        description: 'Get a character at specific position',
        content:
            'Get a character at index\n\nFind a specific letter in a word.',
        level: LearningLevel.scratch,
        order: 23,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_23_ex1',
            title: 'CharAt Example',
            code:
                'String name = "Java";\nSystem.out.println(name.charAt(2)); // v',
            output: 'v',
            explanation:
                'charAt() gets the character at a specific position (starting from 0).',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'charAt()',
            definition: 'get character at position',
          ),
        ],
      ),

      // Lesson 24: String Equals
      Lesson(
        id: 'scratch_24',
        title: 'String Equals',
        description: 'Compare two strings',
        content: 'Compare text: .equals()\n\nCheck if two words are the same.',
        level: LearningLevel.scratch,
        order: 24,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_24_ex1',
            title: 'String Comparison',
            code:
                'String a = "Java";\nString b = "java";\nSystem.out.println(a.equals(b)); // false\nSystem.out.println(a.equals("Java")); // true',
            output: 'false\ntrue',
            explanation:
                'equals() compares strings and returns true if they are identical.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'equals()', definition: 'compare strings'),
        ],
      ),

      // Lesson 25: String Substring
      Lesson(
        id: 'scratch_25',
        title: 'String Substring',
        description: 'Get part of a string',
        content:
            'Get part of string: .substring(start, end)\n\nExtract a portion of text.',
        level: LearningLevel.scratch,
        order: 25,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_25_ex1',
            title: 'Substring Example',
            code:
                'String text = "Java Programming";\nSystem.out.println(text.substring(0, 4)); // Java\nSystem.out.println(text.substring(5)); // Programming',
            output: 'Java\nProgramming',
            explanation: 'substring() extracts a portion of a string.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'substring()',
            definition: 'extract part of string',
          ),
        ],
      ),

      // Lesson 26: Escape Sequences
      Lesson(
        id: 'scratch_26',
        title: 'Escape Sequences',
        description: 'Special characters in strings',
        content: '\\n, \\t, \\", \\\\\n\nSpecial characters for formatting.',
        level: LearningLevel.scratch,
        order: 26,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_26_ex1',
            title: 'Escape Sequences',
            code:
                'System.out.println("Hello\\tWorld\\nJava");\nSystem.out.println("She said: \\"Hello\\"");',
            output: 'Hello\tWorld\nJava\nShe said: "Hello"',
            explanation:
                'Escape sequences allow special formatting in strings.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: '\\n', definition: 'new line'),
          GlossaryTerm(term: '\\t', definition: 'tab'),
          GlossaryTerm(term: '\\"', definition: 'quote'),
        ],
      ),

      // Lesson 27: Comments Recap
      Lesson(
        id: 'scratch_27',
        title: 'Comments Recap',
        description: 'Review of comment types',
        content:
            '// single line, /* ... */ multi-line\n\nNotes in your code that are ignored by Java.',
        level: LearningLevel.scratch,
        order: 27,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_27_ex1',
            title: 'Comment Examples',
            code:
                '// This is a single line comment\nSystem.out.println("Comment example");\n/* This is a\n   multi-line comment */',
            output: 'Comment example',
            explanation:
                'Comments help explain code but are ignored by the compiler.',
          ),
        ],
        glossaryTerms: [GlossaryTerm(term: 'Comment', definition: 'code note')],
      ),

      // Lesson 28: Final Keyword
      Lesson(
        id: 'scratch_28',
        title: 'Final Keyword',
        description: 'Create constants that cannot change',
        content:
            'Constants that don\'t change\n\nValues that stay the same forever.',
        level: LearningLevel.scratch,
        order: 28,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_28_ex1',
            title: 'Final Variable',
            code:
                'final double PI = 3.14;\nfinal String APP_NAME = "MyApp";\nSystem.out.println(PI);\nSystem.out.println(APP_NAME);',
            output: '3.14\nMyApp',
            explanation:
                'Final variables cannot be changed after initialization.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'final', definition: 'cannot change'),
          GlossaryTerm(term: 'Constant', definition: 'fixed value'),
        ],
      ),

      // Lesson 29: Data Types Recap
      Lesson(
        id: 'scratch_29',
        title: 'Data Types Recap',
        description: 'Review of all data types',
        content:
            'int, double, char, String, boolean\n\nDifferent types for different kinds of data.',
        level: LearningLevel.scratch,
        order: 29,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_29_ex1',
            title: 'Data Types Example',
            code:
                'int a = 10;\ndouble b = 5.5;\nchar c = \'A\';\nString d = "Hello";\nboolean e = true;\nSystem.out.println(a + " " + b + " " + c + " " + d + " " + e);',
            output: '10 5.5 A Hello true',
            explanation:
                'Each data type stores a specific kind of information.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Data type', definition: 'kind of data'),
        ],
      ),

      // Lesson 30: Type Casting Recap
      Lesson(
        id: 'scratch_30',
        title: 'Type Casting Recap',
        description: 'Convert between data types',
        content:
            'Widening & Narrowing\n\nChange one type to another when needed.',
        level: LearningLevel.scratch,
        order: 30,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_30_ex1',
            title: 'Type Casting',
            code:
                'int a = 10;\ndouble b = a; // widening\ndouble x = 9.8;\nint y = (int)x; // narrowing\nSystem.out.println(b + " " + y);',
            output: '10.0 9',
            explanation: 'Type casting converts one data type to another.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Casting', definition: 'convert type'),
        ],
      ),

      // Lesson 31: Simple Math Functions
      Lesson(
        id: 'scratch_31',
        title: 'Simple Math Functions',
        description: 'Built-in math operations',
        content: 'Math.sqrt(), Math.pow()\n\nUseful math functions in Java.',
        level: LearningLevel.scratch,
        order: 31,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_31_ex1',
            title: 'Math Functions',
            code:
                'System.out.println(Math.sqrt(16)); // 4.0\nSystem.out.println(Math.pow(2,3)); // 8.0\nSystem.out.println(Math.max(5,10)); // 10',
            output: '4.0\n8.0\n10',
            explanation: 'Math class provides useful mathematical functions.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Math.sqrt()', definition: 'square root'),
          GlossaryTerm(term: 'Math.pow()', definition: 'power'),
        ],
      ),

      // Lesson 32: Printing Special Characters
      Lesson(
        id: 'scratch_32',
        title: 'Printing Special Characters',
        description: 'Display special characters in output',
        content:
            'Backslash \\\\, double quote \\"\n\nHow to print special characters.',
        level: LearningLevel.scratch,
        order: 32,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_32_ex1',
            title: 'Special Characters',
            code:
                'System.out.println("Path: C:\\\\Users\\\\Java");\nSystem.out.println("She said: \\"Hello\\"");',
            output: 'Path: C:\\Users\\Java\nShe said: "Hello"',
            explanation: 'Escape sequences allow printing special characters.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Escape sequence',
            definition: 'special character code',
          ),
        ],
      ),

      // Lesson 33: Boolean Basics
      Lesson(
        id: 'scratch_33',
        title: 'Boolean Basics',
        description: 'True/false values in Java',
        content: 'true / false\n\nValues that can only be true or false.',
        level: LearningLevel.scratch,
        order: 33,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_33_ex1',
            title: 'Boolean Example',
            code:
                'boolean isJavaFun = true;\nboolean isHard = false;\nSystem.out.println(isJavaFun);\nSystem.out.println(isHard);',
            output: 'true\nfalse',
            explanation: 'Boolean variables store true or false values.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Boolean', definition: 'true or false'),
        ],
      ),

      // Lesson 34: Simple Quiz Demo
      Lesson(
        id: 'scratch_34',
        title: 'Simple Quiz Demo',
        description: 'Combine text and variables in print',
        content:
            'Combine text and variables in print\n\nCreate a simple quiz program.',
        level: LearningLevel.scratch,
        order: 34,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_34_ex1',
            title: 'Quiz Program',
            code:
                'String name = "Monarch";\nint score = 10;\nSystem.out.println(name + " scored " + score + " points!");\nSystem.out.println("Great job!");',
            output: 'Monarch scored 10 points!\nGreat job!',
            explanation:
                'Combine variables and text to create meaningful output.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Quiz', definition: 'question and answer'),
        ],
      ),

      // Lesson 35: Variable Scope
      Lesson(
        id: 'scratch_35',
        title: 'Variable Scope',
        description: 'Where variables can be used',
        content:
            'Variables work only where they are declared.\n\nLike a local rule that applies only in one place.',
        level: LearningLevel.scratch,
        order: 35,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_35_ex1',
            title: 'Variable Scope Example',
            code:
                'int globalVar = 10;\n{\n    int localVar = 5;\n    System.out.println(globalVar + localVar);\n}\nSystem.out.println(globalVar);',
            output: '15\n10',
            explanation:
                'Variables have different scopes - some work everywhere, some only in blocks.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Scope', definition: 'where variable works'),
        ],
      ),

      // Lesson 36: Input Basics
      Lesson(
        id: 'scratch_36',
        title: 'Input Basics',
        description: 'Get input from user',
        content:
            'Scanner class for user input\n\nLet users type information into your program.',
        level: LearningLevel.scratch,
        order: 36,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_36_ex1',
            title: 'User Input',
            code:
                'import java.util.Scanner;\nScanner sc = new Scanner(System.in);\nSystem.out.print("Enter your name: ");\nString name = sc.nextLine();\nSystem.out.println("Hello " + name);',
            output: 'Enter your name: [user types] Hello [user input]',
            explanation: 'Scanner allows programs to read input from users.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Scanner', definition: 'input reader'),
        ],
      ),

      // Lesson 37: Number Input
      Lesson(
        id: 'scratch_37',
        title: 'Number Input',
        description: 'Get numbers from user',
        content:
            'sc.nextInt(), sc.nextDouble()\n\nRead numbers that users type.',
        level: LearningLevel.scratch,
        order: 37,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_37_ex1',
            title: 'Number Input Example',
            code:
                'Scanner sc = new Scanner(System.in);\nSystem.out.print("Enter a number: ");\nint num = sc.nextInt();\nSystem.out.println("You entered: " + num);',
            output: 'Enter a number: [user types] You entered: [user input]',
            explanation:
                'Different Scanner methods read different types of data.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'nextInt()', definition: 'read integer'),
        ],
      ),

      // Lesson 38: Simple Calculator
      Lesson(
        id: 'scratch_38',
        title: 'Simple Calculator',
        description: 'Build a basic calculator',
        content:
            'Combine input, variables, and operations\n\nCreate a program that does math.',
        level: LearningLevel.scratch,
        order: 38,
        estimatedMinutes: 9,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_38_ex1',
            title: 'Calculator Program',
            code:
                'Scanner sc = new Scanner(System.in);\nSystem.out.print("Enter first number: ");\nint a = sc.nextInt();\nSystem.out.print("Enter second number: ");\nint b = sc.nextInt();\nSystem.out.println("Sum: " + (a + b));',
            output:
                'Enter first number: [user input]\nEnter second number: [user input]\nSum: [result]',
            explanation: 'Combine multiple concepts to create useful programs.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Calculator', definition: 'math program'),
        ],
      ),

      // Lesson 39: Program Structure Review
      Lesson(
        id: 'scratch_39',
        title: 'Program Structure Review',
        description: 'Review complete program structure',
        content:
            'Class, main method, variables, operations\n\nEverything you need for a Java program.',
        level: LearningLevel.scratch,
        order: 39,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_39_ex1',
            title: 'Complete Program',
            code:
                'class MyProgram {\n    public static void main(String[] args) {\n        String name = "Student";\n        int age = 20;\n        System.out.println("Name: " + name);\n        System.out.println("Age: " + age);\n    }\n}',
            output: 'Name: Student\nAge: 20',
            explanation:
                'A complete Java program has all necessary components.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Program structure',
            definition: 'program organization',
          ),
        ],
      ),

      // Lesson 40: Scratch Level Summary
      Lesson(
        id: 'scratch_40',
        title: 'Scratch Level Summary',
        description: 'Review everything learned in scratch level',
        content:
            'Congratulations! You\'ve learned the basics of Java programming.\n\nYou now know variables, data types, operators, strings, and more!',
        level: LearningLevel.scratch,
        order: 40,
        estimatedMinutes: 10,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_40_ex1',
            title: 'Final Program',
            code:
                'class ScratchSummary {\n    public static void main(String[] args) {\n        System.out.println("Congratulations!");\n        System.out.println("You completed Scratch Level!");\n        System.out.println("Ready for Beginner Level!");\n    }\n}',
            output:
                'Congratulations!\nYou completed Scratch Level!\nReady for Beginner Level!',
            explanation:
                'You have successfully completed the Scratch level and are ready for more advanced topics!',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Summary', definition: 'review of everything'),
        ],
      ),
    ];
  }
}
