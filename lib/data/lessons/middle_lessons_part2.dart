import '../../models/simple_models.dart';

class MiddleLessonsPart2 {
  static List<Lesson> getLessons() {
    return [
      // Lesson 11: Getters and Setters
      Lesson(
        id: 'middle_11',
        title: 'Getters and Setters',
        description: 'Special methods to access private data safely',
        content:
            'Special methods to access private data safely.\n\nReal-life example: ATM lets you check balance (getter) and deposit (setter), but not touch bank database directly.',
        level: LearningLevel.middle,
        order: 11,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_11_ex1',
            title: 'Getter and Setter Example',
            code:
                'class Account {\n    private int balance = 1000;\n    public int getBalance(){ \n        return balance; \n    }\n    public void setBalance(int amount){ \n        balance = amount; \n    }\n}',
            output: 'No output - class definition',
            explanation:
                'Getters and setters provide controlled access to private data.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'getter', definition: 'read value'),
          GlossaryTerm(term: 'setter', definition: 'change value'),
        ],
      ),

      // Lesson 12: Constructors Recap
      Lesson(
        id: 'middle_12',
        title: 'Constructors Recap',
        description: 'Special method to initialize objects automatically',
        content:
            'Special method to initialize objects automatically.\n\nReal-life example: When you buy a phone, it already has default apps installed.',
        level: LearningLevel.middle,
        order: 12,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_12_ex1',
            title: 'Constructor Example',
            code:
                'class Student {\n    String name;\n    Student(String n){ \n        name = n; \n    }\n}',
            output: 'No output - class definition',
            explanation:
                'Constructors initialize objects when they are created.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'constructor', definition: 'auto initializer'),
        ],
      ),

