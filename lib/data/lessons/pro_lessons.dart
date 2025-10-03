import '../../models/simple_models.dart';

class ProLessons {
  static List<Lesson> getLessons() {
    return [
      // Lesson 1: Handling Large Data with Streams
      Lesson(
        id: 'pro_1',
        title: 'Handling Large Data with Streams',
        description: 'Process huge datasets efficiently using Java Stream API',
        content:
            'Problem: Processing huge list (like 1M users) with normal loops is slow.\n\nSolution: Use Java Stream API.\n\nReal-world: Filtering customer records in milliseconds.',
        level: LearningLevel.pro,
        order: 1,
        estimatedMinutes: 12,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'pro_1_ex1',
            title: 'Stream Processing Example',
            code:
                'List<String> names = Arrays.asList("Raj","Mohan","Sita","Ravi");\nnames.stream()\n     .filter(n -> n.startsWith("R"))\n     .forEach(System.out::println);',
            output: 'Raj\nRavi',
            explanation:
                'Stream API processes data in a pipeline, making it much faster for large datasets.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Stream',
            definition: 'pipeline for data processing',
          ),
        ],
      ),

      // Lesson 2: Preventing Application Crash with Custom Exceptions
      Lesson(
        id: 'pro_2',
        title: 'Preventing Application Crash with Custom Exceptions',
        description:
            'Create custom exceptions to handle specific business logic errors',
        content:
            'Problem: Banking app must not crash if balance is low.\n\nSolution: Create a custom exception.\n\nReal-world: ATM showing warning instead of crashing.',
        level: LearningLevel.pro,
        order: 2,
        estimatedMinutes: 13,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'pro_2_ex1',
            title: 'Custom Exception Example',
            code:
                'class LowBalanceException extends Exception {\n    LowBalanceException(String msg){ super(msg); }\n}\nclass Bank {\n    void withdraw(int bal) throws LowBalanceException {\n        if(bal < 500) throw new LowBalanceException("Balance too low!");\n    }\n}',
            output: 'Exception thrown if balance < 500',
            explanation:
                'Custom exceptions allow you to handle specific business scenarios gracefully.',
          ),
        ],
        glossaryTerms: [GlossaryTerm(term: 'throw', definition: 'raise error')],
      ),

      // Lesson 3: Multi-threading for Faster Tasks
      Lesson(
        id: 'pro_3',
        title: 'Multi-threading for Faster Tasks',
        description: 'Use threads to perform multiple tasks simultaneously',
        content:
            'Problem: Downloading 100 files one by one is slow.\n\nSolution: Use threads to download in parallel.\n\nReal-world: Multiple background downloads like in Play Store.',
        level: LearningLevel.pro,
        order: 3,
        estimatedMinutes: 14,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'pro_3_ex1',
            title: 'Multi-threading Example',
            code:
                'class Download extends Thread {\n    public void run(){ System.out.println("File downloading..."); }\n}\npublic class Main {\n    public static void main(String[] args){\n        new Download().start();\n        new Download().start();\n    }\n}',
            output: 'File downloading...\nFile downloading...',
            explanation:
                'Threads allow multiple tasks to run concurrently, significantly improving performance.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Thread', definition: 'small unit of process'),
        ],
      ),

      // Lesson 4: Avoiding Duplicate Data with Sets
      Lesson(
        id: 'pro_4',
        title: 'Avoiding Duplicate Data with Sets',
        description: 'Use HashSet to ensure data uniqueness',
        content:
            'Problem: A website signup allows duplicate emails.\n\nSolution: Use HashSet to store unique emails.\n\nReal-world: Ensuring only unique usernames.',
        level: LearningLevel.pro,
        order: 4,
        estimatedMinutes: 11,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'pro_4_ex1',
            title: 'HashSet Example',
            code:
                'HashSet<String> emails = new HashSet<>();\nemails.add("test@gmail.com");\nemails.add("test@gmail.com");\nSystem.out.println(emails);  // only 1 stored',
            output: '[test@gmail.com]',
            explanation:
                'HashSet automatically prevents duplicate values, ensuring data integrity.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'HashSet', definition: 'unique values only'),
        ],
      ),

      // Lesson 5: Safe Database Transactions
      Lesson(
        id: 'pro_5',
        title: 'Safe Database Transactions',
        description: 'Use transactions to ensure data consistency',
        content:
            'Problem: If power fails during money transfer, data may corrupt.\n\nSolution: Use transaction with commit/rollback.\n\nReal-world: Bank money transfer safety.',
        level: LearningLevel.pro,
        order: 5,
        estimatedMinutes: 15,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'pro_5_ex1',
            title: 'Transaction Example',
            code:
                'conn.setAutoCommit(false);\ntry {\n   stmt.executeUpdate("UPDATE account SET bal=bal-100 WHERE id=1");\n   stmt.executeUpdate("UPDATE account SET bal=bal+100 WHERE id=2");\n   conn.commit();\n} catch(Exception e) {\n   conn.rollback();\n}',
            output: 'Transaction completed or rolled back',
            explanation:
                'Transactions ensure that either all operations succeed or all are rolled back, maintaining data integrity.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'commit', definition: 'save changes'),
          GlossaryTerm(term: 'rollback', definition: 'undo changes'),
        ],
      ),

      // Lesson 6: Reading Big Files Without Memory Error
      Lesson(
        id: 'pro_6',
        title: 'Reading Big Files Without Memory Error',
        description:
            'Process large files efficiently without running out of memory',
        content:
            'Problem: Loading 2GB file at once crashes program.\n\nSolution: Read line by line using BufferedReader.\n\nReal-world: Processing log files in server.',
        level: LearningLevel.pro,
        order: 6,
        estimatedMinutes: 12,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'pro_6_ex1',
            title: 'BufferedReader Example',
            code:
                'BufferedReader br = new BufferedReader(new FileReader("bigdata.txt"));\nString line;\nwhile((line = br.readLine()) != null){\n   System.out.println(line);\n}',
            output: '[File contents line by line]',
            explanation:
                'BufferedReader reads files line by line, preventing memory overflow with large files.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'BufferedReader',
            definition: 'reads large files efficiently',
          ),
        ],
      ),

      // Lesson 7: Real-Time Notifications with Observer Pattern
      Lesson(
        id: 'pro_7',
        title: 'Real-Time Notifications with Observer Pattern',
        description: 'Implement observer pattern for real-time notifications',
        content:
            'Problem: YouTube app must notify subscribers when video uploads.\n\nSolution: Use Observer Design Pattern.\n\nReal-world: Instagram push notifications.',
        level: LearningLevel.pro,
        order: 7,
        estimatedMinutes: 16,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'pro_7_ex1',
            title: 'Observer Pattern Example',
            code:
                'interface Observer { void update(String msg); }\nclass User implements Observer {\n   public void update(String msg){ System.out.println("Notification: " + msg); }\n}',
            output: 'Notification: [message]',
            explanation:
                'Observer pattern allows objects to notify multiple subscribers about state changes.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Observer',
            definition: 'watches subject for updates',
          ),
        ],
      ),

      // Lesson 8: Scheduling Tasks Automatically
      Lesson(
        id: 'pro_8',
        title: 'Scheduling Tasks Automatically',
        description: 'Automate task execution at specific times',
        content:
            'Problem: Send daily report at 10 AM.\n\nSolution: Use ScheduledExecutorService.\n\nReal-world: Auto backup or auto email sender.',
        level: LearningLevel.pro,
        order: 8,
        estimatedMinutes: 13,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'pro_8_ex1',
            title: 'Scheduled Task Example',
            code:
                'ScheduledExecutorService sch = Executors.newScheduledThreadPool(1);\nsch.scheduleAtFixedRate(() -> System.out.println("Report sent!"), 0, 1, TimeUnit.DAYS);',
            output: 'Report sent! (repeated daily)',
            explanation:
                'ScheduledExecutorService allows you to run tasks at fixed intervals or specific times.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'schedule', definition: 'run automatically'),
        ],
      ),

      // Lesson 9: Preventing NullPointer with Optional
      Lesson(
        id: 'pro_9',
        title: 'Preventing NullPointer with Optional',
        description: 'Use Optional class to handle null values safely',
        content:
            'Problem: App crashes when user profile is empty.\n\nSolution: Use Optional class.\n\nReal-world: Show "Guest" instead of crash.',
        level: LearningLevel.pro,
        order: 9,
        estimatedMinutes: 11,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'pro_9_ex1',
            title: 'Optional Example',
            code:
                'Optional<String> name = Optional.ofNullable(null);\nSystem.out.println(name.orElse("Guest"));',
            output: 'Guest',
            explanation:
                'Optional class provides a safe way to handle potentially null values without causing NullPointerException.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Optional', definition: 'safe wrapper for null'),
        ],
      ),

      // Lesson 10: Real-Time Chat (Sockets)
      Lesson(
        id: 'pro_10',
        title: 'Real-Time Chat (Sockets)',
        description: 'Create real-time communication using socket programming',
        content:
            'Problem: Users need live chat.\n\nSolution: Use Socket Programming.\n\nReal-world: WhatsApp/Telegram chat backend.',
        level: LearningLevel.pro,
        order: 10,
        estimatedMinutes: 18,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'pro_10_ex1',
            title: 'Socket Programming Example',
            code:
                'ServerSocket ss = new ServerSocket(9999);\nSocket s = ss.accept();\nSystem.out.println("Client connected!");',
            output: 'Client connected!',
            explanation:
                'Socket programming enables real-time communication between client and server applications.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Socket',
            definition: 'connection between two systems',
          ),
        ],
      ),
    ];
  }
}
