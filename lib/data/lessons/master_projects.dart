import '../../models/simple_models.dart';

class MasterProjects {
  static List<Lesson> getProjects() {
    return [
      // Project 1: Online Banking System
      Lesson(
        id: 'master_project_1',
        title: 'Online Banking System',
        description:
            'Complete banking application with security and transactions',
        content:
            'Features:\n• User login and authentication\n• Balance check and account management\n• Money transfer between accounts\n• Custom exception for low balance\n• JDBC with database transactions\n• Password hashing for security\n\nLearning: Security + Transactions + Database Design',
        level: LearningLevel.master,
        order: 21,
        estimatedMinutes: 120,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_project_1_ex1',
            title: 'Banking System Architecture',
            code:
                '// Main Banking System Structure\nclass BankingSystem {\n    private UserService userService;\n    private AccountService accountService;\n    private TransactionService transactionService;\n    \n    public void transferMoney(String fromAccount, String toAccount, double amount) {\n        try {\n            accountService.withdraw(fromAccount, amount);\n            accountService.deposit(toAccount, amount);\n            transactionService.recordTransaction(fromAccount, toAccount, amount);\n        } catch (InsufficientFundsException e) {\n            System.out.println("Transfer failed: " + e.getMessage());\n        }\n    }\n}',
            output: 'Complete banking system with error handling',
            explanation:
                'This project demonstrates enterprise-level Java development with proper error handling and transaction management.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Banking System',
            definition: 'financial application with security',
          ),
        ],
      ),

