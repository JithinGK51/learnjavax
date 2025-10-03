import '../../models/simple_models.dart';

class MasterLessons {
  static List<Lesson> getLessons() {
    return [
      // Lesson 1: Design Patterns – Why & Where
      Lesson(
        id: 'master_1',
        title: 'Design Patterns – Why & Where',
        description:
            'Learn why design patterns are essential for enterprise development',
        content:
            'Patterns are like shortcuts to solve common coding problems.\n\nReal-life: Architect reuses house designs instead of starting fresh every time.\n\nUse case: Database connection pool.',
        level: LearningLevel.master,
        order: 1,
        estimatedMinutes: 15,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_1_ex1',
            title: 'Singleton Pattern Example',
            code:
                'class Printer {\n   private static Printer instance;\n   private Printer() {}\n   public static Printer getInstance(){\n      if(instance == null) instance = new Printer();\n      return instance;\n   }\n}',
            output: 'Only one Printer instance created',
            explanation:
                'Singleton Pattern ensures only one object of a class exists throughout the application.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Design Pattern',
            definition: 'reusable solution to common problems',
          ),
          GlossaryTerm(
            term: 'Singleton',
            definition: 'only one instance allowed',
          ),
        ],
      ),

      // Lesson 2: Factory Design Pattern
      Lesson(
        id: 'master_2',
        title: 'Factory Design Pattern',
        description: 'Hide object creation logic behind a factory',
        content:
            'Hides object creation logic.\n\nReal-life: Car showroom decides which car to give.\n\nUse case: Creating different types of objects based on input.',
        level: LearningLevel.master,
        order: 2,
        estimatedMinutes: 16,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_2_ex1',
            title: 'Factory Pattern Example',
            code:
                'interface Vehicle { void drive(); }\nclass Bike implements Vehicle { \n    public void drive(){ System.out.println("Bike running"); }\n}\nclass Car implements Vehicle { \n    public void drive(){ System.out.println("Car running"); }\n}\nclass VehicleFactory {\n   static Vehicle getVehicle(String type){\n      if(type.equals("car")) return new Car();\n      else return new Bike();\n   }\n}',
            output: 'Vehicle created based on type',
            explanation:
                'Factory pattern encapsulates object creation logic and provides a common interface.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Factory Pattern',
            definition: 'creates objects without specifying exact class',
          ),
        ],
      ),

      // Lesson 3: Dependency Injection
      Lesson(
        id: 'master_3',
        title: 'Dependency Injection',
        description:
            'Inject dependencies from outside instead of creating them inside',
        content:
            'Don\'t create objects inside class → give them from outside.\n\nReal-life: Hiring driver → you don\'t train him, he already knows driving.\n\nUse case: Spring Framework core principle.',
        level: LearningLevel.master,
        order: 3,
        estimatedMinutes: 18,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_3_ex1',
            title: 'Dependency Injection Concept',
            code:
                '// Instead of creating inside class\nclass UserService {\n    private Database db = new MySQLDatabase(); // ❌ Tight coupling\n}\n\n// Inject from outside\nclass UserService {\n    private Database db;\n    public UserService(Database db) { this.db = db; } // ✅ Loose coupling\n}',
            output: 'Better testable and maintainable code',
            explanation:
                'Dependency injection makes code more testable and loosely coupled.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Dependency Injection',
            definition: 'inject dependencies from outside',
          ),
        ],
      ),

      // Lesson 4: Multithreading in Real Systems
      Lesson(
        id: 'master_4',
        title: 'Multithreading in Real Systems',
        description: 'Handle thousands of concurrent users efficiently',
        content:
            'Handling 1000+ users at same time.\n\nReal-life: Web server handling multiple requests simultaneously.\n\nUse case: High-traffic web applications.',
        level: LearningLevel.master,
        order: 4,
        estimatedMinutes: 20,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_4_ex1',
            title: 'ExecutorService Example',
            code:
                'ExecutorService ex = Executors.newFixedThreadPool(10);\nfor(int i=0; i<100; i++){\n   int user = i;\n   ex.submit(() -> System.out.println("Handling user " + user));\n}\nex.shutdown();',
            output: 'Handling user 0\nHandling user 1\n... (concurrently)',
            explanation:
                'ExecutorService manages a pool of threads to handle multiple tasks efficiently.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'ExecutorService',
            definition: 'manages thread pool',
          ),
        ],
      ),

      // Lesson 5: Concurrency Problems & Solutions
      Lesson(
        id: 'master_5',
        title: 'Concurrency Problems & Solutions',
        description: 'Solve race conditions and thread safety issues',
        content:
            'Avoid race conditions with synchronized/locks.\n\nReal-life: Two ATMs withdrawing same account at once.\n\nUse case: Banking systems, e-commerce platforms.',
        level: LearningLevel.master,
        order: 5,
        estimatedMinutes: 19,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_5_ex1',
            title: 'Thread Safety Example',
            code:
                'class BankAccount {\n    private int balance = 1000;\n    private final Object lock = new Object();\n    \n    public void withdraw(int amount) {\n        synchronized(lock) {\n            if(balance >= amount) {\n                balance -= amount;\n                System.out.println("Withdrawn: " + amount);\n            }\n        }\n    }\n}',
            output: 'Safe withdrawal without race conditions',
            explanation:
                'Synchronization prevents multiple threads from accessing shared data simultaneously.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Race Condition',
            definition: 'unpredictable behavior due to concurrent access',
          ),
          GlossaryTerm(
            term: 'Synchronization',
            definition: 'thread safety mechanism',
          ),
        ],
      ),

      // Lesson 6: JVM Deep Dive
      Lesson(
        id: 'master_6',
        title: 'JVM Deep Dive',
        description: 'Understand Java Virtual Machine internals',
        content:
            'Learn about heap, stack, garbage collection.\n\nReal-world: Optimize memory for large apps.\n\nUse case: Performance tuning and memory optimization.',
        level: LearningLevel.master,
        order: 6,
        estimatedMinutes: 22,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_6_ex1',
            title: 'JVM Memory Management',
            code:
                '// Heap: Object storage\nString name = new String("Java"); // Stored in heap\n\n// Stack: Method calls and local variables\npublic void method() {\n    int localVar = 10; // Stored in stack\n}\n\n// Garbage Collection\nSystem.gc(); // Suggest garbage collection',
            output: 'Memory managed automatically by JVM',
            explanation:
                'JVM manages memory through heap (objects) and stack (method calls).',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'JVM', definition: 'Java Virtual Machine'),
          GlossaryTerm(term: 'Heap', definition: 'object storage area'),
          GlossaryTerm(term: 'Stack', definition: 'method call storage'),
        ],
      ),

      // Lesson 7: Reflection API in Frameworks
      Lesson(
        id: 'master_7',
        title: 'Reflection API in Frameworks',
        description: 'Use reflection for framework development',
        content:
            'Check and change classes at runtime.\n\nReal-life: Spring finds @Controller classes automatically.\n\nUse case: Framework development, annotation processing.',
        level: LearningLevel.master,
        order: 7,
        estimatedMinutes: 17,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_7_ex1',
            title: 'Reflection in Frameworks',
            code:
                'Class c = Class.forName("java.util.ArrayList");\nMethod[] methods = c.getMethods();\nfor(Method method : methods) {\n    System.out.println("Method: " + method.getName());\n}\n\n// Create instance dynamically\nObject list = c.newInstance();',
            output: 'Method: add\nMethod: remove\nMethod: size\n...',
            explanation:
                'Reflection allows frameworks to inspect and manipulate classes at runtime.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Reflection',
            definition: 'runtime class inspection',
          ),
        ],
      ),

      // Lesson 8: Annotations & Meta-Programming
      Lesson(
        id: 'master_8',
        title: 'Annotations & Meta-Programming',
        description: 'Use annotations for framework development',
        content:
            'Used in frameworks to add meaning.\n\nReal-life: @Override, @Autowired.\n\nUse case: Spring Framework, Hibernate, custom frameworks.',
        level: LearningLevel.master,
        order: 8,
        estimatedMinutes: 16,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_8_ex1',
            title: 'Custom Annotation Example',
            code:
                '@Retention(RetentionPolicy.RUNTIME)\n@Target(ElementType.METHOD)\n@interface TestMethod {\n    String value() default "";\n}\n\nclass TestClass {\n    @TestMethod("This is a test method")\n    public void testMethod() {\n        System.out.println("Test executed");\n    }\n}',
            output: 'Custom annotation applied to method',
            explanation:
                'Annotations provide metadata about code elements for frameworks to process.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Annotation',
            definition: 'metadata for code elements',
          ),
          GlossaryTerm(
            term: 'Meta-Programming',
            definition: 'programs that manipulate other programs',
          ),
        ],
      ),

      // Lesson 9: Java Security
      Lesson(
        id: 'master_9',
        title: 'Java Security',
        description: 'Implement security measures in Java applications',
        content:
            'Hashing passwords, encryption.\n\nReal-life: Secure user authentication, data protection.\n\nUse case: Banking apps, e-commerce, any secure application.',
        level: LearningLevel.master,
        order: 9,
        estimatedMinutes: 18,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_9_ex1',
            title: 'Password Hashing Example',
            code:
                'import java.security.MessageDigest;\n\npublic String hashPassword(String password) {\n    try {\n        MessageDigest md = MessageDigest.getInstance("SHA-256");\n        byte[] hash = md.digest(password.getBytes());\n        StringBuilder sb = new StringBuilder();\n        for(byte b : hash) {\n            sb.append(String.format("%02x", b));\n        }\n        return sb.toString();\n    } catch(Exception e) {\n        return null;\n    }\n}',
            output: 'Hashed password string',
            explanation:
                'SHA-256 hashing ensures passwords are stored securely.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(term: 'Hashing', definition: 'one-way encryption'),
          GlossaryTerm(term: 'SHA-256', definition: 'secure hash algorithm'),
        ],
      ),

      // Lesson 10: REST API with Java
      Lesson(
        id: 'master_10',
        title: 'REST API with Java',
        description: 'Create RESTful web services',
        content:
            'Expose data over internet.\n\nTools: Spring Boot.\n\nReal-life: Weather API, Payment API.\n\nUse case: Mobile app backends, microservices.',
        level: LearningLevel.master,
        order: 10,
        estimatedMinutes: 20,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_10_ex1',
            title: 'REST Controller Example',
            code:
                '@RestController\n@RequestMapping("/api/users")\npublic class UserController {\n    \n    @GetMapping\n    public List<User> getAllUsers() {\n        return userService.findAll();\n    }\n    \n    @PostMapping\n    public User createUser(@RequestBody User user) {\n        return userService.save(user);\n    }\n}',
            output: 'REST endpoints for user management',
            explanation:
                'REST APIs provide HTTP-based communication between client and server.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'REST API',
            definition: 'Representational State Transfer',
          ),
          GlossaryTerm(term: 'HTTP', definition: 'HyperText Transfer Protocol'),
        ],
      ),

      // Lesson 11: Microservices Intro
      Lesson(
        id: 'master_11',
        title: 'Microservices Intro',
        description: 'Break monolithic applications into microservices',
        content:
            'Break app into small services.\n\nReal-life: Amazon → Payments, Orders, Delivery are separate services.\n\nUse case: Large-scale applications, cloud-native development.',
        level: LearningLevel.master,
        order: 11,
        estimatedMinutes: 19,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_11_ex1',
            title: 'Microservice Communication',
            code:
                '// User Service\n@RestController\npublic class UserController {\n    @GetMapping("/users/{id}")\n    public User getUser(@PathVariable Long id) {\n        return userService.findById(id);\n    }\n}\n\n// Order Service calls User Service\n@Service\npublic class OrderService {\n    @Autowired\n    private RestTemplate restTemplate;\n    \n    public User getUser(Long userId) {\n        return restTemplate.getForObject(\n            "http://user-service/users/" + userId, User.class);\n    }\n}',
            output: 'Services communicate via HTTP',
            explanation:
                'Microservices are independent, loosely coupled services that communicate over HTTP.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Microservices',
            definition: 'small independent services',
          ),
        ],
      ),

      // Lesson 12: Message Queues
      Lesson(
        id: 'master_12',
        title: 'Message Queues',
        description: 'Handle asynchronous communication with message queues',
        content:
            'Kafka/RabbitMQ for handling millions of events.\n\nReal-life: Order processing, notification systems.\n\nUse case: Event-driven architecture, high-throughput systems.',
        level: LearningLevel.master,
        order: 12,
        estimatedMinutes: 18,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_12_ex1',
            title: 'Message Queue Concept',
            code:
                '// Producer sends message\n@Component\npublic class OrderProducer {\n    @Autowired\n    private KafkaTemplate<String, String> kafkaTemplate;\n    \n    public void sendOrder(Order order) {\n        kafkaTemplate.send("orders", order.toString());\n    }\n}\n\n// Consumer processes message\n@KafkaListener(topics = "orders")\npublic void processOrder(String order) {\n    System.out.println("Processing: " + order);\n}',
            output: 'Asynchronous message processing',
            explanation:
                'Message queues enable asynchronous, reliable communication between services.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Message Queue',
            definition: 'asynchronous communication mechanism',
          ),
        ],
      ),

      // Lesson 13: Caching with Redis
      Lesson(
        id: 'master_13',
        title: 'Caching with Redis',
        description: 'Implement caching for better performance',
        content:
            'Faster responses by storing in memory.\n\nReal-life: Storing last search results.\n\nUse case: High-traffic applications, database optimization.',
        level: LearningLevel.master,
        order: 13,
        estimatedMinutes: 17,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_13_ex1',
            title: 'Redis Caching Example',
            code:
                '@Service\npublic class UserService {\n    @Autowired\n    private RedisTemplate<String, Object> redisTemplate;\n    \n    public User getUser(Long id) {\n        String key = "user:" + id;\n        User user = (User) redisTemplate.opsForValue().get(key);\n        \n        if(user == null) {\n            user = userRepository.findById(id);\n            redisTemplate.opsForValue().set(key, user, 3600); // 1 hour\n        }\n        return user;\n    }\n}',
            output: 'Fast data retrieval from cache',
            explanation:
                'Redis provides in-memory data storage for fast access to frequently used data.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Caching',
            definition: 'storing data in fast memory',
          ),
          GlossaryTerm(term: 'Redis', definition: 'in-memory data store'),
        ],
      ),

      // Lesson 14: Testing with JUnit
      Lesson(
        id: 'master_14',
        title: 'Testing with JUnit',
        description: 'Write comprehensive unit tests',
        content:
            'Write test cases before/after code.\n\nReal-life: Ensuring code quality and preventing bugs.\n\nUse case: All production applications.',
        level: LearningLevel.master,
        order: 14,
        estimatedMinutes: 16,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_14_ex1',
            title: 'JUnit Test Example',
            code:
                '@Test\nvoid testAdd() {\n    Calculator calc = new Calculator();\n    assertEquals(5, calc.add(2, 3));\n}\n\n@Test\nvoid testDivide() {\n    Calculator calc = new Calculator();\n    assertThrows(ArithmeticException.class, () -> calc.divide(10, 0));\n}\n\n@BeforeEach\nvoid setUp() {\n    System.out.println("Setting up test");\n}',
            output: 'Test passed or failed with details',
            explanation:
                'JUnit provides framework for writing and running unit tests.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'JUnit',
            definition: 'Java unit testing framework',
          ),
          GlossaryTerm(
            term: 'Unit Test',
            definition: 'test individual components',
          ),
        ],
      ),

      // Lesson 15: CI/CD Integration
      Lesson(
        id: 'master_15',
        title: 'CI/CD Integration',
        description: 'Implement continuous integration and deployment',
        content:
            'Auto-build & deploy using Jenkins/GitHub Actions.\n\nReal-life: Automated testing and deployment pipeline.\n\nUse case: Professional software development.',
        level: LearningLevel.master,
        order: 15,
        estimatedMinutes: 18,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_15_ex1',
            title: 'GitHub Actions Workflow',
            code:
                'name: Java CI/CD\n\non:\n  push:\n    branches: [ main ]\n\njobs:\n  build:\n    runs-on: ubuntu-latest\n    steps:\n    - uses: actions/checkout@v2\n    - name: Set up JDK 11\n      uses: actions/setup-java@v2\n      with:\n        java-version: \'11\'\n    - name: Run tests\n      run: mvn test\n    - name: Build application\n      run: mvn package',
            output: 'Automated build and test pipeline',
            explanation:
                'CI/CD automates the process of building, testing, and deploying applications.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'CI/CD',
            definition: 'Continuous Integration/Continuous Deployment',
          ),
        ],
      ),

      // Lesson 16: Cloud Deployment
      Lesson(
        id: 'master_16',
        title: 'Cloud Deployment',
        description: 'Deploy Java applications to cloud platforms',
        content:
            'Deploy Java apps on AWS, GCP, Azure.\n\nReal-life: Scalable, reliable application hosting.\n\nUse case: Production applications, global reach.',
        level: LearningLevel.master,
        order: 16,
        estimatedMinutes: 19,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_16_ex1',
            title: 'Docker Deployment',
            code:
                '# Dockerfile\nFROM openjdk:11-jre-slim\nCOPY target/app.jar app.jar\nEXPOSE 8080\nENTRYPOINT ["java", "-jar", "app.jar"]\n\n# docker-compose.yml\nversion: \'3\'\nservices:\n  app:\n    build: .\n    ports:\n      - "8080:8080"\n    environment:\n      - SPRING_PROFILES_ACTIVE=prod',
            output: 'Containerized Java application',
            explanation:
                'Docker containers package applications with all dependencies for consistent deployment.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Cloud Deployment',
            definition: 'hosting applications on cloud platforms',
          ),
          GlossaryTerm(term: 'Docker', definition: 'containerization platform'),
        ],
      ),

      // Lesson 17: Spring Boot Project Setup
      Lesson(
        id: 'master_17',
        title: 'Spring Boot Project Setup',
        description: 'Set up enterprise-grade Spring Boot applications',
        content:
            'Most used framework for real-world apps.\n\nReal-life: Industry standard for Java web development.\n\nUse case: Enterprise applications, microservices.',
        level: LearningLevel.master,
        order: 17,
        estimatedMinutes: 20,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_17_ex1',
            title: 'Spring Boot Application',
            code:
                '@SpringBootApplication\npublic class MyApplication {\n    public static void main(String[] args) {\n        SpringApplication.run(MyApplication.class, args);\n    }\n}\n\n@RestController\npublic class HelloController {\n    @GetMapping("/hello")\n    public String hello() {\n        return "Hello from Spring Boot!";\n    }\n}',
            output: 'Spring Boot application running on port 8080',
            explanation:
                'Spring Boot provides auto-configuration and embedded servers for rapid development.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Spring Boot',
            definition: 'Java framework for web applications',
          ),
        ],
      ),

      // Lesson 18: Hibernate ORM
      Lesson(
        id: 'master_18',
        title: 'Hibernate ORM',
        description: 'Map Java objects to database tables',
        content:
            'Maps Java objects to database tables.\n\nReal-life: Student object → students table.\n\nUse case: Object-relational mapping, database abstraction.',
        level: LearningLevel.master,
        order: 18,
        estimatedMinutes: 19,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_18_ex1',
            title: 'Hibernate Entity Example',
            code:
                '@Entity\n@Table(name = "students")\npublic class Student {\n    @Id\n    @GeneratedValue(strategy = GenerationType.IDENTITY)\n    private Long id;\n    \n    @Column(name = "name")\n    private String name;\n    \n    @Column(name = "email")\n    private String email;\n    \n    // Getters and setters\n}\n\n@Repository\npublic interface StudentRepository extends JpaRepository<Student, Long> {\n    List<Student> findByName(String name);\n}',
            output: 'Database operations through Java objects',
            explanation:
                'Hibernate provides object-relational mapping, making database operations object-oriented.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Hibernate',
            definition: 'Object-Relational Mapping framework',
          ),
          GlossaryTerm(term: 'ORM', definition: 'Object-Relational Mapping'),
        ],
      ),

      // Lesson 19: Performance Tuning
      Lesson(
        id: 'master_19',
        title: 'Performance Tuning',
        description: 'Optimize Java applications for better performance',
        content:
            'Use profiling tools, optimize memory & SQL queries.\n\nReal-life: Making applications faster and more efficient.\n\nUse case: High-performance applications, cost optimization.',
        level: LearningLevel.master,
        order: 19,
        estimatedMinutes: 21,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_19_ex1',
            title: 'Performance Optimization',
            code:
                '// JVM tuning\n-Xms2g -Xmx4g -XX:+UseG1GC\n\n// Database query optimization\n@Query("SELECT u FROM User u WHERE u.active = true")\nList<User> findActiveUsers();\n\n// Caching frequently accessed data\n@Cacheable("users")\npublic User findUserById(Long id) {\n    return userRepository.findById(id);\n}\n\n// Connection pooling\n@Configuration\npublic class DatabaseConfig {\n    @Bean\n    public DataSource dataSource() {\n        HikariConfig config = new HikariConfig();\n        config.setMaximumPoolSize(20);\n        return new HikariDataSource(config);\n    }\n}',
            output: 'Optimized application performance',
            explanation:
                'Performance tuning involves optimizing JVM settings, database queries, and caching strategies.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Performance Tuning',
            definition: 'optimizing application performance',
          ),
          GlossaryTerm(
            term: 'Profiling',
            definition: 'analyzing application performance',
          ),
        ],
      ),

      // Lesson 20: System Design with Java
      Lesson(
        id: 'master_20',
        title: 'System Design with Java',
        description: 'Design scalable, distributed systems',
        content:
            'Design scalable applications.\n\nExample: Build a social media backend.\n\nUse case: Large-scale applications, system architecture.',
        level: LearningLevel.master,
        order: 20,
        estimatedMinutes: 25,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_20_ex1',
            title: 'System Architecture Example',
            code:
                '// Load Balancer\n@Component\npublic class LoadBalancer {\n    private List<String> servers = Arrays.asList("server1", "server2", "server3");\n    private AtomicInteger current = new AtomicInteger(0);\n    \n    public String getServer() {\n        int index = current.getAndIncrement() % servers.size();\n        return servers.get(index);\n    }\n}\n\n// Circuit Breaker Pattern\n@Component\npublic class CircuitBreaker {\n    private int failureCount = 0;\n    private long lastFailureTime = 0;\n    \n    public boolean isOpen() {\n        return failureCount > 5 && \n               (System.currentTimeMillis() - lastFailureTime) < 60000;\n    }\n}',
            output: 'Scalable system architecture',
            explanation:
                'System design involves creating scalable, fault-tolerant, and efficient distributed systems.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'System Design',
            definition: 'designing large-scale systems',
          ),
          GlossaryTerm(
            term: 'Load Balancer',
            definition: 'distributes traffic across servers',
          ),
        ],
      ),
    ];
  }
}
