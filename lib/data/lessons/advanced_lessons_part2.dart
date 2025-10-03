import '../../models/simple_models.dart';

class AdvancedLessonsPart2 {
  static List<Lesson> getLessons() {
    return [
      // Lesson 21: Iterator
      Lesson(
        id: 'advanced_21',
        title: 'Iterator',
        description: 'Loop through collections safely',
        content:
            'Loop through collections.\n\nReal-life example: Librarian checking each book on shelf.',
        level: LearningLevel.advanced,
        order: 21,
        estimatedMinutes: 9,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_21_ex1',
            title: 'Iterator Example',
            code:
                'import java.util.*;\nArrayList<String> list = new ArrayList<>();\nlist.add("Apple");\nlist.add("Banana");\nIterator<String> it = list.iterator();\nwhile(it.hasNext()) {\n    System.out.println(it.next());\n}',
            output: 'Apple\nBanana',
            explanation:
                'Iterator provides a safe way to traverse collections.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Iterator', definition: 'collection traverser'),
        ],
      ),

      // Lesson 22: Generics
      Lesson(
        id: 'advanced_22',
        title: 'Generics',
        description: 'Type-safe collections',
        content:
            'Type-safe collections.\n\nReal-life example: Labeled boxes that only accept specific items.',
        level: LearningLevel.advanced,
        order: 22,
        estimatedMinutes: 10,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_22_ex1',
            title: 'Generics Example',
            code:
                'import java.util.*;\nArrayList<Integer> numbers = new ArrayList<>();\nnumbers.add(10);\nnumbers.add(20);\n// numbers.add("Hello"); // Compile error!\nSystem.out.println(numbers);',
            output: '[10, 20]',
            explanation: 'Generics ensure type safety at compile time.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Generics', definition: 'type safety'),
        ],
      ),

      // Lesson 23: Thread Basics
      Lesson(
        id: 'advanced_23',
        title: 'Thread Basics',
        description: 'Run multiple tasks simultaneously',
        content:
            'Run multiple tasks at same time.\n\nReal-life example: Chef cooking multiple dishes simultaneously.',
        level: LearningLevel.advanced,
        order: 23,
        estimatedMinutes: 10,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_23_ex1',
            title: 'Thread Example',
            code:
                'class MyThread extends Thread {\n    public void run() {\n        for(int i=0; i<5; i++) {\n            System.out.println("Thread: " + i);\n        }\n    }\n}\nMyThread t = new MyThread();\nt.start();',
            output: 'Thread: 0\nThread: 1\nThread: 2\nThread: 3\nThread: 4',
            explanation:
                'Threads allow programs to perform multiple tasks concurrently.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Thread', definition: 'concurrent execution'),
        ],
      ),

      // Lesson 24: Creating Threads
      Lesson(
        id: 'advanced_24',
        title: 'Creating Threads',
        description: 'Two ways to create threads',
        content:
            'Two ways: extend Thread OR implement Runnable.\n\nReal-life example: Two different ways to start a car engine.',
        level: LearningLevel.advanced,
        order: 24,
        estimatedMinutes: 10,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_24_ex1',
            title: 'Thread Creation Methods',
            code:
                '// Method 1: Extend Thread\nclass MyThread extends Thread {\n    public void run() {\n        System.out.println("Thread running");\n    }\n}\n\n// Method 2: Implement Runnable\nclass MyRunnable implements Runnable {\n    public void run() {\n        System.out.println("Runnable running");\n    }\n}\n\n// Usage\nnew MyThread().start();\nnew Thread(new MyRunnable()).start();',
            output: 'Thread running\nRunnable running',
            explanation:
                'Two different approaches to create and start threads.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Runnable', definition: 'thread interface'),
        ],
      ),

      // Lesson 25: Thread Priority
      Lesson(
        id: 'advanced_25',
        title: 'Thread Priority',
        description: 'Set importance of threads',
        content:
            'Set importance of thread.\n\nReal-life example: VIP customers get priority service.',
        level: LearningLevel.advanced,
        order: 25,
        estimatedMinutes: 9,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_25_ex1',
            title: 'Thread Priority Example',
            code:
                'Thread t1 = new Thread(() -> System.out.println("Low priority"));\nThread t2 = new Thread(() -> System.out.println("High priority"));\nt1.setPriority(Thread.MIN_PRIORITY);\nt2.setPriority(Thread.MAX_PRIORITY);\nt1.start();\nt2.start();',
            output: 'High priority\nLow priority',
            explanation: 'Thread priority affects the order of execution.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Priority', definition: 'thread importance'),
        ],
      ),

      // Lesson 26: Synchronization
      Lesson(
        id: 'advanced_26',
        title: 'Synchronization',
        description: 'Prevent data corruption in multithreading',
        content:
            'Prevent multiple threads from messing shared data.\n\nReal-life example: Only one person can use ATM at a time.',
        level: LearningLevel.advanced,
        order: 26,
        estimatedMinutes: 11,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_26_ex1',
            title: 'Synchronization Example',
            code:
                'class Counter {\n    private int count = 0;\n    \n    public synchronized void increment() {\n        count++;\n    }\n    \n    public int getCount() {\n        return count;\n    }\n}',
            output: 'No output - synchronized method',
            explanation:
                'Synchronization prevents multiple threads from accessing shared data simultaneously.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Synchronization', definition: 'thread safety'),
        ],
      ),

      // Lesson 27: Inter-thread Communication
      Lesson(
        id: 'advanced_27',
        title: 'Inter-thread Communication',
        description: 'Threads communicate using wait() and notify()',
        content:
            'Threads talk via wait(), notify().\n\nReal-life example: Customer waits for product, shop notifies when ready.',
        level: LearningLevel.advanced,
        order: 27,
        estimatedMinutes: 11,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_27_ex1',
            title: 'Wait-Notify Example',
            code:
                'class Message {\n    private String message;\n    \n    public synchronized void setMessage(String msg) {\n        this.message = msg;\n        notify(); // Notify waiting thread\n    }\n    \n    public synchronized String getMessage() {\n        try {\n            wait(); // Wait for message\n        } catch (InterruptedException e) {}\n        return message;\n    }\n}',
            output: 'No output - communication mechanism',
            explanation:
                'wait() and notify() enable threads to communicate and coordinate.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'wait()', definition: 'thread waiting'),
          GlossaryTerm(term: 'notify()', definition: 'thread notification'),
        ],
      ),

      // Lesson 28: Deadlock
      Lesson(
        id: 'advanced_28',
        title: 'Deadlock',
        description: 'When threads wait forever for each other',
        content:
            'Two threads wait forever for each other.\n\nReal-life example: Two people waiting for each other to move.',
        level: LearningLevel.advanced,
        order: 28,
        estimatedMinutes: 10,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_28_ex1',
            title: 'Deadlock Example',
            code:
                '// Example of deadlock scenario\nObject resource1 = new Object();\nObject resource2 = new Object();\n\n// Thread 1: locks resource1, then resource2\n// Thread 2: locks resource2, then resource1\n// This can cause deadlock!',
            output: 'No output - deadlock scenario',
            explanation:
                'Deadlock occurs when threads wait indefinitely for each other.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Deadlock', definition: 'infinite waiting'),
        ],
      ),

      // Lesson 29: Java Networking – Intro
      Lesson(
        id: 'advanced_29',
        title: 'Java Networking – Intro',
        description: 'Connect computers over network',
        content:
            'Connect computers.\n\nReal-life example: Phone calls connecting two people.',
        level: LearningLevel.advanced,
        order: 29,
        estimatedMinutes: 10,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_29_ex1',
            title: 'Networking Concept',
            code:
                'import java.net.*;\n// Networking allows Java programs to:\n// - Connect to other computers\n// - Send and receive data\n// - Create client-server applications',
            output: 'No output - networking concept',
            explanation:
                'Java networking enables communication between different computers.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Networking',
            definition: 'computer communication',
          ),
        ],
      ),

      // Lesson 30: Socket Programming
      Lesson(
        id: 'advanced_30',
        title: 'Socket Programming',
        description: 'Client-Server communication',
        content:
            'Client-Server chat.\n\nReal-life example: Customer calling customer service.',
        level: LearningLevel.advanced,
        order: 30,
        estimatedMinutes: 12,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_30_ex1',
            title: 'Socket Example',
            code:
                'import java.net.*;\nimport java.io.*;\n\n// Server\nServerSocket server = new ServerSocket(8080);\nSocket client = server.accept();\n\n// Client\nSocket socket = new Socket("localhost", 8080);\nPrintWriter out = new PrintWriter(socket.getOutputStream());\nout.println("Hello Server");',
            output: 'Connection established',
            explanation:
                'Sockets enable communication between client and server applications.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Socket', definition: 'communication endpoint'),
        ],
      ),

      // Lesson 31: JDBC Intro
      Lesson(
        id: 'advanced_31',
        title: 'JDBC Intro',
        description: 'Connect Java with database',
        content:
            'Connect Java with database.\n\nReal-life example: Library system connecting to book database.',
        level: LearningLevel.advanced,
        order: 31,
        estimatedMinutes: 11,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_31_ex1',
            title: 'JDBC Connection',
            code:
                'import java.sql.*;\n\n// Load driver\nClass.forName("com.mysql.jdbc.Driver");\n\n// Create connection\nConnection con = DriverManager.getConnection(\n    "jdbc:mysql://localhost:3306/mydb", "user", "password");\n\nSystem.out.println("Connected to database");',
            output: 'Connected to database',
            explanation:
                'JDBC allows Java programs to connect to and interact with databases.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'JDBC', definition: 'Java Database Connectivity'),
        ],
      ),

      // Lesson 32: JDBC CRUD
      Lesson(
        id: 'advanced_32',
        title: 'JDBC CRUD',
        description: 'Create, Read, Update, Delete operations',
        content:
            'Insert, Update, Delete, Select in DB.\n\nReal-life example: Managing student records in school database.',
        level: LearningLevel.advanced,
        order: 32,
        estimatedMinutes: 12,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_32_ex1',
            title: 'CRUD Operations',
            code:
                '// CREATE (Insert)\nString insert = "INSERT INTO students (name, age) VALUES (?, ?)";\nPreparedStatement ps = con.prepareStatement(insert);\nps.setString(1, "John");\nps.setInt(2, 20);\nps.executeUpdate();\n\n// READ (Select)\nString select = "SELECT * FROM students";\nResultSet rs = stmt.executeQuery(select);\nwhile(rs.next()) {\n    System.out.println(rs.getString("name"));\n}',
            output: 'John',
            explanation: 'CRUD operations allow complete database management.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'CRUD', definition: 'Create Read Update Delete'),
        ],
      ),

      // Lesson 33: JDBC PreparedStatement
      Lesson(
        id: 'advanced_33',
        title: 'JDBC PreparedStatement',
        description: 'Faster and safer database queries',
        content:
            'Faster DB queries.\n\nReal-life example: Pre-written form vs writing from scratch.',
        level: LearningLevel.advanced,
        order: 33,
        estimatedMinutes: 11,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_33_ex1',
            title: 'PreparedStatement Example',
            code:
                'String sql = "SELECT * FROM students WHERE age > ?";\nPreparedStatement ps = con.prepareStatement(sql);\nps.setInt(1, 18);\nResultSet rs = ps.executeQuery();\n\n// Benefits:\n// 1. Faster execution\n// 2. Prevents SQL injection\n// 3. Reusable',
            output: 'Query executed safely',
            explanation:
                'PreparedStatement provides better performance and security.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'PreparedStatement',
            definition: 'pre-compiled SQL',
          ),
        ],
      ),

      // Lesson 34: JDBC Transactions
      Lesson(
        id: 'advanced_34',
        title: 'JDBC Transactions',
        description: 'Group database operations together',
        content:
            'Commit & rollback.\n\nReal-life example: Bank transfer - both accounts must update or neither.',
        level: LearningLevel.advanced,
        order: 34,
        estimatedMinutes: 11,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_34_ex1',
            title: 'Transaction Example',
            code:
                'con.setAutoCommit(false); // Start transaction\ntry {\n    // Transfer money from account A to B\n    stmt.executeUpdate("UPDATE accounts SET balance = balance - 100 WHERE id = 1");\n    stmt.executeUpdate("UPDATE accounts SET balance = balance + 100 WHERE id = 2");\n    con.commit(); // Save changes\n} catch (Exception e) {\n    con.rollback(); // Undo changes\n}',
            output: 'Transaction completed or rolled back',
            explanation:
                'Transactions ensure data consistency by grouping related operations.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Transaction', definition: 'grouped operations'),
          GlossaryTerm(term: 'Commit', definition: 'save changes'),
          GlossaryTerm(term: 'Rollback', definition: 'undo changes'),
        ],
      ),

      // Lesson 35: Lambda Expressions
      Lesson(
        id: 'advanced_35',
        title: 'Lambda Expressions',
        description: 'Short way to write functions',
        content:
            'Short way to write functions.\n\nReal-life example: Quick note vs detailed letter.',
        level: LearningLevel.advanced,
        order: 35,
        estimatedMinutes: 10,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_35_ex1',
            title: 'Lambda Example',
            code:
                'import java.util.*;\n\n// Old way\nList<String> names = Arrays.asList("Alice", "Bob", "Charlie");\nnames.forEach(new Consumer<String>() {\n    public void accept(String name) {\n        System.out.println(name);\n    }\n});\n\n// Lambda way\nnames.forEach(name -> System.out.println(name));',
            output: 'Alice\nBob\nCharlie',
            explanation:
                'Lambda expressions provide a concise way to write anonymous functions.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Lambda', definition: 'short function'),
        ],
      ),

      // Lesson 36: Stream API
      Lesson(
        id: 'advanced_36',
        title: 'Stream API',
        description: 'Process collections easily',
        content:
            'Process collections easily.\n\nReal-life example: Assembly line processing items.',
        level: LearningLevel.advanced,
        order: 36,
        estimatedMinutes: 11,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_36_ex1',
            title: 'Stream Example',
            code:
                'import java.util.*;\nList<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);\n\n// Filter even numbers and square them\nList<Integer> result = numbers.stream()\n    .filter(n -> n % 2 == 0)\n    .map(n -> n * n)\n    .collect(Collectors.toList());\n\nSystem.out.println(result);',
            output: '[4, 16]',
            explanation:
                'Stream API provides functional-style operations on collections.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Stream', definition: 'collection processor'),
        ],
      ),

      // Lesson 37: Optional Class
      Lesson(
        id: 'advanced_37',
        title: 'Optional Class',
        description: 'Handle null values safely',
        content:
            'Handle null values safely.\n\nReal-life example: Safe way to check if gift box contains item.',
        level: LearningLevel.advanced,
        order: 37,
        estimatedMinutes: 10,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_37_ex1',
            title: 'Optional Example',
            code:
                'import java.util.*;\n\nOptional<String> name = Optional.of("John");\n\n// Safe way to handle potential null\nif (name.isPresent()) {\n    System.out.println(name.get());\n}\n\n// Or use ifPresent\nname.ifPresent(n -> System.out.println("Hello " + n));',
            output: 'John\nHello John',
            explanation:
                'Optional class helps avoid NullPointerException by wrapping potentially null values.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Optional', definition: 'null-safe wrapper'),
        ],
      ),

      // Lesson 38: Annotations
      Lesson(
        id: 'advanced_38',
        title: 'Annotations',
        description: 'Special instructions to compiler/runtime',
        content:
            'Special instructions to compiler/runtime.\n\nReal-life example: Labels on packages with handling instructions.',
        level: LearningLevel.advanced,
        order: 38,
        estimatedMinutes: 10,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_38_ex1',
            title: 'Annotation Example',
            code:
                '@Override\npublic String toString() {\n    return "Custom object";\n}\n\n@Deprecated\npublic void oldMethod() {\n    // This method is deprecated\n}\n\n@SuppressWarnings("unchecked")\npublic void methodWithWarnings() {\n    // Suppress compiler warnings\n}',
            output: 'No output - annotation usage',
            explanation: 'Annotations provide metadata about code elements.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Annotation', definition: 'code metadata'),
        ],
      ),

      // Lesson 39: Reflection API
      Lesson(
        id: 'advanced_39',
        title: 'Reflection API',
        description: 'Inspect classes at runtime',
        content:
            'Inspect classes at runtime.\n\nReal-life example: X-ray machine examining internal structure.',
        level: LearningLevel.advanced,
        order: 39,
        estimatedMinutes: 11,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_39_ex1',
            title: 'Reflection Example',
            code:
                'import java.lang.reflect.*;\n\nClass<?> clazz = String.class;\n\n// Get class name\nSystem.out.println("Class: " + clazz.getName());\n\n// Get methods\nMethod[] methods = clazz.getMethods();\nfor (Method method : methods) {\n    System.out.println("Method: " + method.getName());\n}',
            output:
                'Class: java.lang.String\nMethod: charAt\nMethod: length\n...',
            explanation:
                'Reflection allows programs to examine and modify their own structure at runtime.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Reflection', definition: 'runtime inspection'),
        ],
      ),

      // Lesson 40: Mini Project
      Lesson(
        id: 'advanced_40',
        title: 'Mini Project',
        description: 'Student Management System',
        content:
            'Combine file handling + JDBC + OOP.\n\nReal-life example: Student Management System.',
        level: LearningLevel.advanced,
        order: 40,
        estimatedMinutes: 15,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'advanced_40_ex1',
            title: 'Student Management System',
            code:
                'import java.util.*;\nimport java.sql.*;\nimport java.io.*;\n\nclass Student {\n    private int id;\n    private String name;\n    private int age;\n    \n    // Constructor, getters, setters\n    public Student(int id, String name, int age) {\n        this.id = id;\n        this.name = name;\n        this.age = age;\n    }\n    \n    @Override\n    public String toString() {\n        return "Student{id=" + id + ", name=\'" + name + "\', age=" + age + "}";\n    }\n}\n\nclass StudentManager {\n    private List<Student> students = new ArrayList<>();\n    \n    public void addStudent(Student student) {\n        students.add(student);\n    }\n    \n    public void saveToFile(String filename) throws IOException {\n        try (PrintWriter writer = new PrintWriter(filename)) {\n            for (Student s : students) {\n                writer.println(s.toString());\n            }\n        }\n    }\n    \n    public void displayAll() {\n        students.forEach(System.out::println);\n    }\n}\n\n// Usage\nStudentManager manager = new StudentManager();\nmanager.addStudent(new Student(1, "Alice", 20));\nmanager.addStudent(new Student(2, "Bob", 22));\nmanager.displayAll();',
            output:
                'Student{id=1, name=\'Alice\', age=20}\nStudent{id=2, name=\'Bob\', age=22}',
            explanation:
                'This project combines OOP, collections, file handling, and demonstrates real-world application development.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Project', definition: 'real application'),
        ],
      ),
    ];
  }
}