      // Lesson 13: Constructor Overloading
      Lesson(
        id: 'middle_13',
        title: 'Constructor Overloading',
        description: 'Multiple constructors with different inputs',
        content:
            'Multiple constructors with different inputs.\n\nReal-life example: You can buy a pizza small, medium, or large.',
        level: LearningLevel.middle,
        order: 13,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_13_ex1',
            title: 'Constructor Overloading',
            code:
                'class Pizza {\n    Pizza(){ \n        System.out.println("Small pizza"); \n    }\n    Pizza(String size){ \n        System.out.println(size + " pizza"); \n    }\n}',
            output: 'Small pizza\nLarge pizza',
            explanation:
                'Multiple constructors allow different ways to create objects.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'overloading',
            definition: 'same name, different inputs',
          ),
        ],
      ),

      // Lesson 14: static Keyword Recap
      Lesson(
        id: 'middle_14',
        title: 'static Keyword Recap',
        description: 'Belongs to class, not object',
        content:
            'Belongs to class, not object.\n\nReal-life example: All humans share same planet Earth (static).',
        level: LearningLevel.middle,
        order: 14,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_14_ex1',
            title: 'Static Variable',
            code:
                'class Earth {\n    static String planet = "Earth";\n}\nSystem.out.println(Earth.planet);',
            output: 'Earth',
            explanation:
                'Static variables belong to the class, not individual objects.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'static', definition: 'shared by all objects'),
        ],
      ),

      // Lesson 15: final Keyword Recap
      Lesson(
        id: 'middle_15',
        title: 'final Keyword Recap',
        description: 'Used to make constants or prevent overriding',
        content:
            'Used to make constants or prevent overriding.\n\nReal-life example: Aadhar number never changes → final.',
        level: LearningLevel.middle,
        order: 15,
        estimatedMinutes: 6,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_15_ex1',
            title: 'Final Variable',
            code: 'final double PI = 3.14159;',
            output: 'No output - constant definition',
            explanation:
                'Final variables cannot be changed after initialization.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'final', definition: 'cannot change'),
        ],
      ),

      // Lesson 16: Packages
      Lesson(
        id: 'middle_16',
        title: 'Packages',
        description: 'Packages group classes',
        content:
            'Packages group classes.\n\nReal-life example: Clothes are kept in different cupboards (shirts, pants, etc.).',
        level: LearningLevel.middle,
        order: 16,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_16_ex1',
            title: 'Package Declaration',
            code: 'package mypackage;\nclass MyClass {}',
            output: 'No output - package and class definition',
            explanation: 'Packages organize related classes together.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'package', definition: 'folder for classes'),
        ],
      ),

      // Lesson 17: Access Modifiers
      Lesson(
        id: 'middle_17',
        title: 'Access Modifiers',
        description: 'Control visibility → public, private, protected',
        content:
            'Control visibility → public, private, protected.\n\nReal-life example:\n\nPublic road (anyone can use)\n\nPrivate house (only you)\n\nProtected park (members only).',
        level: LearningLevel.middle,
        order: 17,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_17_ex1',
            title: 'Access Modifiers',
            code:
                'public class MyClass {\n    private int secret = 10;\n    protected int shared = 20;\n    public int open = 30;\n}',
            output: 'No output - class definition',
            explanation:
                'Access modifiers control who can access class members.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'public', definition: 'everywhere'),
          GlossaryTerm(term: 'private', definition: 'inside class'),
          GlossaryTerm(term: 'protected', definition: 'subclass'),
        ],
      ),

      // Lesson 18: Inner Classes
      Lesson(
        id: 'middle_18',
        title: 'Inner Classes',
        description: 'Class inside another class',
        content:
            'Class inside another class.\n\nReal-life example: Engine is part of Car.',
        level: LearningLevel.middle,
        order: 18,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_18_ex1',
            title: 'Inner Class Example',
            code:
                'class Car {\n    class Engine { \n        void start(){ \n            System.out.println("Engine starts"); \n        } \n    }\n}',
            output: 'No output - class definition',
            explanation: 'Inner classes are defined inside other classes.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'inner class', definition: 'class inside class'),
        ],
      ),

      // Lesson 19: Anonymous Classes
      Lesson(
        id: 'middle_19',
        title: 'Anonymous Classes',
        description: 'Class without a name, created on the spot',
        content:
            'Class without a name, created on the spot.\n\nReal-life example: A temporary worker hired for one task.',
        level: LearningLevel.middle,
        order: 19,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_19_ex1',
            title: 'Anonymous Class',
            code:
                'Runnable r = new Runnable(){\n    public void run(){ \n        System.out.println("Task running"); \n    }\n};',
            output: 'No output - anonymous class definition',
            explanation:
                'Anonymous classes are created without a name for one-time use.',
          ),
        ],
        glossaryTerms: [GlossaryTerm(term: 'anonymous', definition: 'no name')],
      ),

      // Lesson 20: Exception Handling Basics
      Lesson(
        id: 'middle_20',
        title: 'Exception Handling Basics',
        description: 'Errors can stop program → handle them using try-catch',
        content:
            'Errors can stop program → handle them using try-catch.\n\nReal-life example: If glass breaks, you catch the pieces safely.',
        level: LearningLevel.middle,
        order: 20,
        estimatedMinutes: 9,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_20_ex1',
            title: 'Try-Catch Example',
            code:
                'try {\n    int x = 5/0;\n} catch(Exception e){\n    System.out.println("Error: " + e);\n}',
            output: 'Error: java.lang.ArithmeticException: / by zero',
            explanation: 'Try-catch blocks handle exceptions gracefully.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'exception', definition: 'error'),
          GlossaryTerm(term: 'catch', definition: 'handle error'),
        ],
      ),

      // Lesson 21: Multiple Catch Blocks
      Lesson(
        id: 'middle_21',
        title: 'Multiple Catch Blocks',
        description: 'Different errors need different handling',
        content:
            'Different errors need different handling.\n\nReal-life example: If bike breaks → mechanic; if tire puncture → puncture shop.',
        level: LearningLevel.middle,
        order: 21,
        estimatedMinutes: 9,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_21_ex1',
            title: 'Multiple Catch Blocks',
            code:
                'try {\n    int arr[] = new int[2];\n    arr[5] = 10;\n} catch(ArrayIndexOutOfBoundsException e){\n    System.out.println("Array error");\n} catch(Exception e){\n    System.out.println("Other error");\n}',
            output: 'Array error',
            explanation:
                'Multiple catch blocks handle different types of exceptions.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'multiple catch',
            definition: 'handle different issues',
          ),
        ],
      ),

      // Lesson 22: finally Block
      Lesson(
        id: 'middle_22',
        title: 'finally Block',
        description: 'Code that runs always, even if error comes',
        content:
            'Code that runs always, even if error comes.\n\nReal-life example: Always lock the door, whether guests come or not.',
        level: LearningLevel.middle,
        order: 22,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_22_ex1',
            title: 'Finally Block',
            code:
                'try { \n    int a = 5/0; \n}\ncatch(Exception e){ \n    System.out.println("Error"); \n}\nfinally { \n    System.out.println("Always runs"); \n}',
            output: 'Error\nAlways runs',
            explanation:
                'Finally blocks always execute, regardless of exceptions.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'finally', definition: 'guaranteed execution'),
        ],
      ),

      // Lesson 23: throw Keyword
      Lesson(
        id: 'middle_23',
        title: 'throw Keyword',
        description: 'Used to manually throw an exception',
        content:
            'Used to manually throw an exception.\n\nReal-life example: Teacher throws student out for misbehavior.',
        level: LearningLevel.middle,
        order: 23,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_23_ex1',
            title: 'Throw Exception',
            code: 'throw new ArithmeticException("Cannot divide by zero");',
            output:
                'Exception in thread "main" java.lang.ArithmeticException: Cannot divide by zero',
            explanation:
                'Throw keyword creates and throws exceptions manually.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'throw', definition: 'create error'),
        ],
      ),

      // Lesson 24: throws Keyword
      Lesson(
        id: 'middle_24',
        title: 'throws Keyword',
        description: 'Used to tell method might cause error',
        content:
            'Used to tell method might cause error.\n\nReal-life example: Warning sign "Slippery floor."',
        level: LearningLevel.middle,
        order: 24,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_24_ex1',
            title: 'Throws Declaration',
            code:
                'void risky() throws Exception { \n    // method that might throw exception\n}',
            output: 'No output - method declaration',
            explanation:
                'Throws keyword declares that a method might throw exceptions.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'throws', definition: 'method warning'),
        ],
      ),

      // Lesson 25: Custom Exceptions
      Lesson(
        id: 'middle_25',
        title: 'Custom Exceptions',
        description: 'Make your own error types',
        content:
            'Make your own error types.\n\nReal-life example: "UnderAgeException" if a kid tries to vote.',
        level: LearningLevel.middle,
        order: 25,
        estimatedMinutes: 9,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_25_ex1',
            title: 'Custom Exception',
            code:
                'class UnderAgeException extends Exception {\n    UnderAgeException(String msg){ \n        super(msg); \n    }\n}',
            output: 'No output - exception class definition',
            explanation:
                'Custom exceptions extend the Exception class for specific error types.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'custom', definition: 'user-defined'),
        ],
      ),

      // Lesson 26: Wrapper Classes
      Lesson(
        id: 'middle_26',
        title: 'Wrapper Classes',
        description: 'Convert primitives into objects (int → Integer)',
        content:
            'Convert primitives into objects (int → Integer).\n\nReal-life example: Wrapping a gift (int inside Integer).',
        level: LearningLevel.middle,
        order: 26,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_26_ex1',
            title: 'Wrapper Class Example',
            code: 'int a = 10;\nInteger b = a;',
            output: 'No output - wrapper conversion',
            explanation: 'Wrapper classes convert primitive types to objects.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'wrapper',
            definition: 'object version of primitive',
          ),
        ],
      ),

      // Lesson 27: Autoboxing
      Lesson(
        id: 'middle_27',
        title: 'Autoboxing',
        description: 'Auto conversion primitive → wrapper',
        content:
            'Auto conversion primitive → wrapper.\n\nReal-life example: Automatic gift wrapping.',
        level: LearningLevel.middle,
        order: 27,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_27_ex1',
            title: 'Autoboxing Example',
            code: 'int x = 5;\nInteger y = x; // autoboxing',
            output: 'No output - autoboxing conversion',
            explanation:
                'Autoboxing automatically converts primitives to wrapper objects.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'autoboxing', definition: 'auto wrap'),
        ],
      ),

      // Lesson 28: Unboxing
      Lesson(
        id: 'middle_28',
        title: 'Unboxing',
        description: 'Wrapper → primitive',
        content:
            'Wrapper → primitive.\n\nReal-life example: Unwrapping a gift to get the actual item.',
        level: LearningLevel.middle,
        order: 28,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_28_ex1',
            title: 'Unboxing Example',
            code: 'Integer a = 20;\nint b = a; // unboxing',
            output: 'No output - unboxing conversion',
            explanation:
                'Unboxing converts wrapper objects back to primitive types.',
          ),
        ],
        glossaryTerms: [GlossaryTerm(term: 'unboxing', definition: 'unwrap')],
      ),

      // Lesson 29: StringBuffer
      Lesson(
        id: 'middle_29',
        title: 'StringBuffer',
        description: 'Mutable (changeable) string',
        content:
            'Mutable (changeable) string.\n\nReal-life example: Whiteboard text can be changed anytime.',
        level: LearningLevel.middle,
        order: 29,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_29_ex1',
            title: 'StringBuffer Example',
            code:
                'StringBuffer sb = new StringBuffer("Hello");\nsb.append(" World");\nSystem.out.println(sb);',
            output: 'Hello World',
            explanation: 'StringBuffer allows modification of string content.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'mutable', definition: 'can change'),
        ],
      ),

      // Lesson 30: StringBuilder
      Lesson(
        id: 'middle_30',
        title: 'StringBuilder',
        description: 'Faster than StringBuffer (not thread-safe)',
        content:
            'Faster than StringBuffer (not thread-safe).\n\nReal-life example: Single person writing on whiteboard (faster than multiple people).',
        level: LearningLevel.middle,
        order: 30,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_30_ex1',
            title: 'StringBuilder Example',
            code:
                'StringBuilder sb = new StringBuilder("Java");\nsb.append(" Rocks");\nSystem.out.println(sb);',
            output: 'Java Rocks',
            explanation:
                'StringBuilder is faster than StringBuffer for single-threaded operations.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'StringBuilder',
            definition: 'fast, single thread',
          ),
        ],
      ),

      // Lesson 31: Collections Intro
      Lesson(
        id: 'middle_31',
        title: 'Collections Intro',
        description: 'Framework to store and process groups of objects',
        content:
            'Framework to store and process groups of objects.\n\nReal-life example: Books stored in a library shelf.',
        level: LearningLevel.middle,
        order: 31,
        estimatedMinutes: 7,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_31_ex1',
            title: 'Collections Concept',
            code:
                '// Collections framework provides data structures\n// like ArrayList, LinkedList, HashSet, etc.',
            output: 'No output - conceptual explanation',
            explanation:
                'Collections framework provides ready-made data structures.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'collection', definition: 'group of objects'),
        ],
      ),

      // Lesson 32: ArrayList
      Lesson(
        id: 'middle_32',
        title: 'ArrayList',
        description: 'Resizable array',
        content:
            'Resizable array.\n\nReal-life example: Expandable shopping bag that grows as you add items.',
        level: LearningLevel.middle,
        order: 32,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_32_ex1',
            title: 'ArrayList Example',
            code:
                'import java.util.*;\nArrayList<String> list = new ArrayList<>();\nlist.add("Apple");\nlist.add("Banana");\nSystem.out.println(list);',
            output: '[Apple, Banana]',
            explanation:
                'ArrayList automatically resizes as elements are added.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'ArrayList', definition: 'growable array'),
        ],
      ),

      // Lesson 33: LinkedList
      Lesson(
        id: 'middle_33',
        title: 'LinkedList',
        description: 'Elements linked like a chain',
        content:
            'Elements linked like a chain.\n\nReal-life example: Train coaches connected one after another.',
        level: LearningLevel.middle,
        order: 33,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_33_ex1',
            title: 'LinkedList Example',
            code:
                'LinkedList<String> list = new LinkedList<>();\nlist.add("Bus");\nlist.add("Car");\nSystem.out.println(list);',
            output: '[Bus, Car]',
            explanation: 'LinkedList elements are connected via pointers.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'linked', definition: 'connected chain'),
        ],
      ),

      // Lesson 34: HashSet
      Lesson(
        id: 'middle_34',
        title: 'HashSet',
        description: 'Stores unique values (no duplicates)',
        content:
            'Stores unique values (no duplicates).\n\nReal-life example: A set of unique student IDs in a class.',
        level: LearningLevel.middle,
        order: 34,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_34_ex1',
            title: 'HashSet Example',
            code:
                'HashSet<Integer> set = new HashSet<>();\nset.add(1);\nset.add(1); // ignored\nSystem.out.println(set);',
            output: '[1]',
            explanation: 'HashSet automatically prevents duplicate values.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'set', definition: 'unique collection'),
        ],
      ),

      // Lesson 35: HashMap
      Lesson(
        id: 'middle_35',
        title: 'HashMap',
        description: 'Store data as key-value pairs',
        content:
            'Store data as key-value pairs.\n\nReal-life example: Dictionary word → meaning.',
        level: LearningLevel.middle,
        order: 35,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_35_ex1',
            title: 'HashMap Example',
            code:
                'HashMap<String, String> map = new HashMap<>();\nmap.put("Dog", "Animal");\nSystem.out.println(map.get("Dog"));',
            output: 'Animal',
            explanation:
                'HashMap stores data as key-value pairs for fast lookup.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'key', definition: 'word'),
          GlossaryTerm(term: 'value', definition: 'meaning'),
        ],
      ),

      // Lesson 36: Iterator
      Lesson(
        id: 'middle_36',
        title: 'Iterator',
        description: 'Used to loop through collections',
        content:
            'Used to loop through collections.\n\nReal-life example: A librarian checking each book on the shelf.',
        level: LearningLevel.middle,
        order: 36,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_36_ex1',
            title: 'Iterator Example',
            code:
                'ArrayList<String> list = new ArrayList<>();\nlist.add("Apple");\nlist.add("Banana");\nIterator<String> it = list.iterator();\nwhile(it.hasNext()){\n    System.out.println(it.next());\n}',
            output: 'Apple\nBanana',
            explanation:
                'Iterator provides a safe way to traverse collections.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'iterator', definition: 'collection visitor'),
        ],
      ),

      // Lesson 37: Generics Intro
      Lesson(
        id: 'middle_37',
        title: 'Generics Intro',
        description: 'Allow type-safe classes/methods',
        content:
            'Allow type-safe classes/methods.\n\nReal-life example: Lunchbox made only for food (type-safe).',
        level: LearningLevel.middle,
        order: 37,
        estimatedMinutes: 9,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_37_ex1',
            title: 'Generics Example',
            code:
                'ArrayList<Integer> nums = new ArrayList<>();\nnums.add(5);\n// nums.add("hello"); // This would cause compile error',
            output: 'No output - type-safe collection',
            explanation: 'Generics ensure type safety at compile time.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'generics', definition: 'specify type'),
        ],
      ),

      // Lesson 38: Enum
      Lesson(
        id: 'middle_38',
        title: 'Enum',
        description: 'Special class for fixed constants',
        content:
            'Special class for fixed constants.\n\nReal-life example: Days of week (Mon–Sun).',
        level: LearningLevel.middle,
        order: 38,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_38_ex1',
            title: 'Enum Example',
            code:
                'enum Day { MON, TUE, WED }\nDay d = Day.MON;\nSystem.out.println(d);',
            output: 'MON',
            explanation: 'Enums define a fixed set of constants.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'enum', definition: 'fixed options'),
        ],
      ),

      // Lesson 39: Varargs
      Lesson(
        id: 'middle_39',
        title: 'Varargs',
        description: 'Method with variable arguments',
        content:
            'Method with variable arguments.\n\nReal-life example: You can order 1, 2, or many pizzas.',
        level: LearningLevel.middle,
        order: 39,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_39_ex1',
            title: 'Varargs Example',
            code:
                'void add(int... nums){ \n    int sum=0; \n    for(int n:nums) sum+=n; \n    System.out.println(sum); \n}\nadd(1,2,3,4);',
            output: '10',
            explanation:
                'Varargs allow methods to accept variable number of arguments.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'varargs', definition: 'many inputs'),
        ],
      ),

      // Lesson 40: Java Annotations
      Lesson(
        id: 'middle_40',
        title: 'Java Annotations',
        description: 'Metadata (extra info) for classes/methods',
        content:
            'Metadata (extra info) for classes/methods.\n\nReal-life example: Stickers on a package (Fragile, Handle with Care).',
        level: LearningLevel.middle,
        order: 40,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_40_ex1',
            title: 'Annotation Example',
            code:
                '@Override\npublic String toString(){ \n    return "Hello"; \n}',
            output: 'No output - annotation usage',
            explanation: 'Annotations provide metadata about code elements.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'annotation', definition: 'code label'),
        ],
      ),
    ];
  }
}
