# LearnJavaX 📚

<div align="center">
  <img src="assets/icons/icon.png" alt="LearnJavaX Logo" width="120" height="120">
  
  **Your Complete Java Programming Learning Companion**
  
  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
  [![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://developer.android.com/)
  [![Google Play](https://img.shields.io/badge/Google_Play-414141?style=for-the-badge&logo=google-play&logoColor=white)](https://play.google.com/store/apps/details?id=com.crafzio.learnjavax.learnjavax)
  [![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)
</div>

## 🚀 Overview

LearnJavaX is a comprehensive Flutter-based mobile application designed to teach Java programming from beginner to advanced levels. The app provides an interactive learning experience with structured lessons, mock tests, and progress tracking.

## 📱 **Now Available on Google Play Store!**

<div align="center">
  <a href="https://play.google.com/store/apps/details?id=com.crafzio.learnjavax.learnjavax">
    <img src="https://img.shields.io/badge/Google_Play-414141?style=for-the-badge&logo=google-play&logoColor=white" alt="Get it on Google Play">
  </a>
</div>

**Download LearnJavaX today and start your Java programming journey!**

## ✨ Features

### 📚 **Learning Content**
- **100+ Interactive Lessons** - Comprehensive Java programming curriculum
- **50+ Mock Tests** - Practice assessments for skill evaluation
- **6 Progressive Levels** - From beginner to advanced programming concepts
- **Code Examples** - Syntax-highlighted code snippets with explanations

### 🎯 **User Experience**
- **Offline Learning** - Learn anywhere, anytime without internet
- **Progress Tracking** - Monitor learning streaks and achievements
- **Dark/Light Theme** - Comfortable learning in any environment
- **Text-to-Speech** - Audio learning support for accessibility
- **Modern UI/UX** - Clean, intuitive interface with smooth animations

### 🔒 **Privacy & Security**
- **Local Data Storage** - All progress stored on device
- **No Personal Data Collection** - Privacy-first approach
- **Child-Safe Content** - Educational content suitable for all ages
- **Ad-Supported Model** - Free access with optional ad-free version

## 🏗️ Architecture

### **Tech Stack**
- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: GetX
- **Local Storage**: Hive
- **Ads**: Google Mobile Ads (AdMob)
- **TTS**: Flutter TTS
- **Connectivity**: Connectivity Plus

### **Project Structure**
```
lib/
├── constants/          # App colors, strings, and themes
├── controllers/        # GetX controllers for state management
├── data/              # Lesson data and mock tests
├── models/            # Data models and structures
├── services/          # Core services (TTS, Ads, Storage)
├── utils/             # Utility functions and helpers
├── views/             # UI screens and pages
├── widgets/           # Reusable UI components
└── main.dart          # Application entry point
```

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code
- Android SDK (API 21 or higher)

### **Installation**

1. **Clone the repository**
   ```bash
   git clone https://github.com/JithinGK51/learnjavax.git
   cd learnjavax
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### **Build for Release**

1. **Generate keystore** (first time only)
   ```bash
   keytool -genkey -v -keystore android/app/app-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
   ```

2. **Update key.properties**
   ```properties
   storePassword=your_store_password
   keyPassword=your_key_password
   keyAlias=key
   storeFile=app-release-key.jks
   ```

3. **Build release AAB**
   ```bash
   flutter build appbundle --release
   ```

## 📱 Screenshots

<div align="center">
  <img src="assets/screenshorts/icon1.png" alt="App Icon" width="200">
  <img src="assets/screenshorts/icon (1).png" alt="App Icon 2" width="200">
</div>

## 🎯 Learning Path

### **Level 1: Java Fundamentals**
- Variables and Data Types
- Operators and Expressions
- Control Structures (if-else, loops)
- Methods and Functions

### **Level 2: Object-Oriented Programming**
- Classes and Objects
- Inheritance and Polymorphism
- Encapsulation and Abstraction
- Interfaces and Abstract Classes

### **Level 3: Advanced Concepts**
- Exception Handling
- File I/O Operations
- Collections Framework
- Generics and Lambda Expressions

### **Level 4: Java APIs**
- String Manipulation
- Date and Time APIs
- Regular Expressions
- Networking Basics

### **Level 5: Advanced Topics**
- Multithreading
- Java 8+ Features
- Design Patterns
- Best Practices

### **Level 6: Project Development**
- Real-world Projects
- Code Review
- Testing Strategies
- Deployment

## 🧪 Testing

### **Run Tests**
```bash
# Unit tests
flutter test

# Integration tests
flutter test integration_test/

# Widget tests
flutter test test/
```

## 📦 Dependencies

### **Core Dependencies**
- `get: ^4.6.6` - State management and routing
- `hive: ^2.2.3` - Local database
- `hive_flutter: ^1.1.0` - Hive Flutter integration

### **UI/UX**
- `google_fonts: ^6.1.0` - Custom fonts
- `lottie: ^2.7.0` - Animations
- `animated_text_kit: ^4.2.2` - Text animations

### **Services**
- `google_mobile_ads: ^5.3.1` - Advertisement integration
- `flutter_tts: ^3.8.5` - Text-to-speech
- `connectivity_plus: ^6.1.5` - Network connectivity
- `flutter_local_notifications: ^17.2.4` - Local notifications

### **Utilities**
- `url_launcher: ^6.3.0` - External URL handling
- `share_plus: ^7.2.2` - Content sharing
- `package_info_plus: ^8.3.1` - App information

## 🤝 Contributing

We welcome contributions to LearnJavaX! Please follow these guidelines:

### **Development Workflow**
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### **Code Standards**
- Follow Dart/Flutter style guidelines
- Write meaningful commit messages
- Add tests for new features
- Update documentation as needed

### **Issue Reporting**
- Use the issue template
- Provide detailed reproduction steps
- Include device/OS information
- Add relevant screenshots

## 👥 Development Team

<div align="center">

| Developer | Role | LinkedIn |
|-----------|------|----------|
| **Chethan S** | Lead Developer | [LinkedIn](https://www.linkedin.com/in/chethan-s-623073250) |
| **Darshan AB** | UI/UX Developer | [LinkedIn](https://www.linkedin.com/in/darshan-ab-aa2631331) |
| **Jithin GK** | Project Lead | [LinkedIn](https://www.linkedin.com/in/jithin-gk-19671b2a7) |
| **Venkataramana T** | Backend Developer | [LinkedIn](https://www.linkedin.com/in/venkataramana-t-b3081a368) |

</div>

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- **📱 Google Play Store**: [Download LearnJavaX](https://play.google.com/store/apps/details?id=com.crafzio.learnjavax.learnjavax)
- **🌐 Website**: [https://sites.google.com/view/learnjavax/home](https://sites.google.com/view/learnjavax/home)
- **🔒 Privacy Policy**: [Privacy Policy](https://sites.google.com/view/learnjavax/home)
- **📋 Terms & Conditions**: [Terms & Conditions](https://sites.google.com/view/learnjavax/home)
- **📧 Support**: crafziogroup@gmail.com

## 📊 Project Statistics

<div align="center">

| Metric | Value |
|--------|-------|
| **Lessons** | 100+ |
| **Mock Tests** | 50+ |
| **Learning Levels** | 6 |
| **Code Lines** | 10,000+ |
| **Languages** | Dart, Java |
| **Platforms** | Android |

</div>

## 🎯 Roadmap

### **Version 1.1.0** (Planned)
- [ ] iOS support
- [ ] Web version
- [ ] Advanced analytics
- [ ] Social features

### **Version 1.2.0** (Future)
- [ ] AI-powered learning
- [ ] Video tutorials
- [ ] Community features
- [ ] Certification system

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Google for AdMob integration
- Open source community for various packages
- All contributors and testers

---

<div align="center">
  <p>Made with ❤️ by <strong>CRAFZIO Team</strong></p>
  <p>© 2025 LearnJavaX. All rights reserved.</p>
</div>