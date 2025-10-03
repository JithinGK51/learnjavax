import '../../models/simple_models.dart';

class BeginnerLessonsPart2 {
  static List<Lesson> getLessons() {
    return [
      // Lesson 6: Operators
      Lesson(
        id: 'beginner_6',
        title: 'Operators',
        description: 'Math and comparison tools in Java',
        content:
            'Operators are like tools to do math or compare things.\n\nReal-life example: Add your apples + friend\'s apples.',
        level: LearningLevel.beginner,
        order: 6,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_6_ex1',
            title: 'Arithmetic Operators',
            code:
                'int a = 5, b = 3;\nSystem.out.println("Add: " + (a + b));\nSystem.out.println("Subtract: " + (a - b));\nSystem.out.println("Multiply: " + (a * b));\nSystem.out.println("Divide: " + (a / b));\nSystem.out.println("Remainder: " + (a % b));',
            output:
                'Add: 8\nSubtract: 2\nMultiply: 15\nDivide: 1\nRemainder: 2',
            explanation:
                'Arithmetic operators perform mathematical operations.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: '+, -, *, /, %',
            definition: 'arithmetic operators',
          ),
        ],
      ),

      // Continue with remaining lessons 7-40...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 7: Relational Operators
      Lesson(
        id: 'beginner_7',
        title: 'Relational Operators',
        description: 'Comparing values in Java',
        content:
            'Compare two things to see true or false.\n\nReal-life example: Are you taller than your friend?',
        level: LearningLevel.beginner,
        order: 7,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_7_ex1',
            title: 'Comparison Operators',
            code:
                'int myHeight = 170;\nint friendHeight = 165;\nSystem.out.println(myHeight > friendHeight); // true\nSystem.out.println(myHeight == friendHeight); // false',
            output: 'true\nfalse',
            explanation:
                'Relational operators compare two values and return true or false.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: '>, <, ==, !=, >=, <=', definition: 'comparison'),
        ],
      ),

      // Add remaining lessons 8-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 8: Logical Operators
      Lesson(
        id: 'beginner_8',
        title: 'Logical Operators',
        description: 'Combining multiple conditions',
        content:
            'Combine multiple conditions.\n\nReal-life example: Go outside if it\'s sunny AND you have no homework.',
        level: LearningLevel.beginner,
        order: 8,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_8_ex1',
            title: 'Logical Operations',
            code:
                'boolean sunny = true;\nboolean homeworkDone = false;\nSystem.out.println(sunny && homeworkDone); // false\nSystem.out.println(sunny || homeworkDone); // true\nSystem.out.println(!sunny); // false',
            output: 'false\ntrue\nfalse',
            explanation: 'Logical operators combine boolean values.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: '&&', definition: 'and'),
          GlossaryTerm(term: '||', definition: 'or'),
          GlossaryTerm(term: '!', definition: 'not'),
        ],
      ),

      // Add remaining lessons 9-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 9: If Statement
      Lesson(
        id: 'beginner_9',
        title: 'If Statement',
        description: 'Making decisions in your program',
        content:
            'Do something only if a condition is true.\n\nReal-life example: If it\'s raining, take an umbrella.',
        level: LearningLevel.beginner,
        order: 9,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_9_ex1',
            title: 'Simple If Statement',
            code:
                'int age = 18;\nif(age >= 18) {\n    System.out.println("You are adult");\n}',
            output: 'You are adult',
            explanation:
                'If statement executes code only when condition is true.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'if', definition: 'check condition'),
        ],
      ),

      // Add remaining lessons 10-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 10: If-Else Statement
      Lesson(
        id: 'beginner_10',
        title: 'If-Else Statement',
        description: 'Making decisions with alternatives',
        content:
            'Do one thing if true, another if false.\n\nReal-life example: If it rains → take umbrella, else → wear sunglasses.',
        level: LearningLevel.beginner,
        order: 10,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_10_ex1',
            title: 'If-Else Example',
            code:
                'int age = 16;\nif(age >= 18) {\n    System.out.println("Adult");\n} else {\n    System.out.println("Minor");\n}',
            output: 'Minor',
            explanation:
                'If-else provides alternative actions based on condition.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'else', definition: 'runs if condition false'),
        ],
      ),

      // Add remaining lessons 11-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 11: Switch Statement
      Lesson(
        id: 'beginner_11',
        title: 'Switch Statement',
        description: 'Choosing from multiple options',
        content:
            'Check one value from many choices.\n\nReal-life example: Choose fruit based on number: 1 → Apple, 2 → Banana, etc.',
        level: LearningLevel.beginner,
        order: 11,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_11_ex1',
            title: 'Switch Statement Example',
            code:
                'int choice = 2;\nswitch(choice) {\n    case 1: System.out.println("Apple"); break;\n    case 2: System.out.println("Banana"); break;\n    default: System.out.println("Other fruit");\n}',
            output: 'Banana',
            explanation:
                'Switch statement chooses one option from many based on value.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'case', definition: 'option'),
          GlossaryTerm(term: 'default', definition: 'fallback'),
        ],
      ),

      // Add remaining lessons 12-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 12: While Loop
      Lesson(
        id: 'beginner_12',
        title: 'While Loop',
        description: 'Repeating code while condition is true',
        content:
            'Repeat something while a condition is true.\n\nReal-life example: Keep pouring water until the glass is full.',
        level: LearningLevel.beginner,
        order: 12,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_12_ex1',
            title: 'While Loop Example',
            code:
                'int i = 1;\nwhile(i <= 5) {\n    System.out.println("Number: " + i);\n    i++;\n}',
            output: 'Number: 1\nNumber: 2\nNumber: 3\nNumber: 4\nNumber: 5',
            explanation: 'While loop repeats code while condition is true.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'loop', definition: 'repeat action'),
        ],
      ),

      // Add remaining lessons 13-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 13: Do-While Loop
      Lesson(
        id: 'beginner_13',
        title: 'Do-While Loop',
        description: 'Loop that runs at least once',
        content:
            'Loop that runs at least once, then checks condition.\n\nReal-life example: At least take one candy, then check if you want more.',
        level: LearningLevel.beginner,
        order: 13,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_13_ex1',
            title: 'Do-While Loop Example',
            code:
                'int i = 1;\ndo {\n    System.out.println("Candy " + i);\n    i++;\n} while(i <= 3);',
            output: 'Candy 1\nCandy 2\nCandy 3',
            explanation:
                'Do-while loop runs at least once before checking condition.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'do-while', definition: 'run first, check later'),
        ],
      ),

      // Add remaining lessons 14-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 14: For Loop
      Lesson(
        id: 'beginner_14',
        title: 'For Loop',
        description: 'Repeating code a fixed number of times',
        content:
            'Repeat code a fixed number of times.\n\nReal-life example: Clap hands 5 times.',
        level: LearningLevel.beginner,
        order: 14,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_14_ex1',
            title: 'For Loop Example',
            code:
                'for(int i=1; i<=5; i++) {\n    System.out.println("Clap " + i);\n}',
            output: 'Clap 1\nClap 2\nClap 3\nClap 4\nClap 5',
            explanation: 'For loop repeats code a specific number of times.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'initialization', definition: 'start'),
          GlossaryTerm(term: 'increment', definition: 'step'),
        ],
      ),

      // Add remaining lessons 15-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 15: Nested Loops
      Lesson(
        id: 'beginner_15',
        title: 'Nested Loops',
        description: 'Loop inside another loop',
        content:
            'Loop inside another loop.\n\nReal-life example: Rows and columns in a chessboard.',
        level: LearningLevel.beginner,
        order: 15,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_15_ex1',
            title: 'Nested Loops Example',
            code:
                'for(int row=1; row<=3; row++) {\n    for(int col=1; col<=2; col++) {\n        System.out.println("Row: " + row + ", Col: " + col);\n    }\n}',
            output:
                'Row: 1, Col: 1\nRow: 1, Col: 2\nRow: 2, Col: 1\nRow: 2, Col: 2\nRow: 3, Col: 1\nRow: 3, Col: 2',
            explanation: 'Nested loops create patterns with rows and columns.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'nested', definition: 'inside another'),
        ],
      ),

      // Add remaining lessons 16-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 16: Break Statement
      Lesson(
        id: 'beginner_16',
        title: 'Break Statement',
        description: 'Stopping a loop immediately',
        content:
            'Stop the loop immediately.\n\nReal-life example: Stop cleaning if room is tidy.',
        level: LearningLevel.beginner,
        order: 16,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_16_ex1',
            title: 'Break Statement Example',
            code:
                'for(int i=1; i<=5; i++) {\n    if(i==3) break;\n    System.out.println(i);\n}',
            output: '1\n2',
            explanation: 'Break statement stops the loop immediately.',
          ),
        ],
        glossaryTerms: [GlossaryTerm(term: 'break', definition: 'stop loop')],
      ),

      // Add remaining lessons 17-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 17: Continue Statement
      Lesson(
        id: 'beginner_17',
        title: 'Continue Statement',
        description: 'Skipping current loop iteration',
        content:
            'Skip current loop step, continue next.\n\nReal-life example: Skip eating candy you don\'t like, eat next.',
        level: LearningLevel.beginner,
        order: 17,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_17_ex1',
            title: 'Continue Statement Example',
            code:
                'for(int i=1; i<=5; i++) {\n    if(i==3) continue;\n    System.out.println(i);\n}',
            output: '1\n2\n4\n5',
            explanation:
                'Continue statement skips current iteration and continues with next.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'continue', definition: 'skip one step'),
        ],
      ),

      // Add remaining lessons 18-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 18: Arrays Introduction
      Lesson(
        id: 'beginner_18',
        title: 'Arrays Introduction',
        description: 'Storing multiple values in one variable',
        content:
            'Store multiple values in one variable.\n\nReal-life example: A box containing multiple candies.',
        level: LearningLevel.beginner,
        order: 18,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_18_ex1',
            title: 'Array Declaration and Access',
            code:
                'int[] candies = {5, 10, 15};\nSystem.out.println(candies[1]); // 10',
            output: '10',
            explanation:
                'Arrays store multiple values and access them by index.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'index', definition: 'position starting from 0'),
        ],
      ),

      // Add remaining lessons 19-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 19: Array Length
      Lesson(
        id: 'beginner_19',
        title: 'Array Length',
        description: 'Finding the size of an array',
        content:
            '.length tells total items in array.\n\nReal-life example: Count total candies in the box.',
        level: LearningLevel.beginner,
        order: 19,
        estimatedMinutes: 4,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_19_ex1',
            title: 'Array Length Example',
            code:
                'int[] candies = {5,10,15};\nSystem.out.println(candies.length); // 3',
            output: '3',
            explanation:
                'length property gives the number of elements in array.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'length', definition: 'total items'),
        ],
      ),

      // Add remaining lessons 20-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 20: For Loop with Arrays
      Lesson(
        id: 'beginner_20',
        title: 'For Loop with Arrays',
        description: 'Accessing all array elements using loops',
        content:
            'Access all items using a loop.\n\nReal-life example: Look at all candies in the box one by one.',
        level: LearningLevel.beginner,
        order: 20,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_20_ex1',
            title: 'Looping Through Array',
            code:
                'int[] candies = {5,10,15};\nfor(int i=0; i<candies.length; i++){\n    System.out.println(candies[i]);\n}',
            output: '5\n10\n15',
            explanation: 'For loop with arrays accesses each element by index.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'traverse', definition: 'visit each item'),
        ],
      ),

      // Add remaining lessons 21-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 21: Methods Introduction
      Lesson(
        id: 'beginner_21',
        title: 'Methods Introduction',
        description: 'Creating reusable blocks of code',
        content:
            'Method = reusable block of code.\n\nReal-life example: Like a recipe used many times.',
        level: LearningLevel.beginner,
        order: 21,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_21_ex1',
            title: 'Simple Method',
            code:
                'static void greet() {\n    System.out.println("Hello!");\n}\npublic static void main(String[] args) {\n    greet();\n}',
            output: 'Hello!',
            explanation:
                'Methods allow you to reuse code by calling them multiple times.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'method', definition: 'function, reusable'),
        ],
      ),

      // Add remaining lessons 22-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 22: Method with Parameters
      Lesson(
        id: 'beginner_22',
        title: 'Method with Parameters',
        description: 'Passing information to methods',
        content:
            'Give information to method to use.\n\nReal-life example: Like giving ingredients to a recipe.',
        level: LearningLevel.beginner,
        order: 22,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_22_ex1',
            title: 'Method with Parameter',
            code:
                'static void greet(String name){\n    System.out.println("Hello " + name);\n}\ngreet("Monarch");',
            output: 'Hello Monarch',
            explanation: 'Parameters allow methods to receive input values.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'parameter', definition: 'input value'),
        ],
      ),

      // Add remaining lessons 23-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 23: Method with Return Value
      Lesson(
        id: 'beginner_23',
        title: 'Method with Return Value',
        description: 'Methods that give back results',
        content:
            'Method can give back a value.\n\nReal-life example: Like a calculator that gives you the answer.',
        level: LearningLevel.beginner,
        order: 23,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_23_ex1',
            title: 'Method with Return',
            code:
                'static int add(int a,int b){\n    return a+b;\n}\nint sum = add(5,3);\nSystem.out.println(sum); // 8',
            output: '8',
            explanation:
                'Methods can return values using the return statement.',
          ),
        ],
        glossaryTerms: [GlossaryTerm(term: 'return', definition: 'output')],
      ),

      // Add remaining lessons 24-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 24: Method Overloading
      Lesson(
        id: 'beginner_24',
        title: 'Method Overloading',
        description: 'Same method name, different parameters',
        content:
            'Same method name, different parameters.\n\nReal-life example: Like having different recipes with the same name but different ingredients.',
        level: LearningLevel.beginner,
        order: 24,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_24_ex1',
            title: 'Method Overloading Example',
            code:
                'static int add(int a,int b){ return a+b; }\nstatic double add(double a,double b){ return a+b; }',
            output: 'No output - method definitions',
            explanation:
                'Method overloading allows same method name with different parameter types.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'overloading',
            definition: 'same name, different input',
          ),
        ],
      ),

      // Add remaining lessons 25-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 25: Introduction to OOP
      Lesson(
        id: 'beginner_25',
        title: 'Introduction to OOP',
        description: 'Object-Oriented Programming basics',
        content:
            'OOP = Object-Oriented Programming. We use objects and classes.\n\nReal-life example: Car class → many car objects.',
        level: LearningLevel.beginner,
        order: 25,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_25_ex1',
            title: 'OOP Concept',
            code:
                '// OOP uses classes and objects\n// Class is like a blueprint\n// Object is like a house built from blueprint',
            output: 'No output - conceptual explanation',
            explanation: 'OOP organizes code using classes and objects.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'class', definition: 'blueprint'),
          GlossaryTerm(term: 'object', definition: 'instance'),
        ],
      ),

      // Add remaining lessons 26-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 26: Creating Objects
      Lesson(
        id: 'beginner_26',
        title: 'Creating Objects',
        description: 'Making objects from classes',
        content:
            'Create an object from class.\n\nReal-life example: Building a house from a blueprint.',
        level: LearningLevel.beginner,
        order: 26,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_26_ex1',
            title: 'Creating Object',
            code: 'class Car {}\nCar c1 = new Car();',
            output: 'No output - object creation',
            explanation: 'Objects are created using the new keyword.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'object', definition: 'live instance of class'),
        ],
      ),

      // Add remaining lessons 27-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 27: Instance Variables
      Lesson(
        id: 'beginner_27',
        title: 'Instance Variables',
        description: 'Variables that belong to objects',
        content:
            'Variables inside object.\n\nReal-life example: Each car has its own color, model, etc.',
        level: LearningLevel.beginner,
        order: 27,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_27_ex1',
            title: 'Instance Variables',
            code:
                'class Car {\n    String color;\n}\nCar c1 = new Car();\nc1.color = "Red";\nSystem.out.println(c1.color);',
            output: 'Red',
            explanation: 'Instance variables belong to specific objects.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'instance variable',
            definition: 'belongs to object',
          ),
        ],
      ),

      // Add remaining lessons 28-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 28: Constructor
      Lesson(
        id: 'beginner_28',
        title: 'Constructor',
        description: 'Special method to initialize objects',
        content:
            'Special method to set object data when created.\n\nReal-life example: Like setting up a new phone when you buy it.',
        level: LearningLevel.beginner,
        order: 28,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_28_ex1',
            title: 'Constructor Example',
            code:
                'class Car {\n    String color;\n    Car(String c){ color = c; }\n}\nCar c1 = new Car("Red");\nSystem.out.println(c1.color);',
            output: 'Red',
            explanation: 'Constructor initializes object when it\'s created.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'constructor', definition: 'initialize object'),
        ],
      ),

      // Add remaining lessons 29-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 29: Static Keyword
      Lesson(
        id: 'beginner_29',
        title: 'Static Keyword',
        description: 'Variables and methods that belong to class',
        content:
            'Belongs to class, not object.\n\nReal-life example: Like a school rule that applies to all students.',
        level: LearningLevel.beginner,
        order: 29,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_29_ex1',
            title: 'Static Variable',
            code:
                'class Car {\n    static int wheels = 4;\n}\nSystem.out.println(Car.wheels);',
            output: '4',
            explanation:
                'Static members belong to the class, not individual objects.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'static', definition: 'belongs to class'),
        ],
      ),

      // Add remaining lessons 30-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 30: Final Keyword
      Lesson(
        id: 'beginner_30',
        title: 'Final Keyword',
        description: 'Creating constants that cannot change',
        content:
            'Cannot change value.\n\nReal-life example: Like your date of birth - it never changes.',
        level: LearningLevel.beginner,
        order: 30,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_30_ex1',
            title: 'Final Variable',
            code: 'final double PI = 3.14;\nSystem.out.println(PI);',
            output: '3.14',
            explanation:
                'Final variables cannot be changed after initialization.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'final', definition: 'unchangeable'),
        ],
      ),

      // Add remaining lessons 31-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 31: String Basics
      Lesson(
        id: 'beginner_31',
        title: 'String Basics',
        description: 'Working with text in Java',
        content:
            'Strings = text.\n\nReal-life example: Like writing a message on paper.',
        level: LearningLevel.beginner,
        order: 31,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_31_ex1',
            title: 'String Declaration',
            code: 'String name = "Monarch";\nSystem.out.println(name);',
            output: 'Monarch',
            explanation: 'Strings store text data in Java.',
          ),
        ],
        glossaryTerms: [GlossaryTerm(term: 'string', definition: 'text')],
      ),

      // Add remaining lessons 32-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 32: String Methods
      Lesson(
        id: 'beginner_32',
        title: 'String Methods',
        description: 'Built-in methods for working with strings',
        content:
            'Use built-in methods like length, toUpperCase, charAt.\n\nReal-life example: Like tools to work with text.',
        level: LearningLevel.beginner,
        order: 32,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_32_ex1',
            title: 'String Methods',
            code:
                'String name = "Java";\nSystem.out.println(name.length()); // 4\nSystem.out.println(name.toUpperCase()); // JAVA\nSystem.out.println(name.charAt(2)); // v',
            output: '4\nJAVA\nv',
            explanation: 'String methods provide useful operations on text.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'length', definition: 'number of letters'),
          GlossaryTerm(term: 'charAt', definition: 'get character'),
        ],
      ),

      // Add remaining lessons 33-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 33: String Concatenation
      Lesson(
        id: 'beginner_33',
        title: 'String Concatenation',
        description: 'Joining strings together',
        content:
            'Join texts using +.\n\nReal-life example: Like putting words together to make a sentence.',
        level: LearningLevel.beginner,
        order: 33,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_33_ex1',
            title: 'String Concatenation',
            code:
                'String first = "Hello";\nString last = "World";\nSystem.out.println(first + " " + last);',
            output: 'Hello World',
            explanation:
                'String concatenation joins multiple strings together.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'concatenation', definition: 'join texts'),
        ],
      ),

      // Add remaining lessons 34-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 34: Scanner Input
      Lesson(
        id: 'beginner_34',
        title: 'Scanner Input',
        description: 'Getting input from user',
        content:
            'Get input from user.\n\nReal-life example: Like asking someone a question and waiting for their answer.',
        level: LearningLevel.beginner,
        order: 34,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_34_ex1',
            title: 'User Input',
            code:
                'import java.util.Scanner;\nScanner sc = new Scanner(System.in);\nSystem.out.print("Enter your name: ");\nString name = sc.nextLine();\nSystem.out.println("Hello " + name);',
            output: 'Enter your name: [user types] Hello [user input]',
            explanation: 'Scanner class allows reading input from user.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Scanner', definition: 'read input'),
        ],
      ),

      // Add remaining lessons 35-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 35: Boolean Basics
      Lesson(
        id: 'beginner_35',
        title: 'Boolean Basics',
        description: 'Working with true/false values',
        content:
            'True/false values.\n\nReal-life example: Like answering yes or no questions.',
        level: LearningLevel.beginner,
        order: 35,
        estimatedMinutes: 5,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_35_ex1',
            title: 'Boolean Variables',
            code: 'boolean isRain = true;\nSystem.out.println(isRain);',
            output: 'true',
            explanation: 'Boolean variables store true or false values.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'boolean', definition: 'true/false'),
        ],
      ),

      // Add remaining lessons 36-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 36: Type Casting
      Lesson(
        id: 'beginner_36',
        title: 'Type Casting',
        description: 'Converting between different data types',
        content:
            'Change one type to another.\n\nReal-life example: Like converting dollars to rupees.',
        level: LearningLevel.beginner,
        order: 36,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_36_ex1',
            title: 'Type Casting',
            code:
                'int a = 10;\ndouble b = a; // int → double\ndouble x = 9.8;\nint y = (int)x; // double → int',
            output: 'No output - type conversions',
            explanation: 'Type casting converts one data type to another.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'casting', definition: 'convert type'),
        ],
      ),

      // Add remaining lessons 37-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 37: Math Class
      Lesson(
        id: 'beginner_37',
        title: 'Math Class',
        description: 'Built-in mathematical functions',
        content:
            'Java has Math tools for calculations.\n\nReal-life example: Calculate area, power, square root, etc.',
        level: LearningLevel.beginner,
        order: 37,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_37_ex1',
            title: 'Math Functions',
            code:
                'System.out.println(Math.sqrt(16)); // 4\nSystem.out.println(Math.pow(2,3)); // 8\nSystem.out.println(Math.max(5,10)); // 10\nSystem.out.println(Math.min(5,10)); // 5',
            output: '4.0\n8.0\n10\n5',
            explanation: 'Math class provides mathematical functions.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'sqrt', definition: 'square root'),
          GlossaryTerm(term: 'pow', definition: 'power'),
          GlossaryTerm(term: 'max', definition: 'bigger'),
          GlossaryTerm(term: 'min', definition: 'smaller'),
        ],
      ),

      // Add remaining lessons 38-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 38: Multi-Dimensional Arrays
      Lesson(
        id: 'beginner_38',
        title: 'Multi-Dimensional Arrays',
        description: 'Arrays with rows and columns',
        content:
            'Array inside array, like rows and columns in a table.\n\nReal-life example: Seats in a classroom (rows × columns).',
        level: LearningLevel.beginner,
        order: 38,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_38_ex1',
            title: '2D Array',
            code:
                'int[][] seats = {{1,2,3},{4,5,6}};\nSystem.out.println(seats[1][0]); // 4',
            output: '4',
            explanation: '2D arrays store data in rows and columns.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: '2D array', definition: 'table-like structure'),
        ],
      ),

      // Add remaining lessons 39-40 as needed...
      // For brevity, I'll add a few more key lessons to complete the beginner level

      // Lesson 39: Enhanced For Loop
      Lesson(
        id: 'beginner_39',
        title: 'Enhanced For Loop',
        description: 'Simple way to loop through arrays',
        content:
            'Simple loop for arrays.\n\nReal-life example: Check each candy in the jar one by one.',
        level: LearningLevel.beginner,
        order: 39,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_39_ex1',
            title: 'Enhanced For Loop',
            code:
                'int[] numbers = {1,2,3,4};\nfor(int num : numbers){\n    System.out.println(num);\n}',
            output: '1\n2\n3\n4',
            explanation: 'Enhanced for loop simplifies array traversal.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'enhanced for',
            definition: 'easy loop through all items',
          ),
        ],
      ),

      // Add remaining lesson 40 as needed...
      // For brevity, I'll add the final lesson to complete the beginner level

      // Lesson 40: Simple Quiz Example
      Lesson(
        id: 'beginner_40',
        title: 'Simple Quiz Example',
        description: 'Combining all concepts in a practical example',
        content:
            'Combine all previous knowledge: variables, input, output, loops.\n\nReal-life example: Ask user a question and check answer.',
        level: LearningLevel.beginner,
        order: 40,
        estimatedMinutes: 10,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'beginner_40_ex1',
            title: 'Complete Quiz Program',
            code:
                'import java.util.Scanner;\nclass Quiz {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        System.out.print("What is 2 + 3? ");\n        int answer = sc.nextInt();\n        if(answer == 5){\n            System.out.println("Correct!");\n        } else {\n            System.out.println("Wrong! The answer is 5.");\n        }\n    }\n}',
            output: 'What is 2 + 3? [user types] Hello [user input]',
            explanation:
                'This example combines variables, input, output, and conditional statements.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'combine',
            definition: 'use many concepts together',
          ),
        ],
      ),
    ];
  }
}
