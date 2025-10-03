import '../../models/simple_models.dart';

class LevelMockTests {
  static List<MockTest> getAllMockTests() {
    final tests = <MockTest>[];

    // Add all level tests
    tests.addAll(getScratchTests());
    tests.addAll(getBeginnerTests());
    tests.addAll(getMiddleTests());
    tests.addAll(getAdvancedTests());
    tests.addAll(getProTests());
    tests.addAll(getMasterTests());

    return tests;
  }

  // Scratch Level Tests (after every 5 lessons)
  static List<MockTest> getScratchTests() {
    return [
      // Test after lessons 1-5
      MockTest(
        id: 'scratch_test_1_5',
        title: 'Scratch Level Test 1',
        description: 'Test your knowledge of Java basics (Lessons 1-5)',
        level: LearningLevel.scratch,
        questions: [
          Question(
            id: 'scratch_q1',
            question: 'Which of these is the entry point of a Java program?',
            options: ['print()', 'start()', 'main()', 'run()'],
            correctAnswerIndex: 2,
            explanation:
                'The main() method is the entry point of every Java program.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q2',
            question: 'Which symbol is used for addition in Java?',
            options: ['-', '+', '*', '/'],
            correctAnswerIndex: 1,
            explanation: 'The + symbol is used for addition in Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q3',
            question:
                'What will this program print?\n\nclass Test {\n    public static void main(String[] args) {\n        int x = 5;\n        int y = 2;\n        System.out.println(x * y);\n    }\n}',
            options: ['10', '25', '7', '52'],
            correctAnswerIndex: 0,
            explanation: '5 * 2 = 10',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q4',
            question: 'Which datatype is correct for storing text in Java?',
            options: ['int', 'String', 'double', 'char'],
            correctAnswerIndex: 1,
            explanation: 'String is used for storing text in Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q5',
            question: 'Which symbol is used for single-line comment in Java?',
            options: ['/*', '//', '#', '<!--'],
            correctAnswerIndex: 1,
            explanation: '// is used for single-line comments in Java.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 10,
        requiredAfterLesson: 5,
      ),
      // Test after lessons 6-10
      MockTest(
        id: 'scratch_test_6_10',
        title: 'Scratch Level Test 2',
        description:
            'Test your knowledge of variables and operators (Lessons 6-10)',
        level: LearningLevel.scratch,
        questions: [
          Question(
            id: 'scratch_q6',
            question: 'Which of these is a valid variable name?',
            options: ['int', '123name', 'myAge', 'public'],
            correctAnswerIndex: 2,
            explanation:
                'myAge is a valid variable name. Variable names cannot start with numbers or be keywords.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q7',
            question: 'What is the result of 10 % 3?',
            options: ['3', '1', '0', '3.33'],
            correctAnswerIndex: 1,
            explanation: 'The % operator gives the remainder. 10 % 3 = 1.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q8',
            question: 'Which operator is used for assignment?',
            options: ['==', '=', '!=', '>='],
            correctAnswerIndex: 1,
            explanation: '= is used for assignment, == is used for comparison.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q9',
            question:
                'What will this print?\n\nint x = 5;\nint y = ++x;\nSystem.out.println(y);',
            options: ['5', '6', '4', 'Error'],
            correctAnswerIndex: 1,
            explanation:
                '++x increments x first, then assigns. So x becomes 6, and y gets 6.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q10',
            question: 'Which is the correct way to declare a constant?',
            options: [
              'const int x = 5;',
              'final int x = 5;',
              'static int x = 5;',
              'int x = 5;',
            ],
            correctAnswerIndex: 1,
            explanation: 'final keyword is used to declare constants in Java.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 10,
        requiredAfterLesson: 10,
      ),
      // Continue with more tests for every 5 lessons...
      MockTest(
        id: 'scratch_test_11_15',
        title: 'Scratch Level Test 3',
        description:
            'Test your knowledge of control structures (Lessons 11-15)',
        level: LearningLevel.scratch,
        questions: [
          Question(
            id: 'scratch_q11',
            question: 'Which keyword is used for conditional statements?',
            options: ['if', 'for', 'while', 'switch'],
            correctAnswerIndex: 0,
            explanation: 'if is used for conditional statements.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q12',
            question:
                'What will this code print?\n\nint x = 10;\nif (x > 5) {\n    System.out.println("Big");\n} else {\n    System.out.println("Small");\n}',
            options: ['Big', 'Small', 'Nothing', 'Error'],
            correctAnswerIndex: 0,
            explanation: 'Since x (10) is greater than 5, it prints "Big".',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q13',
            question: 'Which loop runs at least once?',
            options: ['for', 'while', 'do-while', 'if'],
            correctAnswerIndex: 2,
            explanation:
                'do-while loop executes the body at least once before checking the condition.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q14',
            question:
                'How many times will this loop run?\n\nfor (int i = 0; i < 3; i++) {\n    System.out.println(i);\n}',
            options: ['2', '3', '4', 'Infinite'],
            correctAnswerIndex: 1,
            explanation: 'The loop runs for i = 0, 1, 2, which is 3 times.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q15',
            question: 'Which statement is used to exit a loop early?',
            options: ['return', 'break', 'continue', 'exit'],
            correctAnswerIndex: 1,
            explanation: 'break is used to exit a loop early.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 10,
        requiredAfterLesson: 15,
      ),
      // Add more tests for lessons 16-20, 21-25, 26-30, 31-35, 36-40
      MockTest(
        id: 'scratch_test_16_20',
        title: 'Scratch Level Test 4',
        description:
            'Test your knowledge of arrays and strings (Lessons 16-20)',
        level: LearningLevel.scratch,
        questions: [
          Question(
            id: 'scratch_q16',
            question: 'How do you declare an array of integers?',
            options: [
              'int[] arr;',
              'int arr[];',
              'array int arr;',
              'Both A and B',
            ],
            correctAnswerIndex: 3,
            explanation:
                'Both int[] arr; and int arr[]; are valid ways to declare an array.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q17',
            question: 'What is the index of the first element in an array?',
            options: ['0', '1', '-1', 'It depends'],
            correctAnswerIndex: 0,
            explanation: 'Array indices start from 0 in Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q18',
            question: 'Which method gets the length of a string?',
            options: ['length()', 'size()', 'count()', 'getLength()'],
            correctAnswerIndex: 0,
            explanation: 'length() method returns the length of a string.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q19',
            question:
                'What will this print?\n\nString s = "Hello";\nSystem.out.println(s.length());',
            options: ['4', '5', '6', 'Error'],
            correctAnswerIndex: 1,
            explanation: '"Hello" has 5 characters, so length() returns 5.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q20',
            question: 'Which operator is used to concatenate strings?',
            options: ['+', '&', 'concat', 'join'],
            correctAnswerIndex: 0,
            explanation: '+ operator is used to concatenate strings in Java.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 10,
        requiredAfterLesson: 20,
      ),
      // Continue with remaining tests...
      MockTest(
        id: 'scratch_test_21_25',
        title: 'Scratch Level Test 5',
        description:
            'Test your knowledge of methods and functions (Lessons 21-25)',
        level: LearningLevel.scratch,
        questions: [
          Question(
            id: 'scratch_q21',
            question: 'What keyword is used to define a method?',
            options: ['method', 'function', 'def', 'No keyword needed'],
            correctAnswerIndex: 3,
            explanation:
                'In Java, methods are defined without a specific keyword, just with return type and name.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q22',
            question: 'What does void mean in a method declaration?',
            options: [
              'Returns nothing',
              'Returns null',
              'Returns void',
              'Error',
            ],
            correctAnswerIndex: 0,
            explanation: 'void means the method does not return any value.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q23',
            question: 'How do you call a method named "printMessage"?',
            options: [
              'printMessage()',
              'call printMessage()',
              'invoke printMessage()',
              'All of the above',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Methods are called by their name followed by parentheses.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q24',
            question: 'What is a parameter in a method?',
            options: [
              'Return value',
              'Input value',
              'Method name',
              'Access modifier',
            ],
            correctAnswerIndex: 1,
            explanation: 'Parameters are input values passed to a method.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q25',
            question: 'Which keyword is used to return a value from a method?',
            options: ['return', 'give', 'send', 'output'],
            correctAnswerIndex: 0,
            explanation:
                'return keyword is used to return a value from a method.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 10,
        requiredAfterLesson: 25,
      ),
      MockTest(
        id: 'scratch_test_26_30',
        title: 'Scratch Level Test 6',
        description:
            'Test your knowledge of classes and objects (Lessons 26-30)',
        level: LearningLevel.scratch,
        questions: [
          Question(
            id: 'scratch_q26',
            question: 'What is a class in Java?',
            options: [
              'A method',
              'A blueprint for objects',
              'A variable',
              'A loop',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A class is a blueprint or template for creating objects.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q27',
            question: 'What keyword is used to create an object?',
            options: ['new', 'create', 'make', 'object'],
            correctAnswerIndex: 0,
            explanation: 'new keyword is used to create objects in Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q28',
            question: 'What are the characteristics of an object?',
            options: [
              'State and behavior',
              'Methods only',
              'Variables only',
              'Nothing',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Objects have state (variables) and behavior (methods).',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q29',
            question: 'What is an instance of a class?',
            options: ['A class', 'An object', 'A method', 'A variable'],
            correctAnswerIndex: 1,
            explanation:
                'An instance of a class is an object created from that class.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q30',
            question: 'How do you access a method of an object?',
            options: [
              'object.method()',
              'method(object)',
              'object->method()',
              'All of the above',
            ],
            correctAnswerIndex: 0,
            explanation: 'Use dot notation: object.method() to access methods.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 10,
        requiredAfterLesson: 30,
      ),
      MockTest(
        id: 'scratch_test_31_35',
        title: 'Scratch Level Test 7',
        description:
            'Test your knowledge of constructors and inheritance (Lessons 31-35)',
        level: LearningLevel.scratch,
        questions: [
          Question(
            id: 'scratch_q31',
            question: 'What is a constructor?',
            options: [
              'A method',
              'A special method to initialize objects',
              'A variable',
              'A class',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A constructor is a special method used to initialize objects.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q32',
            question: 'What is the name of the constructor?',
            options: ['constructor', 'init', 'Same as class name', 'build'],
            correctAnswerIndex: 2,
            explanation: 'Constructor has the same name as the class.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q33',
            question: 'What is inheritance in Java?',
            options: [
              'Creating objects',
              'Reusing code from parent class',
              'Creating methods',
              'Creating variables',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Inheritance allows a class to reuse code from a parent class.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q34',
            question: 'Which keyword is used for inheritance?',
            options: ['inherits', 'extends', 'implements', 'uses'],
            correctAnswerIndex: 1,
            explanation: 'extends keyword is used for inheritance in Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q35',
            question: 'What is the parent class of all classes in Java?',
            options: ['Parent', 'Base', 'Object', 'Root'],
            correctAnswerIndex: 2,
            explanation: 'Object is the parent class of all classes in Java.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 10,
        requiredAfterLesson: 35,
      ),
      MockTest(
        id: 'scratch_test_36_40',
        title: 'Scratch Level Test 8',
        description:
            'Test your knowledge of polymorphism and encapsulation (Lessons 36-40)',
        level: LearningLevel.scratch,
        questions: [
          Question(
            id: 'scratch_q36',
            question: 'What is polymorphism?',
            options: [
              'One name, many forms',
              'Many names, one form',
              'One class, one method',
              'Many classes, one method',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Polymorphism means one name can have many forms (method overriding/overloading).',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q37',
            question: 'What is encapsulation?',
            options: [
              'Hiding data',
              'Showing data',
              'Creating objects',
              'Creating methods',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Encapsulation is the concept of hiding data and providing access through methods.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q38',
            question: 'Which access modifier provides the most restriction?',
            options: ['public', 'private', 'protected', 'default'],
            correctAnswerIndex: 1,
            explanation:
                'private provides the most restriction, only accessible within the same class.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q39',
            question: 'What is method overriding?',
            options: [
              'Creating a new method',
              'Changing method signature',
              'Providing new implementation in child class',
              'Deleting a method',
            ],
            correctAnswerIndex: 2,
            explanation:
                'Method overriding is providing a new implementation of a method in the child class.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'scratch_q40',
            question: 'Which keyword is used to call parent class method?',
            options: ['parent', 'super', 'base', 'this'],
            correctAnswerIndex: 1,
            explanation:
                'super keyword is used to call parent class methods or constructor.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 10,
        requiredAfterLesson: 40,
      ),
    ];
  }

  // Beginner Level Tests (after every 5 lessons)
  static List<MockTest> getBeginnerTests() {
    return [
      MockTest(
        id: 'beginner_test_1_5',
        title: 'Beginner Level Test 1',
        description: 'Test your knowledge of OOP basics (Lessons 1-5)',
        level: LearningLevel.beginner,
        questions: [
          Question(
            id: 'beginner_q1',
            question: 'What are the four pillars of OOP?',
            options: [
              'Encapsulation, Inheritance, Polymorphism, Abstraction',
              'Class, Object, Method, Variable',
              'Public, Private, Protected, Default',
              'If, For, While, Switch',
            ],
            correctAnswerIndex: 0,
            explanation:
                'The four pillars of OOP are Encapsulation, Inheritance, Polymorphism, and Abstraction.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q2',
            question: 'What is an abstract class?',
            options: [
              'A class that cannot be instantiated',
              'A class with no methods',
              'A class with no variables',
              'A class that cannot be extended',
            ],
            correctAnswerIndex: 0,
            explanation:
                'An abstract class cannot be instantiated directly and may contain abstract methods.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q3',
            question: 'What is an interface in Java?',
            options: [
              'A class',
              'A blueprint for methods',
              'A variable',
              'A constructor',
            ],
            correctAnswerIndex: 1,
            explanation:
                'An interface is a blueprint for methods that implementing classes must define.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q4',
            question: 'Which keyword is used to implement an interface?',
            options: ['extends', 'implements', 'inherits', 'uses'],
            correctAnswerIndex: 1,
            explanation:
                'implements keyword is used to implement an interface.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q5',
            question: 'What is method overloading?',
            options: [
              'Changing method name',
              'Having multiple methods with same name but different parameters',
              'Deleting a method',
              'Making method private',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Method overloading is having multiple methods with the same name but different parameters.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 15,
        requiredAfterLesson: 5,
      ),
      // Add more beginner tests for every 5 lessons...
      MockTest(
        id: 'beginner_test_6_10',
        title: 'Beginner Level Test 2',
        description: 'Test your knowledge of exception handling (Lessons 6-10)',
        level: LearningLevel.beginner,
        questions: [
          Question(
            id: 'beginner_q6',
            question: 'What is an exception in Java?',
            options: [
              'A method',
              'An error that occurs during runtime',
              'A class',
              'A variable',
            ],
            correctAnswerIndex: 1,
            explanation:
                'An exception is an error that occurs during the execution of a program.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q7',
            question: 'Which keyword is used to handle exceptions?',
            options: ['try', 'catch', 'finally', 'All of the above'],
            correctAnswerIndex: 3,
            explanation:
                'try, catch, and finally are all used for exception handling.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q8',
            question: 'What happens if an exception is not caught?',
            options: [
              'Program continues',
              'Program terminates',
              'Nothing',
              'Program slows down',
            ],
            correctAnswerIndex: 1,
            explanation:
                'If an exception is not caught, the program will terminate.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q9',
            question: 'Which block always executes?',
            options: ['try', 'catch', 'finally', 'throw'],
            correctAnswerIndex: 2,
            explanation:
                'finally block always executes, regardless of whether an exception occurs.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q10',
            question: 'What is the purpose of the throw keyword?',
            options: [
              'To catch exceptions',
              'To create custom exceptions',
              'To handle exceptions',
              'To ignore exceptions',
            ],
            correctAnswerIndex: 1,
            explanation:
                'throw keyword is used to create and throw custom exceptions.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 15,
        requiredAfterLesson: 10,
      ),
      // Continue with more beginner tests...
      MockTest(
        id: 'beginner_test_11_15',
        title: 'Beginner Level Test 3',
        description:
            'Test your knowledge of file I/O and streams (Lessons 11-15)',
        level: LearningLevel.beginner,
        questions: [
          Question(
            id: 'beginner_q11',
            question: 'What is File I/O in Java?',
            options: [
              'Input/Output operations with files',
              'Creating files only',
              'Reading files only',
              'Deleting files',
            ],
            correctAnswerIndex: 0,
            explanation: 'File I/O involves reading from and writing to files.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q12',
            question: 'Which class is used to read text files?',
            options: [
              'FileReader',
              'BufferedReader',
              'Scanner',
              'All of the above',
            ],
            correctAnswerIndex: 3,
            explanation:
                'All these classes can be used to read text files in Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q13',
            question: 'What is a stream in Java?',
            options: ['A river', 'A sequence of data', 'A file', 'A method'],
            correctAnswerIndex: 1,
            explanation:
                'A stream is a sequence of data elements made available over time.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q14',
            question: 'Which keyword is used to handle file operations?',
            options: ['try-catch', 'import', 'package', 'class'],
            correctAnswerIndex: 0,
            explanation:
                'File operations should be wrapped in try-catch blocks for exception handling.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q15',
            question: 'What is serialization?',
            options: [
              'Converting objects to bytes',
              'Converting bytes to objects',
              'Both A and B',
              'None of the above',
            ],
            correctAnswerIndex: 2,
            explanation:
                'Serialization converts objects to bytes, deserialization converts bytes back to objects.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 15,
        requiredAfterLesson: 15,
      ),
      MockTest(
        id: 'beginner_test_16_20',
        title: 'Beginner Level Test 4',
        description: 'Test your knowledge of data structures (Lessons 16-20)',
        level: LearningLevel.beginner,
        questions: [
          Question(
            id: 'beginner_q16',
            question: 'What is an ArrayList?',
            options: [
              'A fixed-size array',
              'A dynamic array',
              'A static array',
              'A primitive array',
            ],
            correctAnswerIndex: 1,
            explanation:
                'ArrayList is a dynamic array that can grow and shrink in size.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q17',
            question: 'What is the difference between Array and ArrayList?',
            options: [
              'No difference',
              'Array is fixed-size, ArrayList is dynamic',
              'ArrayList is faster',
              'Array is dynamic',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Array has fixed size, ArrayList can grow and shrink dynamically.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q18',
            question: 'Which method adds an element to ArrayList?',
            options: ['add()', 'insert()', 'put()', 'set()'],
            correctAnswerIndex: 0,
            explanation: 'add() method is used to add elements to ArrayList.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q19',
            question: 'What is a HashMap?',
            options: [
              'A list of maps',
              'A key-value pair collection',
              'A sorted collection',
              'A fixed collection',
            ],
            correctAnswerIndex: 1,
            explanation: 'HashMap stores data in key-value pairs.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q20',
            question: 'How do you get a value from HashMap?',
            options: ['get(key)', 'value(key)', 'find(key)', 'retrieve(key)'],
            correctAnswerIndex: 0,
            explanation:
                'get(key) method is used to retrieve values from HashMap.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 15,
        requiredAfterLesson: 20,
      ),
      MockTest(
        id: 'beginner_test_21_25',
        title: 'Beginner Level Test 5',
        description:
            'Test your knowledge of generics and collections (Lessons 21-25)',
        level: LearningLevel.beginner,
        questions: [
          Question(
            id: 'beginner_q21',
            question: 'What are generics in Java?',
            options: [
              'A type of collection',
              'Type parameters for classes and methods',
              'A programming language',
              'A data type',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Generics allow type parameters to be passed to classes and methods.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q22',
            question: 'What is the benefit of using generics?',
            options: [
              'Better performance',
              'Type safety',
              'Smaller code',
              'Faster compilation',
            ],
            correctAnswerIndex: 1,
            explanation: 'Generics provide type safety at compile time.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q23',
            question: 'How do you declare a generic class?',
            options: [
              'class MyClass<T>',
              'class MyClass(T)',
              'class MyClass{T}',
              'class MyClass<T extends Object>',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Generic classes are declared with angle brackets: class MyClass<T>.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q24',
            question: 'What is a Set in Java?',
            options: [
              'A collection with duplicates',
              'A collection without duplicates',
              'A sorted collection',
              'A fixed collection',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Set is a collection that does not allow duplicate elements.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q25',
            question: 'Which interface does HashSet implement?',
            options: ['List', 'Set', 'Map', 'Collection'],
            correctAnswerIndex: 1,
            explanation: 'HashSet implements the Set interface.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 15,
        requiredAfterLesson: 25,
      ),
      MockTest(
        id: 'beginner_test_26_30',
        title: 'Beginner Level Test 6',
        description:
            'Test your knowledge of lambda expressions (Lessons 26-30)',
        level: LearningLevel.beginner,
        questions: [
          Question(
            id: 'beginner_q26',
            question: 'What is a lambda expression?',
            options: [
              'A method',
              'An anonymous function',
              'A class',
              'A variable',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Lambda expressions are anonymous functions that can be passed around.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q27',
            question: 'What is the lambda operator?',
            options: ['->', '=>', '::', '->>'],
            correctAnswerIndex: 0,
            explanation: '-> is the lambda operator in Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q28',
            question: 'Which interface is used with lambda expressions?',
            options: [
              'Runnable',
              'Callable',
              'Functional Interface',
              'All of the above',
            ],
            correctAnswerIndex: 3,
            explanation:
                'Lambda expressions work with functional interfaces, including Runnable, Callable, etc.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q29',
            question: 'What is a functional interface?',
            options: [
              'An interface with one abstract method',
              'An interface with multiple methods',
              'A class',
              'A method',
            ],
            correctAnswerIndex: 0,
            explanation:
                'A functional interface has exactly one abstract method.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q30',
            question: 'Which annotation marks a functional interface?',
            options: [
              '@Functional',
              '@Interface',
              '@FunctionalInterface',
              '@Lambda',
            ],
            correctAnswerIndex: 2,
            explanation:
                '@FunctionalInterface annotation marks a functional interface.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 15,
        requiredAfterLesson: 30,
      ),
      MockTest(
        id: 'beginner_test_31_35',
        title: 'Beginner Level Test 7',
        description: 'Test your knowledge of Stream API (Lessons 31-35)',
        level: LearningLevel.beginner,
        questions: [
          Question(
            id: 'beginner_q31',
            question: 'What is the Stream API?',
            options: [
              'A way to read files',
              'A way to process collections',
              'A way to create threads',
              'A way to handle exceptions',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Stream API provides a way to process collections in a functional style.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q32',
            question: 'Which method starts a stream?',
            options: ['stream()', 'start()', 'begin()', 'init()'],
            correctAnswerIndex: 0,
            explanation:
                'stream() method is used to create a stream from a collection.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q33',
            question: 'What does filter() do in streams?',
            options: [
              'Filters elements based on a condition',
              'Sorts elements',
              'Groups elements',
              'Counts elements',
            ],
            correctAnswerIndex: 0,
            explanation:
                'filter() method filters elements based on a given predicate.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q34',
            question: 'What does map() do in streams?',
            options: [
              'Creates a map',
              'Transforms each element',
              'Filters elements',
              'Sorts elements',
            ],
            correctAnswerIndex: 1,
            explanation:
                'map() method transforms each element using a given function.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q35',
            question: 'What does collect() do in streams?',
            options: [
              'Collects garbage',
              'Terminates the stream and collects results',
              'Filters elements',
              'Sorts elements',
            ],
            correctAnswerIndex: 1,
            explanation:
                'collect() is a terminal operation that collects stream results.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 15,
        requiredAfterLesson: 35,
      ),
      MockTest(
        id: 'beginner_test_36_40',
        title: 'Beginner Level Test 8',
        description:
            'Test your knowledge of annotations and reflection (Lessons 36-40)',
        level: LearningLevel.beginner,
        questions: [
          Question(
            id: 'beginner_q36',
            question: 'What is an annotation in Java?',
            options: [
              'A comment',
              'Metadata about code',
              'A method',
              'A class',
            ],
            correctAnswerIndex: 1,
            explanation: 'Annotations provide metadata about the code.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q37',
            question: 'Which symbol is used for annotations?',
            options: ['@', '#', '\$', '%'],
            correctAnswerIndex: 0,
            explanation: '@ symbol is used to denote annotations.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q38',
            question: 'What is reflection in Java?',
            options: [
              'Looking in a mirror',
              'Examining and modifying code at runtime',
              'A design pattern',
              'A data structure',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Reflection allows examining and modifying code at runtime.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q39',
            question: 'Which class is used for reflection?',
            options: ['Class', 'Object', 'Reflection', 'Mirror'],
            correctAnswerIndex: 0,
            explanation: 'Class class is used for reflection operations.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'beginner_q40',
            question: 'What does @Override annotation do?',
            options: [
              'Overrides a method',
              'Indicates method overriding',
              'Creates a new method',
              'Deletes a method',
            ],
            correctAnswerIndex: 1,
            explanation:
                '@Override indicates that a method is overriding a parent class method.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 15,
        requiredAfterLesson: 40,
      ),
    ];
  }

  // Middle Level Tests
  static List<MockTest> getMiddleTests() {
    return [
      MockTest(
        id: 'middle_test_1_5',
        title: 'Middle Level Test 1',
        description:
            'Test your knowledge of collections and generics (Lessons 1-5)',
        level: LearningLevel.middle,
        questions: [
          Question(
            id: 'middle_q1',
            question:
                'What is the difference between ArrayList and LinkedList?',
            options: [
              'No difference',
              'ArrayList is faster for random access, LinkedList for insertion/deletion',
              'LinkedList is always faster',
              'ArrayList cannot store objects',
            ],
            correctAnswerIndex: 1,
            explanation:
                'ArrayList is faster for random access, LinkedList is faster for insertion/deletion operations.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q2',
            question: 'What are generics in Java?',
            options: [
              'A type of collection',
              'A way to create type-safe collections',
              'A method',
              'A class',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Generics provide type safety by allowing you to specify the type of objects a collection can hold.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q3',
            question: 'Which interface does ArrayList implement?',
            options: ['Set', 'Map', 'List', 'Queue'],
            correctAnswerIndex: 2,
            explanation: 'ArrayList implements the List interface.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q4',
            question: 'What is the difference between Set and List?',
            options: [
              'No difference',
              'Set allows duplicates, List does not',
              'List allows duplicates, Set does not',
              'Set is ordered, List is not',
            ],
            correctAnswerIndex: 2,
            explanation:
                'List allows duplicate elements, Set does not allow duplicates.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q5',
            question: 'Which collection maintains insertion order?',
            options: ['HashSet', 'TreeSet', 'LinkedHashSet', 'None'],
            correctAnswerIndex: 2,
            explanation:
                'LinkedHashSet maintains insertion order while HashSet does not.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 20,
        requiredAfterLesson: 5,
      ),
      // Add more middle level tests...
      MockTest(
        id: 'middle_test_6_10',
        title: 'Middle Level Test 2',
        description:
            'Test your knowledge of advanced collections (Lessons 6-10)',
        level: LearningLevel.middle,
        questions: [
          Question(
            id: 'middle_q6',
            question: 'What is a TreeMap?',
            options: [
              'A map sorted by keys',
              'A map sorted by values',
              'A map with no order',
              'A list',
            ],
            correctAnswerIndex: 0,
            explanation:
                'TreeMap is a map implementation that maintains sorted order by keys.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q7',
            question: 'What is the difference between HashMap and TreeMap?',
            options: [
              'No difference',
              'HashMap is ordered, TreeMap is not',
              'TreeMap is ordered, HashMap is not',
              'HashMap is faster',
            ],
            correctAnswerIndex: 2,
            explanation:
                'TreeMap maintains sorted order, HashMap does not guarantee order.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q8',
            question: 'What is a PriorityQueue?',
            options: [
              'A queue with priority ordering',
              'A regular queue',
              'A stack',
              'A list',
            ],
            correctAnswerIndex: 0,
            explanation:
                'PriorityQueue orders elements based on their priority.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q9',
            question: 'Which collection is thread-safe?',
            options: ['ArrayList', 'HashMap', 'Vector', 'LinkedList'],
            correctAnswerIndex: 2,
            explanation:
                'Vector is synchronized and thread-safe, unlike ArrayList.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q10',
            question: 'What is a ConcurrentHashMap?',
            options: [
              'A thread-safe HashMap',
              'A faster HashMap',
              'A sorted HashMap',
              'A smaller HashMap',
            ],
            correctAnswerIndex: 0,
            explanation:
                'ConcurrentHashMap is a thread-safe version of HashMap.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 20,
        requiredAfterLesson: 10,
      ),
      MockTest(
        id: 'middle_test_11_15',
        title: 'Middle Level Test 3',
        description:
            'Test your knowledge of algorithms and data structures (Lessons 11-15)',
        level: LearningLevel.middle,
        questions: [
          Question(
            id: 'middle_q11',
            question: 'What is the time complexity of ArrayList.get()?',
            options: ['O(1)', 'O(n)', 'O(log n)', 'O(n²)'],
            correctAnswerIndex: 0,
            explanation:
                'ArrayList.get() has O(1) time complexity for random access.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q12',
            question: 'What is the time complexity of LinkedList.add()?',
            options: ['O(1)', 'O(n)', 'O(log n)', 'O(n²)'],
            correctAnswerIndex: 0,
            explanation:
                'LinkedList.add() has O(1) time complexity for adding at the end.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q13',
            question: 'What is a binary search?',
            options: [
              'Searching in a binary tree',
              'Searching in a sorted array by dividing in half',
              'Searching in two arrays',
              'Searching for binary numbers',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Binary search divides the search space in half with each comparison.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q14',
            question: 'What is the time complexity of binary search?',
            options: ['O(1)', 'O(n)', 'O(log n)', 'O(n²)'],
            correctAnswerIndex: 2,
            explanation: 'Binary search has O(log n) time complexity.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q15',
            question: 'What is a hash collision?',
            options: [
              'Two keys having the same hash value',
              'A hash table overflow',
              'A hash function error',
              'A hash table underflow',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Hash collision occurs when two different keys produce the same hash value.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 20,
        requiredAfterLesson: 15,
      ),
      MockTest(
        id: 'middle_test_16_20',
        title: 'Middle Level Test 4',
        description:
            'Test your knowledge of sorting algorithms (Lessons 16-20)',
        level: LearningLevel.middle,
        questions: [
          Question(
            id: 'middle_q16',
            question: 'What is the time complexity of bubble sort?',
            options: ['O(n)', 'O(n log n)', 'O(n²)', 'O(log n)'],
            correctAnswerIndex: 2,
            explanation:
                'Bubble sort has O(n²) time complexity in the worst case.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q17',
            question:
                'Which sorting algorithm is most efficient for large datasets?',
            options: [
              'Bubble sort',
              'Selection sort',
              'Quick sort',
              'Insertion sort',
            ],
            correctAnswerIndex: 2,
            explanation:
                'Quick sort has O(n log n) average time complexity, making it efficient for large datasets.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q18',
            question: 'What is merge sort?',
            options: [
              'A sorting algorithm that divides and conquers',
              'A sorting algorithm that swaps adjacent elements',
              'A sorting algorithm that finds minimum elements',
              'A sorting algorithm that uses hashing',
            ],
            correctAnswerIndex: 0,
            explanation: 'Merge sort uses divide and conquer approach.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q19',
            question: 'What is the space complexity of merge sort?',
            options: ['O(1)', 'O(n)', 'O(log n)', 'O(n²)'],
            correctAnswerIndex: 1,
            explanation:
                'Merge sort has O(n) space complexity due to the temporary arrays.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q20',
            question: 'Which sorting algorithm is stable?',
            options: [
              'Quick sort',
              'Heap sort',
              'Merge sort',
              'Selection sort',
            ],
            correctAnswerIndex: 2,
            explanation: 'Merge sort is a stable sorting algorithm.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 20,
        requiredAfterLesson: 20,
      ),
      MockTest(
        id: 'middle_test_21_25',
        title: 'Middle Level Test 5',
        description:
            'Test your knowledge of recursion and dynamic programming (Lessons 21-25)',
        level: LearningLevel.middle,
        questions: [
          Question(
            id: 'middle_q21',
            question: 'What is recursion?',
            options: [
              'A loop',
              'A method calling itself',
              'A data structure',
              'A sorting algorithm',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Recursion is when a method calls itself to solve a problem.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q22',
            question: 'What is the base case in recursion?',
            options: [
              'The first case',
              'The stopping condition',
              'The last case',
              'The middle case',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Base case is the stopping condition that prevents infinite recursion.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q23',
            question: 'What is dynamic programming?',
            options: [
              'Programming with dynamic variables',
              'Solving problems by breaking them into subproblems',
              'Programming with moving parts',
              'Programming with changing data',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Dynamic programming solves problems by breaking them into overlapping subproblems.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q24',
            question: 'What is memoization?',
            options: [
              'Remembering solutions to subproblems',
              'Forgetting solutions',
              'Creating new problems',
              'Deleting solutions',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Memoization stores solutions to subproblems to avoid recalculating them.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q25',
            question: 'What is the Fibonacci sequence?',
            options: [
              'A sequence of even numbers',
              'A sequence where each number is the sum of the two preceding ones',
              'A sequence of prime numbers',
              'A sequence of square numbers',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Fibonacci sequence: each number is the sum of the two preceding ones.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 20,
        requiredAfterLesson: 25,
      ),
      MockTest(
        id: 'middle_test_26_30',
        title: 'Middle Level Test 6',
        description: 'Test your knowledge of trees and graphs (Lessons 26-30)',
        level: LearningLevel.middle,
        questions: [
          Question(
            id: 'middle_q26',
            question: 'What is a binary tree?',
            options: [
              'A tree with two roots',
              'A tree where each node has at most two children',
              'A tree with two levels',
              'A tree with two leaves',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A binary tree is a tree where each node has at most two children.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q27',
            question: 'What is a binary search tree?',
            options: [
              'A binary tree used for searching',
              'A binary tree where left child < parent < right child',
              'A binary tree with only two nodes',
              'A binary tree that is always balanced',
            ],
            correctAnswerIndex: 1,
            explanation:
                'BST: left child < parent < right child for all nodes.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q28',
            question: 'What is tree traversal?',
            options: [
              'Walking through a tree',
              'Visiting all nodes in a tree',
              'Climbing a tree',
              'Cutting down a tree',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Tree traversal is the process of visiting all nodes in a tree.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q29',
            question: 'What are the main types of tree traversal?',
            options: [
              'Inorder, Preorder, Postorder',
              'Left, Right, Center',
              'Up, Down, Sideways',
              'Fast, Slow, Medium',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Main tree traversals are Inorder, Preorder, and Postorder.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q30',
            question: 'What is a graph?',
            options: [
              'A visual representation',
              'A collection of vertices and edges',
              'A chart',
              'A diagram',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A graph is a collection of vertices (nodes) connected by edges.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 20,
        requiredAfterLesson: 30,
      ),
      MockTest(
        id: 'middle_test_31_35',
        title: 'Middle Level Test 7',
        description: 'Test your knowledge of graph algorithms (Lessons 31-35)',
        level: LearningLevel.middle,
        questions: [
          Question(
            id: 'middle_q31',
            question: 'What is BFS (Breadth-First Search)?',
            options: [
              'Searching by going deep first',
              'Searching by going wide first',
              'Searching randomly',
              'Searching backwards',
            ],
            correctAnswerIndex: 1,
            explanation:
                'BFS explores all neighbors at the current level before moving to the next level.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q32',
            question: 'What is DFS (Depth-First Search)?',
            options: [
              'Searching by going deep first',
              'Searching by going wide first',
              'Searching randomly',
              'Searching backwards',
            ],
            correctAnswerIndex: 0,
            explanation:
                'DFS explores as far as possible along each branch before backtracking.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q33',
            question: 'What is Dijkstra\'s algorithm?',
            options: [
              'A sorting algorithm',
              'A shortest path algorithm',
              'A searching algorithm',
              'A hashing algorithm',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Dijkstra\'s algorithm finds the shortest path between nodes in a graph.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q34',
            question: 'What is a weighted graph?',
            options: [
              'A graph with heavy nodes',
              'A graph where edges have values/weights',
              'A graph with many nodes',
              'A graph with thick edges',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A weighted graph has edges with associated values (weights).',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q35',
            question: 'What is a directed graph?',
            options: [
              'A graph with arrows',
              'A graph where edges have direction',
              'A graph with straight edges',
              'A graph with curved edges',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A directed graph has edges with direction (from one vertex to another).',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 20,
        requiredAfterLesson: 35,
      ),
      MockTest(
        id: 'middle_test_36_40',
        title: 'Middle Level Test 8',
        description:
            'Test your knowledge of advanced algorithms (Lessons 36-40)',
        level: LearningLevel.middle,
        questions: [
          Question(
            id: 'middle_q36',
            question: 'What is a greedy algorithm?',
            options: [
              'An algorithm that makes the best choice at each step',
              'An algorithm that is always correct',
              'An algorithm that is always fast',
              'An algorithm that uses recursion',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Greedy algorithms make the locally optimal choice at each step.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q37',
            question:
                'What is the time complexity of quicksort in the best case?',
            options: ['O(n)', 'O(n log n)', 'O(n²)', 'O(log n)'],
            correctAnswerIndex: 1,
            explanation:
                'Quicksort has O(n log n) time complexity in the best case.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q38',
            question: 'What is a heap?',
            options: [
              'A pile of data',
              'A complete binary tree with heap property',
              'A sorted array',
              'A linked list',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A heap is a complete binary tree that satisfies the heap property.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q39',
            question: 'What is heap sort?',
            options: [
              'Sorting using a heap data structure',
              'Sorting by throwing things in a heap',
              'Sorting randomly',
              'Sorting by size',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Heap sort uses a heap data structure to sort elements.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'middle_q40',
            question: 'What is the space complexity of heap sort?',
            options: ['O(1)', 'O(n)', 'O(log n)', 'O(n²)'],
            correctAnswerIndex: 0,
            explanation:
                'Heap sort has O(1) space complexity as it sorts in-place.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 20,
        requiredAfterLesson: 40,
      ),
    ];
  }

  // Advanced Level Tests
  static List<MockTest> getAdvancedTests() {
    return [
      MockTest(
        id: 'advanced_test_1_5',
        title: 'Advanced Level Test 1',
        description:
            'Test your knowledge of multithreading and concurrency (Lessons 1-5)',
        level: LearningLevel.advanced,
        questions: [
          Question(
            id: 'advanced_q1',
            question: 'What is multithreading?',
            options: [
              'Multiple programs running',
              'Multiple threads within a single program',
              'Multiple computers',
              'Multiple files',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Multithreading is the ability of a program to execute multiple threads concurrently.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q2',
            question: 'How do you create a thread in Java?',
            options: [
              'new Thread()',
              'extends Thread',
              'implements Runnable',
              'All of the above',
            ],
            correctAnswerIndex: 3,
            explanation:
                'You can create threads by extending Thread class, implementing Runnable, or using new Thread().',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q3',
            question: 'What is synchronization?',
            options: [
              'Making threads run faster',
              'Controlling access to shared resources',
              'Creating new threads',
              'Stopping threads',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Synchronization is used to control access to shared resources by multiple threads.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q4',
            question: 'What is a race condition?',
            options: [
              'A competition between threads',
              'Unpredictable behavior due to concurrent access',
              'A type of exception',
              'A synchronization method',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A race condition occurs when the behavior of a program depends on the timing of thread execution.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q5',
            question: 'Which keyword is used for synchronization?',
            options: ['sync', 'synchronized', 'lock', 'mutex'],
            correctAnswerIndex: 1,
            explanation:
                'synchronized keyword is used for synchronization in Java.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 25,
        requiredAfterLesson: 5,
      ),
      // Add more advanced level tests...
      MockTest(
        id: 'advanced_test_6_10',
        title: 'Advanced Level Test 2',
        description:
            'Test your knowledge of thread synchronization (Lessons 6-10)',
        level: LearningLevel.advanced,
        questions: [
          Question(
            id: 'advanced_q6',
            question: 'What is a deadlock?',
            options: [
              'A dead thread',
              'Two or more threads waiting for each other',
              'A stopped thread',
              'A broken thread',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Deadlock occurs when two or more threads are waiting for each other indefinitely.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q7',
            question: 'What is a semaphore?',
            options: [
              'A flag',
              'A synchronization primitive that controls access to resources',
              'A signal',
              'A warning',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A semaphore is a synchronization primitive that controls access to shared resources.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q8',
            question: 'What is a mutex?',
            options: [
              'A mutual exclusion lock',
              'A multiple exclusion lock',
              'A mutual execution lock',
              'A multiple execution lock',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Mutex stands for mutual exclusion lock, allowing only one thread at a time.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q9',
            question: 'What is thread starvation?',
            options: [
              'Threads not getting enough food',
              'Threads not getting CPU time',
              'Threads not getting memory',
              'Threads not getting data',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Thread starvation occurs when a thread is consistently denied CPU time.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q10',
            question: 'What is a thread pool?',
            options: [
              'A pool of water for threads',
              'A collection of pre-created threads',
              'A pool of data for threads',
              'A pool of memory for threads',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A thread pool is a collection of pre-created threads ready to execute tasks.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 25,
        requiredAfterLesson: 10,
      ),
      MockTest(
        id: 'advanced_test_11_15',
        title: 'Advanced Level Test 3',
        description:
            'Test your knowledge of concurrent collections (Lessons 11-15)',
        level: LearningLevel.advanced,
        questions: [
          Question(
            id: 'advanced_q11',
            question: 'What is ConcurrentHashMap?',
            options: [
              'A thread-safe HashMap',
              'A faster HashMap',
              'A sorted HashMap',
              'A smaller HashMap',
            ],
            correctAnswerIndex: 0,
            explanation:
                'ConcurrentHashMap is a thread-safe version of HashMap.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q12',
            question: 'What is CopyOnWriteArrayList?',
            options: [
              'A thread-safe ArrayList',
              'A faster ArrayList',
              'A smaller ArrayList',
              'A sorted ArrayList',
            ],
            correctAnswerIndex: 0,
            explanation:
                'CopyOnWriteArrayList is a thread-safe version of ArrayList.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q13',
            question: 'What is BlockingQueue?',
            options: [
              'A queue that blocks when empty or full',
              'A queue that never blocks',
              'A queue that blocks only when empty',
              'A queue that blocks only when full',
            ],
            correctAnswerIndex: 0,
            explanation:
                'BlockingQueue blocks when trying to take from empty queue or put to full queue.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q14',
            question: 'What is CountDownLatch?',
            options: [
              'A synchronization aid that allows threads to wait',
              'A counter that counts down',
              'A timer',
              'A stopwatch',
            ],
            correctAnswerIndex: 0,
            explanation:
                'CountDownLatch allows threads to wait until a count reaches zero.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q15',
            question: 'What is CyclicBarrier?',
            options: [
              'A synchronization aid for threads to wait at a common point',
              'A barrier that cycles',
              'A rotating barrier',
              'A moving barrier',
            ],
            correctAnswerIndex: 0,
            explanation:
                'CyclicBarrier allows threads to wait at a common point before proceeding.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 25,
        requiredAfterLesson: 15,
      ),
      MockTest(
        id: 'advanced_test_16_20',
        title: 'Advanced Level Test 4',
        description:
            'Test your knowledge of parallel processing (Lessons 16-20)',
        level: LearningLevel.advanced,
        questions: [
          Question(
            id: 'advanced_q16',
            question: 'What is the Fork-Join framework?',
            options: [
              'A framework for parallel processing',
              'A framework for sequential processing',
              'A framework for database processing',
              'A framework for file processing',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Fork-Join framework is designed for parallel processing of tasks.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q17',
            question: 'What is a CompletableFuture?',
            options: [
              'A future that can be completed asynchronously',
              'A future that is always complete',
              'A future that never completes',
              'A future that completes immediately',
            ],
            correctAnswerIndex: 0,
            explanation:
                'CompletableFuture represents a future result that can be completed asynchronously.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q18',
            question: 'What is parallel streams?',
            options: [
              'Streams that process data in parallel',
              'Streams that process data sequentially',
              'Streams that process data randomly',
              'Streams that process data backwards',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Parallel streams process data using multiple threads for better performance.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q19',
            question:
                'What is the difference between parallel() and sequential() streams?',
            options: [
              'No difference',
              'parallel() uses multiple threads, sequential() uses one thread',
              'sequential() is faster',
              'parallel() is always better',
            ],
            correctAnswerIndex: 1,
            explanation:
                'parallel() uses multiple threads, sequential() uses a single thread.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q20',
            question: 'What is a thread-local variable?',
            options: [
              'A variable shared by all threads',
              'A variable that belongs to a specific thread',
              'A global variable',
              'A static variable',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Thread-local variables have separate instances for each thread.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 25,
        requiredAfterLesson: 20,
      ),
      MockTest(
        id: 'advanced_test_21_25',
        title: 'Advanced Level Test 5',
        description: 'Test your knowledge of JVM internals (Lessons 21-25)',
        level: LearningLevel.advanced,
        questions: [
          Question(
            id: 'advanced_q21',
            question: 'What is the JVM heap?',
            options: [
              'A pile of memory',
              'Memory area for object allocation',
              'A data structure',
              'A collection',
            ],
            correctAnswerIndex: 1,
            explanation:
                'The JVM heap is the memory area where objects are allocated.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q22',
            question: 'What is garbage collection?',
            options: [
              'Cleaning up memory',
              'Automatic memory management',
              'Manual memory management',
              'Deleting files',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Garbage collection is the automatic memory management process in Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q23',
            question: 'What is the difference between stack and heap?',
            options: [
              'No difference',
              'Stack stores method calls, heap stores objects',
              'Heap is faster',
              'Stack is larger',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Stack stores method calls and local variables, heap stores objects.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q24',
            question: 'What is a memory leak?',
            options: [
              'Memory getting wet',
              'Memory not being released',
              'Too much memory',
              'No memory',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A memory leak occurs when memory is allocated but not released.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q25',
            question: 'What is the JIT compiler?',
            options: [
              'Just-In-Time compiler',
              'Just-In-Thread compiler',
              'Just-In-Memory compiler',
              'Just-In-Object compiler',
            ],
            correctAnswerIndex: 0,
            explanation:
                'JIT (Just-In-Time) compiler compiles bytecode to native code at runtime.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 25,
        requiredAfterLesson: 25,
      ),
      MockTest(
        id: 'advanced_test_26_30',
        title: 'Advanced Level Test 6',
        description:
            'Test your knowledge of performance optimization (Lessons 26-30)',
        level: LearningLevel.advanced,
        questions: [
          Question(
            id: 'advanced_q26',
            question: 'What is profiling?',
            options: [
              'Taking photos',
              'Analyzing program performance',
              'Writing code',
              'Testing code',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Profiling is the process of analyzing program performance to identify bottlenecks.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q27',
            question: 'What is caching?',
            options: [
              'Storing data in fast memory',
              'Storing data in slow memory',
              'Deleting data',
              'Moving data',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Caching stores frequently accessed data in fast memory for quick retrieval.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q28',
            question: 'What is object pooling?',
            options: [
              'Swimming pool for objects',
              'Reusing objects instead of creating new ones',
              'Storing objects in a pool',
              'Deleting objects from a pool',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Object pooling reuses objects to avoid the overhead of creating new ones.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q29',
            question: 'What is lazy loading?',
            options: [
              'Loading data when needed',
              'Loading data immediately',
              'Loading data randomly',
              'Loading data backwards',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Lazy loading loads data only when it is actually needed.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q30',
            question: 'What is premature optimization?',
            options: [
              'Optimizing too early',
              'Optimizing too late',
              'Not optimizing',
              'Over-optimizing',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Premature optimization is optimizing code before identifying actual bottlenecks.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 25,
        requiredAfterLesson: 30,
      ),
      MockTest(
        id: 'advanced_test_31_35',
        title: 'Advanced Level Test 7',
        description:
            'Test your knowledge of networking and I/O (Lessons 31-35)',
        level: LearningLevel.advanced,
        questions: [
          Question(
            id: 'advanced_q31',
            question: 'What is NIO (New I/O)?',
            options: [
              'A new way to do I/O operations',
              'A new programming language',
              'A new database',
              'A new framework',
            ],
            correctAnswerIndex: 0,
            explanation:
                'NIO provides a new way to perform I/O operations with better performance.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q32',
            question: 'What is a Socket?',
            options: [
              'A plug',
              'An endpoint for communication between two machines',
              'A tool',
              'A device',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A socket is an endpoint for communication between two machines over a network.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q33',
            question: 'What is TCP?',
            options: [
              'Transmission Control Protocol',
              'Transfer Control Protocol',
              'Transport Control Protocol',
              'Transmission Communication Protocol',
            ],
            correctAnswerIndex: 0,
            explanation:
                'TCP (Transmission Control Protocol) provides reliable, ordered communication.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q34',
            question: 'What is UDP?',
            options: [
              'User Datagram Protocol',
              'Universal Datagram Protocol',
              'Unified Datagram Protocol',
              'Unique Datagram Protocol',
            ],
            correctAnswerIndex: 0,
            explanation:
                'UDP (User Datagram Protocol) provides fast but unreliable communication.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q35',
            question: 'What is the difference between TCP and UDP?',
            options: [
              'TCP is reliable, UDP is fast',
              'UDP is reliable, TCP is fast',
              'No difference',
              'TCP is faster',
            ],
            correctAnswerIndex: 0,
            explanation:
                'TCP provides reliable communication, UDP provides fast but unreliable communication.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 25,
        requiredAfterLesson: 35,
      ),
      MockTest(
        id: 'advanced_test_36_40',
        title: 'Advanced Level Test 8',
        description:
            'Test your knowledge of security and cryptography (Lessons 36-40)',
        level: LearningLevel.advanced,
        questions: [
          Question(
            id: 'advanced_q36',
            question: 'What is encryption?',
            options: [
              'Converting data to unreadable form',
              'Converting data to readable form',
              'Deleting data',
              'Moving data',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Encryption converts data to an unreadable form to protect it.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q37',
            question: 'What is decryption?',
            options: [
              'Converting encrypted data back to readable form',
              'Converting data to encrypted form',
              'Deleting encrypted data',
              'Moving encrypted data',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Decryption converts encrypted data back to its original readable form.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q38',
            question: 'What is a hash function?',
            options: [
              'A function that converts data to fixed-size string',
              'A function that sorts data',
              'A function that searches data',
              'A function that deletes data',
            ],
            correctAnswerIndex: 0,
            explanation:
                'A hash function converts data to a fixed-size string (hash).',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q39',
            question: 'What is a digital signature?',
            options: [
              'A signature made with a pen',
              'A cryptographic signature for data integrity',
              'A handwritten signature',
              'A typed signature',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A digital signature is a cryptographic signature that ensures data integrity.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'advanced_q40',
            question: 'What is SSL/TLS?',
            options: [
              'Secure Sockets Layer / Transport Layer Security',
              'Simple Sockets Layer / Transport Layer Security',
              'Secure Sockets Layer / Transport Layer Service',
              'Simple Sockets Layer / Transport Layer Service',
            ],
            correctAnswerIndex: 0,
            explanation:
                'SSL/TLS provides secure communication over a network.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 25,
        requiredAfterLesson: 40,
      ),
    ];
  }

  // Pro Level Tests
  static List<MockTest> getProTests() {
    return [
      MockTest(
        id: 'pro_test_1_5',
        title: 'Pro Level Test 1',
        description:
            'Test your knowledge of performance optimization and real-time systems (Lessons 1-5)',
        level: LearningLevel.pro,
        questions: [
          Question(
            id: 'pro_q1',
            question: 'What is JVM optimization?',
            options: [
              'Making JVM faster',
              'Tuning JVM parameters for better performance',
              'Replacing JVM',
              'Installing JVM',
            ],
            correctAnswerIndex: 1,
            explanation:
                'JVM optimization involves tuning JVM parameters like heap size, garbage collection, etc.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'pro_q2',
            question: 'What is garbage collection?',
            options: [
              'Cleaning up memory',
              'Automatic memory management',
              'Manual memory management',
              'Deleting files',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Garbage collection is the automatic memory management process in Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'pro_q3',
            question: 'What is a memory leak?',
            options: [
              'Memory getting wet',
              'Memory not being released',
              'Too much memory',
              'No memory',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A memory leak occurs when memory is allocated but not released, causing memory usage to grow.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'pro_q4',
            question: 'What is profiling?',
            options: [
              'Taking photos',
              'Analyzing program performance',
              'Writing code',
              'Testing code',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Profiling is the process of analyzing program performance to identify bottlenecks.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'pro_q5',
            question: 'What is caching?',
            options: [
              'Storing data in fast memory',
              'Storing data in slow memory',
              'Deleting data',
              'Moving data',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Caching is storing frequently accessed data in fast memory for quick retrieval.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 30,
        requiredAfterLesson: 5,
      ),
      MockTest(
        id: 'pro_test_6_10',
        title: 'Pro Level Test 2',
        description:
            'Test your knowledge of enterprise patterns and microservices (Lessons 6-10)',
        level: LearningLevel.pro,
        questions: [
          Question(
            id: 'pro_q6',
            question: 'What is a microservice?',
            options: [
              'A small program',
              'A small, independent service',
              'A database',
              'A framework',
            ],
            correctAnswerIndex: 1,
            explanation:
                'A microservice is a small, independent service that can be deployed and scaled separately.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'pro_q7',
            question:
                'What is the difference between microservices and monoliths?',
            options: [
              'No difference',
              'Microservices are smaller, monoliths are larger',
              'Microservices are independent, monoliths are tightly coupled',
              'Microservices are faster',
            ],
            correctAnswerIndex: 2,
            explanation:
                'Microservices are independent and loosely coupled, while monoliths are tightly coupled.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'pro_q8',
            question: 'What is API Gateway?',
            options: [
              'A database',
              'A single entry point for microservices',
              'A programming language',
              'A framework',
            ],
            correctAnswerIndex: 1,
            explanation:
                'API Gateway is a single entry point that routes requests to appropriate microservices.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'pro_q9',
            question: 'What is service discovery?',
            options: [
              'Finding services',
              'A mechanism to locate services',
              'A database',
              'A protocol',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Service discovery is a mechanism that allows services to find and communicate with each other.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'pro_q10',
            question: 'What is circuit breaker pattern?',
            options: [
              'Breaking circuits',
              'Preventing cascading failures',
              'A hardware component',
              'A software bug',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Circuit breaker pattern prevents cascading failures by stopping calls to failing services.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 30,
        requiredAfterLesson: 10,
      ),
    ];
  }

  // Master Level Tests
  static List<MockTest> getMasterTests() {
    return [
      MockTest(
        id: 'master_test_1_5',
        title: 'Master Level Test 1',
        description:
            'Test your knowledge of design patterns and architecture (Lessons 1-5)',
        level: LearningLevel.master,
        questions: [
          Question(
            id: 'master_q1',
            question: 'What is the Singleton pattern?',
            options: [
              'A pattern with multiple instances',
              'A pattern with only one instance',
              'A pattern with no instances',
              'A pattern with random instances',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Singleton pattern ensures that only one instance of a class exists.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q2',
            question: 'What is the Factory pattern?',
            options: [
              'Creating objects in a factory',
              'Creating objects without specifying exact class',
              'Creating objects with specific class',
              'Creating objects randomly',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Factory pattern creates objects without specifying the exact class of object that will be created.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q3',
            question: 'What is dependency injection?',
            options: [
              'Injecting dependencies',
              'Providing dependencies from outside',
              'Creating dependencies inside',
              'Deleting dependencies',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Dependency injection is providing dependencies from outside rather than creating them inside the class.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q4',
            question: 'What is the Observer pattern?',
            options: [
              'Watching objects',
              'One-to-many dependency between objects',
              'Many-to-one dependency',
              'No dependency',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Observer pattern defines a one-to-many dependency between objects so that when one object changes state, all dependents are notified.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q5',
            question: 'What is MVC pattern?',
            options: [
              'Model-View-Controller',
              'Multiple-View-Controller',
              'Model-Variable-Controller',
              'Method-View-Controller',
            ],
            correctAnswerIndex: 0,
            explanation:
                'MVC stands for Model-View-Controller, a design pattern that separates concerns.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 35,
        requiredAfterLesson: 5,
      ),
      // Add more master level tests...
      MockTest(
        id: 'master_test_6_10',
        title: 'Master Level Test 2',
        description:
            'Test your knowledge of enterprise frameworks and security (Lessons 6-10)',
        level: LearningLevel.master,
        questions: [
          Question(
            id: 'master_q6',
            question: 'What is Spring Framework?',
            options: [
              'A season',
              'A Java framework for enterprise applications',
              'A database',
              'A programming language',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Spring Framework is a popular Java framework for building enterprise applications.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q7',
            question: 'What is Spring Boot?',
            options: [
              'A type of boot',
              'A framework that simplifies Spring development',
              'A database',
              'A server',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Spring Boot simplifies Spring development by providing auto-configuration and embedded servers.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q8',
            question: 'What is Hibernate?',
            options: [
              'A sleep state',
              'An ORM framework for Java',
              'A database',
              'A programming language',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Hibernate is an Object-Relational Mapping (ORM) framework for Java.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q9',
            question: 'What is JWT?',
            options: [
              'A type of token',
              'JSON Web Token for authentication',
              'A database',
              'A framework',
            ],
            correctAnswerIndex: 1,
            explanation:
                'JWT (JSON Web Token) is a compact, URL-safe means of representing claims to be transferred between two parties.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q10',
            question: 'What is OAuth?',
            options: [
              'A programming language',
              'An authorization framework',
              'A database',
              'A framework',
            ],
            correctAnswerIndex: 1,
            explanation:
                'OAuth is an authorization framework that enables applications to obtain limited access to user accounts.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 35,
        requiredAfterLesson: 10,
      ),
      // Add more master level tests for every 5 lessons...
      MockTest(
        id: 'master_test_11_15',
        title: 'Master Level Test 3',
        description:
            'Test your knowledge of microservices architecture (Lessons 11-15)',
        level: LearningLevel.master,
        questions: [
          Question(
            id: 'master_q11',
            question: 'What is microservices architecture?',
            options: [
              'A single large application',
              'A collection of small, independent services',
              'A database architecture',
              'A network architecture',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Microservices architecture consists of small, independent services that work together.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q12',
            question: 'What is service mesh?',
            options: [
              'A network of services',
              'A infrastructure layer for service-to-service communication',
              'A database mesh',
              'A security mesh',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Service mesh is an infrastructure layer that handles service-to-service communication.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q13',
            question: 'What is API Gateway?',
            options: [
              'A database gateway',
              'A single entry point for microservices',
              'A security gateway',
              'A network gateway',
            ],
            correctAnswerIndex: 1,
            explanation:
                'API Gateway is a single entry point that routes requests to appropriate microservices.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q14',
            question: 'What is service discovery?',
            options: [
              'Finding services manually',
              'A mechanism to locate services automatically',
              'A database search',
              'A file search',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Service discovery is a mechanism that allows services to find and communicate with each other.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q15',
            question: 'What is circuit breaker pattern?',
            options: [
              'Breaking electrical circuits',
              'Preventing cascading failures in distributed systems',
              'Breaking code',
              'Breaking databases',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Circuit breaker pattern prevents cascading failures by stopping calls to failing services.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 35,
        requiredAfterLesson: 15,
      ),
      MockTest(
        id: 'master_test_16_20',
        title: 'Master Level Test 4',
        description:
            'Test your knowledge of cloud deployment and DevOps (Lessons 16-20)',
        level: LearningLevel.master,
        questions: [
          Question(
            id: 'master_q16',
            question: 'What is CI/CD?',
            options: [
              'Continuous Integration / Continuous Deployment',
              'Continuous Integration / Continuous Development',
              'Continuous Inspection / Continuous Deployment',
              'Continuous Integration / Continuous Delivery',
            ],
            correctAnswerIndex: 0,
            explanation:
                'CI/CD stands for Continuous Integration / Continuous Deployment.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q17',
            question: 'What is Docker?',
            options: [
              'A programming language',
              'A containerization platform',
              'A database',
              'A framework',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Docker is a containerization platform that packages applications with their dependencies.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q18',
            question: 'What is Kubernetes?',
            options: [
              'A container orchestration platform',
              'A programming language',
              'A database',
              'A framework',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Kubernetes is a container orchestration platform for managing containerized applications.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q19',
            question: 'What is infrastructure as code?',
            options: [
              'Writing code for infrastructure',
              'Managing infrastructure through code',
              'Infrastructure made of code',
              'Code made of infrastructure',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Infrastructure as Code (IaC) manages infrastructure through code rather than manual processes.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q20',
            question: 'What is monitoring in DevOps?',
            options: [
              'Watching code',
              'Observing system performance and health',
              'Reading code',
              'Writing code',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Monitoring involves observing system performance, health, and availability.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 35,
        requiredAfterLesson: 20,
      ),
      MockTest(
        id: 'master_test_21_25',
        title: 'Master Level Test 5',
        description:
            'Test your knowledge of system design and scalability (Lessons 21-25)',
        level: LearningLevel.master,
        questions: [
          Question(
            id: 'master_q21',
            question: 'What is horizontal scaling?',
            options: [
              'Adding more power to existing machines',
              'Adding more machines to handle load',
              'Making machines bigger',
              'Making machines faster',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Horizontal scaling adds more machines to handle increased load.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q22',
            question: 'What is vertical scaling?',
            options: [
              'Adding more machines',
              'Adding more power to existing machines',
              'Making machines smaller',
              'Making machines slower',
            ],
            correctAnswerIndex: 1,
            explanation:
                'Vertical scaling adds more power (CPU, RAM) to existing machines.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q23',
            question: 'What is load balancing?',
            options: [
              'Distributing load across multiple servers',
              'Concentrating load on one server',
              'Eliminating load',
              'Creating load',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Load balancing distributes incoming requests across multiple servers.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q24',
            question: 'What is caching?',
            options: [
              'Storing frequently accessed data in fast memory',
              'Storing all data in memory',
              'Deleting data',
              'Moving data',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Caching stores frequently accessed data in fast memory for quick retrieval.',
            type: QuestionType.multipleChoice,
          ),
          Question(
            id: 'master_q25',
            question: 'What is database sharding?',
            options: [
              'Breaking database into smaller pieces',
              'Making database bigger',
              'Deleting database',
              'Moving database',
            ],
            correctAnswerIndex: 0,
            explanation:
                'Database sharding breaks a large database into smaller, manageable pieces.',
            type: QuestionType.multipleChoice,
          ),
        ],
        timeLimitMinutes: 35,
        requiredAfterLesson: 25,
      ),
    ];
  }
}
