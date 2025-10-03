import '../../models/simple_models.dart';

class ScratchLessonsPart2 {
  static List<Lesson> getLessons() {
    return [
      // Lesson 11: Arithmetic Operators
      Lesson(
        id: 'scratch_11',
        title: 'Arithmetic Operators',
        description: 'Math symbols in Java',
        content:
            'Symbols for math: +, -, *, /, %.\n\nUse to perform calculations in Java.',
        level: LearningLevel.scratch,
        order: 11,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_11_ex1',
            title: 'Arithmetic Operations',
            code:
                'int a = 10, b = 3;\nSystem.out.println(a + b); // 13\nSystem.out.println(a % b); // 1',
            output: '13\n1',
            explanation:
                'Arithmetic operators perform mathematical calculations.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Arithmetic operators',
            definition: 'math symbols',
          ),
        ],
      ),

      // Continue with remaining lessons 12-40...
      // For brevity, I'll add a few more key lessons

      // Lesson 12: Relational Operators
      Lesson(
        id: 'scratch_12',
        title: 'Relational Operators',
        description: 'Comparing values in Java',
        content:
            'Compare values: >, <, >=, <=, ==, !=.\n\nReturn true or false.',
        level: LearningLevel.scratch,
        order: 12,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_12_ex1',
            title: 'Comparison Operators',
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

      // Add more lessons as needed...
      // For now, I'll add a few more key lessons to complete the scratch level

      // Lesson 13: Logical Operators
      Lesson(
        id: 'scratch_13',
        title: 'Logical Operators',
        description: 'Combining conditions',
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
          GlossaryTerm(term: '&&', definition: 'logical AND'),
          GlossaryTerm(term: '||', definition: 'logical OR'),
          GlossaryTerm(term: '!', definition: 'logical NOT'),
        ],
      ),

      // Continue with remaining lessons 14-40...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 14: Assignment Operators
      Lesson(
        id: 'scratch_14',
        title: 'Assignment Operators',
        description: 'Shortcut operators for assignments',
        content: '=, +=, -=, *=, /=\n\nShortcuts for common operations.',
        level: LearningLevel.scratch,
        order: 14,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_14_ex1',
            title: 'Assignment Operators',
            code: 'int a = 5;\na += 3; // a = 8\nSystem.out.println(a);',
            output: '8',
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

      // Add remaining lessons 15-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 15: Increment & Decrement
      Lesson(
        id: 'scratch_15',
        title: 'Increment & Decrement',
        description: 'Adding or subtracting 1 from a variable',
        content: '++ → add 1, -- → subtract 1\n\nCommon in loops and counters.',
        level: LearningLevel.scratch,
        order: 15,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_15_ex1',
            title: 'Increment and Decrement',
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

      // Add remaining lessons 16-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 16: String Methods
      Lesson(
        id: 'scratch_16',
        title: 'String Methods',
        description: 'Built-in methods for working with strings',
        content:
            'Java provides many useful methods for strings:\n\n.length() - get string length\n\n.toUpperCase() - convert to uppercase\n\n.charAt() - get character at position',
        level: LearningLevel.scratch,
        order: 16,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_16_ex1',
            title: 'String Methods',
            code:
                'String name = "Java";\nSystem.out.println(name.length()); // 4\nSystem.out.println(name.toUpperCase()); // JAVA\nSystem.out.println(name.charAt(2)); // v',
            output: '4\nJAVA\nv',
            explanation: 'String methods provide useful operations on text.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'String methods',
            definition: 'built-in string functions',
          ),
          GlossaryTerm(term: 'length()', definition: 'get string length'),
          GlossaryTerm(
            term: 'toUpperCase()',
            definition: 'convert to uppercase',
          ),
          GlossaryTerm(
            term: 'charAt()',
            definition: 'get character at position',
          ),
        ],
      ),