      // Project 2: Real-Time Chat App
      Lesson(
        id: 'master_project_2',
        title: 'Real-Time Chat Application',
        description:
            'Multi-user chat application with rooms and real-time messaging',
        content:
            'Features:\n• Socket programming for real-time communication\n• Multi-threaded server handling multiple clients\n• Chat rooms and private messaging\n• User authentication and session management\n• Message broadcasting and private messages\n\nLearning: Networking + Threads + Real-time Communication',
        level: LearningLevel.master,
        order: 22,
        estimatedMinutes: 150,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_project_2_ex1',
            title: 'Chat Server Implementation',
            code:
                'public class ChatServer {\n    private ServerSocket serverSocket;\n    private List<ClientHandler> clients = new ArrayList<>();\n    \n    public void start(int port) throws IOException {\n        serverSocket = new ServerSocket(port);\n        System.out.println("Chat server started on port " + port);\n        \n        while (true) {\n            Socket clientSocket = serverSocket.accept();\n            ClientHandler clientHandler = new ClientHandler(clientSocket, this);\n            clients.add(clientHandler);\n            new Thread(clientHandler).start();\n        }\n    }\n    \n    public void broadcastMessage(String message, ClientHandler sender) {\n        for (ClientHandler client : clients) {\n            if (client != sender) {\n                client.sendMessage(message);\n            }\n        }\n    }\n}',
            output: 'Multi-threaded chat server running',
            explanation:
                'This project demonstrates advanced networking concepts and concurrent programming.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Chat Application',
            definition: 'real-time messaging system',
          ),
        ],
      ),

      // Project 3: E-Commerce Backend (Spring Boot)
      Lesson(
        id: 'master_project_3',
        title: 'E-Commerce Backend System',
        description:
            'Complete e-commerce backend with Spring Boot and REST APIs',
        content:
            'Features:\n• User registration and authentication\n• Product catalog and search\n• Shopping cart and order management\n• REST APIs for frontend integration\n• Hibernate ORM with MySQL database\n• Payment integration (simulated)\n\nLearning: REST + Database + Spring + Microservices',
        level: LearningLevel.master,
        order: 23,
        estimatedMinutes: 180,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_project_3_ex1',
            title: 'E-Commerce REST API',
            code:
                '@RestController\n@RequestMapping("/api/products")\npublic class ProductController {\n    \n    @Autowired\n    private ProductService productService;\n    \n    @GetMapping\n    public ResponseEntity<List<Product>> getAllProducts() {\n        return ResponseEntity.ok(productService.findAll());\n    }\n    \n    @PostMapping\n    public ResponseEntity<Product> createProduct(@RequestBody Product product) {\n        return ResponseEntity.ok(productService.save(product));\n    }\n    \n    @GetMapping("/search")\n    public ResponseEntity<List<Product>> searchProducts(@RequestParam String query) {\n        return ResponseEntity.ok(productService.search(query));\n    }\n}\n\n@RestController\n@RequestMapping("/api/orders")\npublic class OrderController {\n    \n    @PostMapping\n    public ResponseEntity<Order> createOrder(@RequestBody OrderRequest request) {\n        Order order = orderService.createOrder(request);\n        return ResponseEntity.ok(order);\n    }\n}',
            output: 'Complete REST API for e-commerce',
            explanation:
                'This project demonstrates modern Spring Boot development with REST APIs and database integration.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'E-Commerce',
            definition: 'online shopping platform',
          ),
        ],
      ),

      // Project 4: Student Management with Reports
      Lesson(
        id: 'master_project_4',
        title: 'Student Management System with Reports',
        description:
            'Complete student management system with GUI and reporting',
        content:
            'Features:\n• CRUD operations for students, courses, and grades\n• File export functionality (CSV/PDF)\n• GUI with JavaFX for desktop application\n• Report generation and data visualization\n• Database integration with Hibernate\n• Search and filtering capabilities\n\nLearning: UI + File Handling + Database + Reports',
        level: LearningLevel.master,
        order: 24,
        estimatedMinutes: 200,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_project_4_ex1',
            title: 'Student Management GUI',
            code:
                'public class StudentManagementApp extends Application {\n    \n    @Override\n    public void start(Stage primaryStage) {\n        VBox root = new VBox(10);\n        \n        // Student table\n        TableView<Student> studentTable = new TableView<>();\n        TableColumn<Student, String> nameColumn = new TableColumn<>("Name");\n        TableColumn<Student, String> emailColumn = new TableColumn<>("Email");\n        \n        studentTable.getColumns().addAll(nameColumn, emailColumn);\n        \n        // Buttons\n        Button addButton = new Button("Add Student");\n        Button exportButton = new Button("Export to CSV");\n        \n        addButton.setOnAction(e -> showAddStudentDialog());\n        exportButton.setOnAction(e -> exportToCSV());\n        \n        root.getChildren().addAll(studentTable, addButton, exportButton);\n        \n        Scene scene = new Scene(root, 600, 400);\n        primaryStage.setScene(scene);\n        primaryStage.setTitle("Student Management System");\n        primaryStage.show();\n    }\n}',
            output: 'Desktop application with GUI',
            explanation:
                'This project demonstrates desktop application development with JavaFX and file handling.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Student Management',
            definition: 'educational administration system',
          ),
        ],
      ),

      // Project 5: Microservices System (Master Project)
      Lesson(
        id: 'master_project_5',
        title: 'Microservices Architecture System',
        description:
            'Complete microservices system with multiple services and communication',
        content:
            'Features:\n• Authentication Service (JWT tokens)\n• Order Service (order management)\n• Payment Service (payment processing)\n• Notification Service (email/SMS)\n• API Gateway for routing\n• Service discovery and load balancing\n• Inter-service communication with REST\n• Database per service pattern\n• Docker containerization\n\nLearning: Enterprise Architecture + Microservices + Cloud + DevOps',
        level: LearningLevel.master,
        order: 25,
        estimatedMinutes: 300,
        isCompleted: false,
        codeExamples: [
          CodeExample(
            id: 'master_project_5_ex1',
            title: 'Microservices Architecture',
            code:
                '// Authentication Service\n@RestController\n@RequestMapping("/auth")\npublic class AuthController {\n    \n    @PostMapping("/login")\n    public ResponseEntity<AuthResponse> login(@RequestBody LoginRequest request) {\n        String token = authService.authenticate(request);\n        return ResponseEntity.ok(new AuthResponse(token));\n    }\n}\n\n// Order Service\n@RestController\n@RequestMapping("/orders")\npublic class OrderController {\n    \n    @Autowired\n    private PaymentServiceClient paymentServiceClient;\n    \n    @PostMapping\n    public ResponseEntity<Order> createOrder(@RequestBody OrderRequest request) {\n        // Validate payment\n        PaymentResponse payment = paymentServiceClient.processPayment(request.getPayment());\n        \n        if (payment.isSuccess()) {\n            Order order = orderService.createOrder(request);\n            return ResponseEntity.ok(order);\n        }\n        return ResponseEntity.badRequest().build();\n    }\n}\n\n// API Gateway Configuration\n@Configuration\npublic class GatewayConfig {\n    \n    @Bean\n    public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {\n        return builder.routes()\n            .route("auth-service", r -> r.path("/auth/**")\n                .uri("http://auth-service:8081"))\n            .route("order-service", r -> r.path("/orders/**")\n                .uri("http://order-service:8082"))\n            .build();\n    }\n}',
            output: 'Complete microservices ecosystem',
            explanation:
                'This master project demonstrates enterprise-level microservices architecture with all modern practices.',
          ),
        ],
        glossaryTerms: [
          GlossaryTerm(
            term: 'Microservices',
            definition: 'distributed system architecture',
          ),
          GlossaryTerm(
            term: 'API Gateway',
            definition: 'entry point for microservices',
          ),
        ],
      ),
    ];
  }
}
