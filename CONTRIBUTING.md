# Contributing to LearnJavaX

Thank you for your interest in contributing to LearnJavaX! This document provides guidelines and information for contributors.

## 🤝 How to Contribute

### **Ways to Contribute**
- 🐛 **Bug Reports** - Report issues and bugs
- 💡 **Feature Requests** - Suggest new features
- 📝 **Documentation** - Improve documentation
- 🧪 **Testing** - Test the app and report issues
- 💻 **Code Contributions** - Submit code improvements

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Git
- Android Studio / VS Code

### **Setup Development Environment**

1. **Fork the repository**
   ```bash
   # Click the "Fork" button on GitHub
   ```

2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/learnjavax.git
   cd learnjavax
   ```

3. **Add upstream remote**
   ```bash
   git remote add upstream https://github.com/JithinGK51/learnjavax.git
   ```

4. **Install dependencies**
   ```bash
   flutter pub get
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 📝 Development Guidelines

### **Code Style**
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions small and focused

### **Commit Messages**
Use conventional commit format:
```
type(scope): description

Examples:
feat(ui): add dark theme support
fix(ads): resolve banner ad loading issue
docs(readme): update installation instructions
test(lesson): add unit tests for lesson controller
```

### **Pull Request Process**

1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Write clean, readable code
   - Add tests if applicable
   - Update documentation

3. **Test your changes**
   ```bash
   flutter test
   flutter analyze
   ```

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   ```

5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request**
   - Use the PR template
   - Provide clear description
   - Link related issues

## 🐛 Bug Reports

### **Before Submitting**
- Check if the issue already exists
- Test with the latest version
- Try to reproduce the issue

### **Bug Report Template**
```markdown
**Bug Description**
A clear description of the bug.

**Steps to Reproduce**
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected Behavior**
What you expected to happen.

**Actual Behavior**
What actually happened.

**Screenshots**
If applicable, add screenshots.

**Environment**
- OS: [e.g., Android 12]
- Device: [e.g., Samsung Galaxy S21]
- App Version: [e.g., 1.0.0]
- Flutter Version: [e.g., 3.16.0]

**Additional Context**
Any other context about the problem.
```

## 💡 Feature Requests

### **Feature Request Template**
```markdown
**Feature Description**
A clear description of the feature.

**Problem Statement**
What problem does this feature solve?

**Proposed Solution**
How should this feature work?

**Alternatives Considered**
Other solutions you've considered.

**Additional Context**
Any other context about the feature.
```

## 🧪 Testing

### **Running Tests**
```bash
# Unit tests
flutter test

# Integration tests
flutter test integration_test/

# Widget tests
flutter test test/widget_test.dart
```

### **Test Coverage**
- Aim for high test coverage
- Test edge cases
- Test error conditions
- Test user interactions

## 📚 Documentation

### **Code Documentation**
- Document public APIs
- Add inline comments for complex logic
- Update README for new features
- Keep CHANGELOG updated

### **Documentation Standards**
- Use clear, concise language
- Provide examples where helpful
- Keep documentation up-to-date
- Follow markdown best practices

## 🏗️ Architecture Guidelines

### **Project Structure**
```
lib/
├── constants/          # App constants
├── controllers/        # GetX controllers
├── data/              # Static data
├── models/            # Data models
├── services/          # Core services
├── utils/             # Utility functions
├── views/             # UI screens
├── widgets/           # Reusable widgets
└── main.dart          # App entry point
```

### **Naming Conventions**
- **Files**: snake_case (e.g., `lesson_controller.dart`)
- **Classes**: PascalCase (e.g., `LessonController`)
- **Variables**: camelCase (e.g., `lessonTitle`)
- **Constants**: UPPER_SNAKE_CASE (e.g., `APP_NAME`)

## 🔒 Security

### **Security Guidelines**
- Never commit sensitive data (API keys, passwords)
- Use environment variables for configuration
- Validate user inputs
- Follow secure coding practices

### **Reporting Security Issues**
- Email: security@learnjavax.com
- Do not create public issues for security vulnerabilities
- Provide detailed information about the vulnerability

## 📋 Code Review Process

### **Review Checklist**
- [ ] Code follows style guidelines
- [ ] Tests are included and passing
- [ ] Documentation is updated
- [ ] No sensitive data is exposed
- [ ] Performance considerations are addressed
- [ ] Error handling is appropriate

### **Review Guidelines**
- Be constructive and respectful
- Focus on the code, not the person
- Provide specific feedback
- Suggest improvements
- Approve when ready

## 🎯 Issue Labels

### **Bug Labels**
- `bug` - Something isn't working
- `critical` - Critical bug affecting core functionality
- `minor` - Minor bug with workaround

### **Enhancement Labels**
- `enhancement` - New feature or request
- `ui/ux` - User interface improvements
- `performance` - Performance improvements
- `documentation` - Documentation improvements

### **Status Labels**
- `help wanted` - Extra attention is needed
- `good first issue` - Good for newcomers
- `duplicate` - Issue already exists
- `invalid` - Issue is not valid
- `wontfix` - Issue will not be fixed

## 📞 Contact

### **Development Team**
- **Project Lead**: Jithin GK
- **Email**: crafziogroup@gmail.com
- **GitHub**: [@JithinGK51](https://github.com/JithinGK51)

### **Community**
- **Discord**: [Join our Discord](https://discord.gg/learnjavax)
- **Twitter**: [@LearnJavaX](https://twitter.com/learnjavax)
- **Website**: [https://sites.google.com/view/learnjavax/home](https://sites.google.com/view/learnjavax/home)

## 📄 License

By contributing to LearnJavaX, you agree that your contributions will be licensed under the MIT License.

## 🙏 Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project documentation
- Social media acknowledgments

---

Thank you for contributing to LearnJavaX! 🎉