      // Add remaining lessons 17-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 17: Escape Sequences
      Lesson(
        id: 'scratch_17',
        title: 'Escape Sequences',
        description: 'Special characters in strings',
        content:
            'Special characters: \\n, \\t, \\", \\\\\n\nUsed to format output and include special characters.',
        level: LearningLevel.scratch,
        order: 17,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_17_ex1',
            title: 'Escape Sequences',
            code:
                'System.out.println("Hello\\tWorld\\nJava");\nSystem.out.println("She said: \\"Hello\\"");',
            output: 'Hello\tWorld\nJava\nShe said: "Hello"',
            explanation:
                'Escape sequences allow special formatting and characters.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Escape sequences',
            definition: 'special characters',
          ),
          GlossaryTerm(term: '\\n', definition: 'new line'),
          GlossaryTerm(term: '\\t', definition: 'tab'),
          GlossaryTerm(term: '\\"', definition: 'double quote'),
        ],
      ),

      // Add remaining lessons 18-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 18: Final Keyword
      Lesson(
        id: 'scratch_18',
        title: 'Final Keyword',
        description: 'Creating constants that cannot change',
        content:
            'Constants that don\'t change\n\nUse final keyword to make variables unchangeable.',
        level: LearningLevel.scratch,
        order: 18,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_18_ex1',
            title: 'Final Variable',
            code:
                'final double PI = 3.14;\nSystem.out.println(PI);\n// PI = 3.14159; // This would cause an error',
            output: '3.14',
            explanation:
                'Final variables cannot be changed after initialization.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'final', definition: 'unchangeable'),
          GlossaryTerm(
            term: 'Constants',
            definition: 'values that don\'t change',
          ),
        ],
      ),

      // Add remaining lessons 19-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 19: Type Casting
      Lesson(
        id: 'scratch_19',
        title: 'Type Casting',
        description: 'Converting between different data types',
        content:
            'Change one type to another\n\nWidening: automatic (int to double)\n\nNarrowing: manual (double to int)',
        level: LearningLevel.scratch,
        order: 19,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_19_ex1',
            title: 'Type Casting',
            code:
                'int a = 10;\ndouble b = a; // widening\ndouble x = 9.8;\nint y = (int)x; // narrowing\nSystem.out.println(b + " " + y);',
            output: '10.0 9',
            explanation: 'Type casting converts one data type to another.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Type casting', definition: 'convert type'),
          GlossaryTerm(term: 'Widening', definition: 'automatic conversion'),
          GlossaryTerm(term: 'Narrowing', definition: 'manual conversion'),
        ],
      ),

      // Add remaining lessons 20-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 20: Math Functions
      Lesson(
        id: 'scratch_20',
        title: 'Math Functions',
        description: 'Built-in mathematical functions',
        content:
            'Java has Math class for calculations\n\nMath.sqrt() - square root\n\nMath.pow() - power\n\nMath.max() - maximum value',
        level: LearningLevel.scratch,
        order: 20,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_20_ex1',
            title: 'Math Functions',
            code:
                'System.out.println(Math.sqrt(16)); // 4\nSystem.out.println(Math.pow(2,3)); // 8\nSystem.out.println(Math.max(5,10)); // 10',
            output: '4.0\n8.0\n10',
            explanation: 'Math class provides mathematical functions.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Math class',
            definition: 'mathematical functions',
          ),
          GlossaryTerm(term: 'sqrt()', definition: 'square root'),
          GlossaryTerm(term: 'pow()', definition: 'power'),
          GlossaryTerm(term: 'max()', definition: 'maximum value'),
        ],
      ),

      // Add remaining lessons 21-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 21: Boolean Basics
      Lesson(
        id: 'scratch_21',
        title: 'Boolean Basics',
        description: 'Working with true/false values',
        content:
            'Boolean values: true or false\n\nUsed for conditions and decisions.',
        level: LearningLevel.scratch,
        order: 21,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_21_ex1',
            title: 'Boolean Variables',
            code:
                'boolean isJavaFun = true;\nboolean isHard = false;\nSystem.out.println(isJavaFun);\nSystem.out.println(isHard);',
            output: 'true\nfalse',
            explanation: 'Boolean variables store true or false values.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'boolean', definition: 'true/false'),
        ],
      ),

      // Add remaining lessons 22-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 22: Simple Quiz Demo
      Lesson(
        id: 'scratch_22',
        title: 'Simple Quiz Demo',
        description: 'Combining all concepts in a practical example',
        content:
            'Combine text and variables in print\n\nCreate a simple interactive program.',
        level: LearningLevel.scratch,
        order: 22,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_22_ex1',
            title: 'Quiz Program',
            code:
                'String name = "Monarch";\nint score = 10;\nSystem.out.println(name + " scored " + score + " points!");\nSystem.out.println("Great job!");',
            output: 'Monarch scored 10 points!\nGreat job!',
            explanation: 'This example combines variables, text, and output.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Quiz', definition: 'test or question'),
        ],
      ),

      // Add remaining lessons 23-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 23: String Concatenation
      Lesson(
        id: 'scratch_23',
        title: 'String Concatenation',
        description: 'Joining strings together',
        content: 'Join texts using +\n\nCombine multiple strings into one.',
        level: LearningLevel.scratch,
        order: 23,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_23_ex1',
            title: 'String Concatenation',
            code:
                'String first = "Hello";\nString last = "World";\nSystem.out.println(first + " " + last);',
            output: 'Hello World',
            explanation:
                'String concatenation joins multiple strings together.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Concatenation', definition: 'join texts'),
        ],
      ),

      // Add remaining lessons 24-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 24: Parentheses in Expressions
      Lesson(
        id: 'scratch_24',
        title: 'Parentheses in Expressions',
        description: 'Controlling calculation order',
        content:
            'Use () to control calculation order\n\nParentheses have highest priority.',
        level: LearningLevel.scratch,
        order: 24,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_24_ex1',
            title: 'Parentheses',
            code:
                'int result = (2 + 3) * 4;\nSystem.out.println(result); // 20',
            output: '20',
            explanation: 'Parentheses control the order of operations.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Parentheses',
            definition: 'control calculation order',
          ),
        ],
      ),

      // Add remaining lessons 25-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 25: Simple Expressions
      Lesson(
        id: 'scratch_25',
        title: 'Simple Expressions',
        description: 'Combining operators in expressions',
        content: 'Example: a + b * c / d\n\nFollow order of operations.',
        level: LearningLevel.scratch,
        order: 25,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_25_ex1',
            title: 'Complex Expression',
            code:
                'int a = 5, b = 2, c = 10, d = 4;\nSystem.out.println(a + b * c / d); // 10',
            output: '10',
            explanation: 'Complex expressions follow order of operations.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Expression',
            definition: 'combination of values and operators',
          ),
        ],
      ),

      // Add remaining lessons 26-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 26: String Length
      Lesson(
        id: 'scratch_26',
        title: 'String Length',
        description: 'Finding the length of a string',
        content:
            '.length() returns number of characters\n\nUseful for string operations.',
        level: LearningLevel.scratch,
        order: 26,
        estimatedMinutes: 4,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_26_ex1',
            title: 'String Length',
            code:
                'String text = "Java";\nSystem.out.println(text.length()); // 4',
            output: '4',
            explanation:
                'length() method returns the number of characters in a string.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'length()', definition: 'get string length'),
        ],
      ),

      // Add remaining lessons 27-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 27: String Upper & Lower Case
      Lesson(
        id: 'scratch_27',
        title: 'String Upper & Lower Case',
        description: 'Converting string case',
        content:
            '.toUpperCase(), .toLowerCase()\n\nConvert text to uppercase or lowercase.',
        level: LearningLevel.scratch,
        order: 27,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_27_ex1',
            title: 'Case Conversion',
            code:
                'String name = "monarch";\nSystem.out.println(name.toUpperCase()); // MONARCH\nSystem.out.println(name.toLowerCase()); // monarch',
            output: 'MONARCH\nmonarch',
            explanation: 'String methods can convert text to different cases.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'toUpperCase()',
            definition: 'convert to uppercase',
          ),
          GlossaryTerm(
            term: 'toLowerCase()',
            definition: 'convert to lowercase',
          ),
        ],
      ),

      // Add remaining lessons 28-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 28: String CharAt
      Lesson(
        id: 'scratch_28',
        title: 'String CharAt',
        description: 'Getting a character at a specific position',
        content: 'Get a character at index\n\nIndex starts from 0.',
        level: LearningLevel.scratch,
        order: 28,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_28_ex1',
            title: 'CharAt Method',
            code:
                'String name = "Java";\nSystem.out.println(name.charAt(2)); // v',
            output: 'v',
            explanation:
                'charAt() method gets the character at a specific position.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'charAt()',
            definition: 'get character at position',
          ),
          GlossaryTerm(term: 'Index', definition: 'position starting from 0'),
        ],
      ),

      // Add remaining lessons 29-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 29: String Equals
      Lesson(
        id: 'scratch_29',
        title: 'String Equals',
        description: 'Comparing strings for equality',
        content:
            'Compare text: .equals()\n\nUse equals() to compare strings, not ==.',
        level: LearningLevel.scratch,
        order: 29,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_29_ex1',
            title: 'String Comparison',
            code:
                'String a = "Java";\nString b = "java";\nSystem.out.println(a.equals(b)); // false\nSystem.out.println(a.equals("Java")); // true',
            output: 'false\ntrue',
            explanation: 'Use equals() method to compare strings for equality.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'equals()', definition: 'compare strings'),
        ],
      ),

      // Add remaining lessons 30-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 30: String Substring
      Lesson(
        id: 'scratch_30',
        title: 'String Substring',
        description: 'Getting part of a string',
        content:
            'Get part of string: .substring(start, end)\n\nExtract a portion of text.',
        level: LearningLevel.scratch,
        order: 30,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_30_ex1',
            title: 'Substring Method',
            code:
                'String text = "Java Programming";\nSystem.out.println(text.substring(0, 4)); // Java',
            output: 'Java',
            explanation: 'substring() method extracts a portion of a string.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'substring()', definition: 'get part of string'),
        ],
      ),

      // Add remaining lessons 31-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 31: Comments Recap
      Lesson(
        id: 'scratch_31',
        title: 'Comments Recap',
        description: 'Review of comment types',
        content:
            '// single line, /* ... */ multi-line\n\nComments help explain code.',
        level: LearningLevel.scratch,
        order: 31,
        estimatedMinutes: 4,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_31_ex1',
            title: 'Comment Examples',
            code:
                '// Print message\nSystem.out.println("Comment example");\n\n/* This is a\n   multi-line comment */',
            output: 'Comment example',
            explanation: 'Comments help document your code.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Comments', definition: 'code documentation'),
        ],
      ),

      // Add remaining lessons 32-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 32: Data Types Recap
      Lesson(
        id: 'scratch_32',
        title: 'Data Types Recap',
        description: 'Review of all data types',
        content:
            'int, double, char, String, boolean\n\nEach type has specific uses.',
        level: LearningLevel.scratch,
        order: 32,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_32_ex1',
            title: 'Data Types Review',
            code:
                'int a = 10;\ndouble b = 5.5;\nchar c = \'A\';\nString d = "Hello";\nboolean e = true;',
            output: 'No output - variable declarations',
            explanation:
                'Different data types for different kinds of information.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Data types', definition: 'types of information'),
        ],
      ),

      // Add remaining lessons 33-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 33: Type Casting Recap
      Lesson(
        id: 'scratch_33',
        title: 'Type Casting Recap',
        description: 'Review of type conversion',
        content: 'Widening & Narrowing\n\nConvert between different types.',
        level: LearningLevel.scratch,
        order: 33,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_33_ex1',
            title: 'Type Casting Review',
            code:
                'int a = 10;\ndouble b = a; // widening\ndouble x = 9.8;\nint y = (int)x; // narrowing',
            output: 'No output - type conversions',
            explanation: 'Type casting converts between different data types.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Type casting',
            definition: 'convert between types',
          ),
        ],
      ),

      // Add remaining lessons 34-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 34: Math Functions Recap
      Lesson(
        id: 'scratch_34',
        title: 'Math Functions Recap',
        description: 'Review of mathematical functions',
        content: 'Math.sqrt(), Math.pow()\n\nUseful mathematical operations.',
        level: LearningLevel.scratch,
        order: 34,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_34_ex1',
            title: 'Math Functions Review',
            code:
                'System.out.println(Math.sqrt(16)); // 4\nSystem.out.println(Math.pow(2,3)); // 8',
            output: '4.0\n8.0',
            explanation: 'Math class provides useful mathematical functions.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Math class',
            definition: 'mathematical functions',
          ),
        ],
      ),

      // Add remaining lessons 35-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 35: Printing Special Characters
      Lesson(
        id: 'scratch_35',
        title: 'Printing Special Characters',
        description: 'Handling special characters in output',
        content:
            'Backslash \\\\, double quote \\"\n\nUse escape sequences for special characters.',
        level: LearningLevel.scratch,
        order: 35,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_35_ex1',
            title: 'Special Characters',
            code:
                'System.out.println("Path: C:\\\\Users\\\\Java");\nSystem.out.println("She said: \\"Hello\\"");',
            output: 'Path: C:\\Users\\Java\nShe said: "Hello"',
            explanation: 'Use escape sequences to print special characters.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Escape sequences',
            definition: 'special characters',
          ),
        ],
      ),

      // Add remaining lessons 36-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 36: Boolean Basics
      Lesson(
        id: 'scratch_36',
        title: 'Boolean Basics',
        description: 'Working with true/false values',
        content: 'true / false\n\nBoolean values for conditions.',
        level: LearningLevel.scratch,
        order: 36,
        estimatedMinutes: 4,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_36_ex1',
            title: 'Boolean Values',
            code:
                'boolean isJavaFun = true;\nSystem.out.println(isJavaFun); // true',
            output: 'true',
            explanation: 'Boolean variables store true or false values.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'boolean', definition: 'true/false'),
        ],
      ),

      // Add remaining lessons 37-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 37: Simple Quiz Demo
      Lesson(
        id: 'scratch_37',
        title: 'Simple Quiz Demo',
        description: 'Combining all concepts in a practical example',
        content:
            'Combine text and variables in print\n\nCreate a simple interactive program.',
        level: LearningLevel.scratch,
        order: 37,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_37_ex1',
            title: 'Quiz Program',
            code:
                'String name = "Monarch";\nint score = 10;\nSystem.out.println(name + " scored " + score + " points!");',
            output: 'Monarch scored 10 points!',
            explanation: 'This example combines variables, text, and output.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Quiz', definition: 'test or question'),
        ],
      ),

      // Add remaining lessons 38-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 38: Variables Recap
      Lesson(
        id: 'scratch_38',
        title: 'Variables Recap',
        description: 'Review of variable concepts',
        content: 'Name, type, value\n\nVariables store information.',
        level: LearningLevel.scratch,
        order: 38,
        estimatedMinutes: 4,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_38_ex1',
            title: 'Variable Review',
            code: 'int num = 10;\ndouble price = 99.99;\nString name = "Java";',
            output: 'No output - variable declarations',
            explanation: 'Variables store different types of data.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Variables', definition: 'containers for data'),
        ],
      ),

      // Add remaining lessons 39-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the scratch level

      // Lesson 39: Printing Variables
      Lesson(
        id: 'scratch_39',
        title: 'Printing Variables',
        description: 'Displaying variable values',
        content:
            'Combine text and variables using +\n\nShow variable values in output.',
        level: LearningLevel.scratch,
        order: 39,
        estimatedMinutes: 4,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_39_ex1',
            title: 'Printing Variables',
            code: 'int age = 20;\nSystem.out.println("Your age is " + age);',
            output: 'Your age is 20',
            explanation: 'Combine text and variables using + operator.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'String concatenation',
            definition: 'join text and variables',
          ),
        ],
      ),

      // Add remaining lesson 40 as needed...
      // For brevity, I'll add the final lesson to complete the scratch level

      // Lesson 40: Final Quiz
      Lesson(
        id: 'scratch_40',
        title: 'Final Quiz',
        description: 'Test your understanding of Java basics',
        content:
            'Combine all previous knowledge\n\nCreate a complete Java program.',
        level: LearningLevel.scratch,
        order: 40,
        estimatedMinutes: 10,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'scratch_40_ex1',
            title: 'Complete Program',
            code:
                'class FinalQuiz {\n    public static void main(String[] args) {\n        String name = "Student";\n        int age = 18;\n        double gpa = 3.8;\n        boolean isPassed = true;\n        \n        System.out.println("Name: " + name);\n        System.out.println("Age: " + age);\n        System.out.println("GPA: " + gpa);\n        System.out.println("Passed: " + isPassed);\n    }\n}',
            output: 'Name: Student\nAge: 18\nGPA: 3.8\nPassed: true',
            explanation:
                'This program combines all the concepts learned in scratch level.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Complete program',
            definition: 'working Java application',
          ),
        ],
      ),
    ];
  }
}
