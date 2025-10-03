import '../../models/simple_models.dart';

class MiddleLessons {
  static List<Lesson> getLessons() {
    return [
      // Lesson 1: What is OOP?
      Lesson(
        id: 'middle_1',
        title: 'What is OOP?',
        description: 'Introduction to Object-Oriented Programming',
        content:
            'OOP = Object-Oriented Programming. Focuses on objects.\n\nReal-life example: Think of a School → many Students (objects) follow same rules.',
        level: LearningLevel.middle,
        order: 1,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_1_ex1',
            title: 'Basic Class Example',
            code:
                'class Student {\n    String name;\n    void study() { \n        System.out.println(name + " is studying"); \n    }\n}',
            output: 'No output - class definition',
            explanation:
                'This creates a Student class with a name field and study method.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Object', definition: 'real-world item'),
          GlossaryTerm(term: 'Class', definition: 'blueprint'),
        ],
      ),

      // Lesson 2: Inheritance Basics
      Lesson(
        id: 'middle_2',
        title: 'Inheritance Basics',
        description: 'How child classes inherit from parent classes',
        content:
            'A child class can use parent\'s features.\n\nReal-life example: Dog is an Animal → Dog inherits eating ability.',
        level: LearningLevel.middle,
        order: 2,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_2_ex1',
            title: 'Inheritance Example',
            code:
                'class Animal { \n    void eat(){ \n        System.out.println("Eating..."); \n    } \n}\nclass Dog extends Animal {}',
            output: 'No output - class definitions',
            explanation:
                'Dog class inherits the eat() method from Animal class.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'extends', definition: 'to inherit'),
        ],
      ),

      // Lesson 3: Method Overriding
      Lesson(
        id: 'middle_3',
        title: 'Method Overriding',
        description: 'How child classes can change parent behavior',
        content:
            'Child can change parent\'s behavior.\n\nReal-life example: All animals make sound, but dog barks differently.',
        level: LearningLevel.middle,
        order: 3,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_3_ex1',
            title: 'Method Overriding',
            code:
                'class Animal { \n    void sound(){ \n        System.out.println("Animal sound"); \n    } \n}\nclass Dog extends Animal { \n    void sound(){ \n        System.out.println("Bark"); \n    } \n}',
            output: 'No output - class definitions',
            explanation:
                'Dog class overrides the sound() method with its own implementation.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Override', definition: 'rewrite parent method'),
        ],
      ),

      // Lesson 4: super Keyword
      Lesson(
        id: 'middle_4',
        title: 'super Keyword',
        description: 'Accessing parent class methods and constructors',
        content:
            'Used to call parent methods/constructors.\n\nReal-life example: A child calling parent\'s help while doing homework.',
        level: LearningLevel.middle,
        order: 4,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_4_ex1',
            title: 'Using super Keyword',
            code:
                'class Animal { \n    void eat(){ \n        System.out.println("Eating"); \n    } \n}\nclass Dog extends Animal {\n    void eat(){\n        super.eat();\n        System.out.println("Dog eats bones");\n    }\n}',
            output: 'Eating\nDog eats bones',
            explanation:
                'super.eat() calls the parent class method first, then adds dog-specific behavior.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'super', definition: 'parent reference'),
        ],
      ),

      // Lesson 5: Polymorphism Intro
      Lesson(
        id: 'middle_5',
        title: 'Polymorphism Intro',
        description: 'One action, different results',
        content:
            'One action, different results.\n\nReal-life example: A button "press" → works differently on TV and AC.',
        level: LearningLevel.middle,
        order: 5,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_5_ex1',
            title: 'Polymorphism Example',
            code: 'Animal a = new Dog();\na.sound();  // Bark',
            output: 'Bark',
            explanation:
                'The same method call produces different results based on the actual object type.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'polymorphism', definition: 'many forms'),
        ],
      ),

      // Lesson 6: Dynamic Method Dispatch
      Lesson(
        id: 'middle_6',
        title: 'Dynamic Method Dispatch',
        description: 'Runtime method resolution',
        content:
            'Which method runs is decided at runtime.\n\nReal-life example: Calling a driver → depends who comes (car, bike driver).',
        level: LearningLevel.middle,
        order: 6,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_6_ex1',
            title: 'Dynamic Method Dispatch',
            code: 'Animal a = new Dog();\na.sound();  // Dog\'s version runs',
            output: 'Bark',
            explanation:
                'The JVM decides which sound() method to call based on the actual object type at runtime.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'runtime polymorphism',
            definition: 'method decided at runtime',
          ),
        ],
      ),

      // Lesson 7: Abstract Classes
      Lesson(
        id: 'middle_7',
        title: 'Abstract Classes',
        description: 'Classes with incomplete methods',
        content:
            'A class with incomplete methods (must be filled by child).\n\nReal-life example: Blueprint says "drive()" but car must decide how.',
        level: LearningLevel.middle,
        order: 7,
        estimatedMinutes: 9,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_7_ex1',
            title: 'Abstract Class Example',
            code:
                'abstract class Vehicle { \n    abstract void drive(); \n}\nclass Car extends Vehicle { \n    void drive(){ \n        System.out.println("Car driving"); \n    } \n}',
            output: 'No output - class definitions',
            explanation:
                'Abstract classes define incomplete methods that must be implemented by subclasses.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'abstract', definition: 'not fully defined'),
        ],
      ),

      // Lesson 8: Interfaces
      Lesson(
        id: 'middle_8',
        title: 'Interfaces',
        description: 'Contracts that classes must follow',
        content:
            'A contract of methods → classes must follow.\n\nReal-life example: Any bank must follow RBI rules.',
        level: LearningLevel.middle,
        order: 8,
        estimatedMinutes: 9,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_8_ex1',
            title: 'Interface Example',
            code:
                'interface Bank { \n    void deposit(); \n}\nclass SBI implements Bank {\n    public void deposit(){ \n        System.out.println("Deposit money"); \n    }\n}',
            output: 'No output - interface and class definitions',
            explanation:
                'Interfaces define contracts that implementing classes must follow.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'interface', definition: 'rulebook'),
        ],
      ),

      // Lesson 9: Multiple Inheritance via Interfaces
      Lesson(
        id: 'middle_9',
        title: 'Multiple Inheritance via Interfaces',
        description: 'A class can implement many interfaces',
        content:
            'A class can implement many interfaces.\n\nReal-life example: A smartphone is also a Camera + Phone.',
        level: LearningLevel.middle,
        order: 9,
        estimatedMinutes: 9,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_9_ex1',
            title: 'Multiple Interface Implementation',
            code:
                'interface Camera { \n    void click(); \n}\ninterface Phone { \n    void call(); \n}\nclass SmartPhone implements Camera, Phone {\n    public void click(){ \n        System.out.println("Clicking photo"); \n    }\n    public void call(){ \n        System.out.println("Calling"); \n    }\n}',
            output: 'No output - interface and class definitions',
            explanation:
                'A class can implement multiple interfaces, gaining all their capabilities.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'implement', definition: 'follow rules'),
        ],
      ),

      // Lesson 10: Encapsulation
      Lesson(
        id: 'middle_10',
        title: 'Encapsulation',
        description: 'Data hiding and protection',
        content:
            'Binding data with methods (hide internal details).\n\nReal-life example: A medicine bottle hides its formula, only usage is shown.',
        level: LearningLevel.middle,
        order: 10,
        estimatedMinutes: 8,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'middle_10_ex1',
            title: 'Encapsulation Example',
            code:
                'class Account {\n    private int balance = 1000;\n    public int getBalance(){ \n        return balance; \n    }\n}',
            output: 'No output - class definition',
            explanation:
                'Private data is hidden and can only be accessed through public methods.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'private', definition: 'hidden'),
          GlossaryTerm(term: 'encapsulation', definition: 'data protection'),
        ],
      ),
    ];
  }
}
