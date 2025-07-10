# Simple Gemini CLI Prompts for Web Development

Quick, focused prompts for common development tasks. Copy and modify as needed.

## 🔍 Code Review Templates

### Quick Code Review
```
Review this code for potential issues:
[paste code or git diff]

Focus on:
- Security vulnerabilities
- Performance problems
- Code clarity
- Best practices

Keep response concise with specific fixes.
```

### Pre-Commit Review
```
git diff --staged

Review my staged changes above for:
1. Security issues
2. Logic errors
3. Performance concerns
4. Missing edge cases

Provide specific line-by-line feedback only for issues found.
```

### Security-Focused Review
```
Security audit for this code:
[paste code]

Check for:
- SQL injection risks
- XSS vulnerabilities
- Authentication bypasses
- Input validation issues
- Sensitive data exposure

Provide severity ratings and specific fixes.
```

## 🐛 Bug Diagnosis

### Error Analysis
```
I'm getting this error:
[paste error message and stack trace]

Context:
- What I was trying to do: [brief description]
- Recent changes: [what changed]
- Environment: [relevant versions]

Please diagnose the likely cause and suggest a fix.
```

### Debugging Helper
```
This function isn't working as expected:
[paste function code]

Expected behavior: [what should happen]
Actual behavior: [what's happening]
Test case: [example input/output]

Help me identify the bug and fix it.
```

## 🏗️ Architecture Decisions

### Technology Choice
```
I need to choose between [Option A] and [Option B] for [use case].

Requirements:
- [requirement 1]
- [requirement 2]
- [requirement 3]

Current stack: [your tech stack]

Recommend the best option with reasoning.
```

### Design Pattern Selection
```
I need to implement [feature/functionality].

Current approach:
[describe or paste current code]

Constraints:
- [constraint 1]
- [constraint 2]

Suggest the most appropriate design pattern and show implementation.
```

### API Design Review
```
Review this API endpoint design:

Endpoint: [HTTP method] /path/to/endpoint
Purpose: [what it does]
Request body: [example JSON]
Response: [example JSON]

Evaluate for:
- RESTful conventions
- Security considerations
- Performance implications
- Error handling

Suggest improvements.
```

## 🚀 Performance Optimization

### Performance Analysis
```
This code seems slow:
[paste code]

Context:
- Data size: [typical input size]
- Frequency: [how often it runs]
- Current performance: [metrics if available]

Identify bottlenecks and suggest optimizations.
```

### Database Query Optimization
```
Optimize this database query:
[paste SQL or ORM query]

Table sizes:
- [table1]: [row count]
- [table2]: [row count]

Indexes: [list existing indexes]

Suggest query improvements and any needed indexes.
```

## 🔒 Security Checks

### Authentication Review
```
Review this authentication implementation:
[paste auth code]

Requirements:
- [auth requirements]
- User types: [different user roles]

Check for security best practices and vulnerabilities.
```

### API Security Audit
```
Security review for this API endpoint:
[paste endpoint code]

This endpoint:
- Handles: [type of data]
- Authentication: [auth method]
- Authorization: [who can access]

Identify security risks and required improvements.
```

## 📝 Quick Implementation Help

### Function Implementation
```
Implement a function that:
- Input: [describe input]
- Output: [describe output]
- Requirements: [specific requirements]
- Example: [input] -> [output]

Language: [Python/JavaScript/etc]
Style: [functional/OOP/etc]
```

### Error Handling Pattern
```
Add proper error handling to this code:
[paste code]

Requirements:
- Handle [specific error types]
- Log appropriately
- User-friendly error messages
- Maintain security (don't leak sensitive info)
```

### Test Generation
```
Generate tests for this function:
[paste function code]

Testing framework: [pytest/jest/etc]
Coverage needed:
- Happy path
- Edge cases
- Error conditions

Include both unit tests and integration tests if applicable.
```

## 🎯 Specific Technology Queries

### Framework-Specific Question
```
In [Framework/Library] version [X], how do I [specific task]?

Current code:
[relevant code if any]

Constraints:
- [any limitations]
- [compatibility requirements]

Show me the modern, idiomatic way to do this.
```

### Integration Question
```
How do I integrate [Service A] with [Service B]?

My setup:
- [Service A details]
- [Service B details]
- Authentication method: [how they auth]

Need to: [what you're trying to accomplish]

Provide step-by-step integration code.
```

## 💡 Best Practices Check

### Code Quality Review
```
Review this code for best practices:
[paste code]

Framework: [what you're using]
Purpose: [what the code does]

Check for:
- Code organization
- Naming conventions
- DRY principles
- SOLID principles
- Framework-specific best practices
```

### Refactoring Suggestions
```
Suggest refactoring for this code:
[paste code]

Goals:
- Improve readability
- Reduce complexity
- Better testability
- Follow [specific pattern/principle]

Maintain existing functionality while improving structure.
```

## 🔧 Configuration Help

### Environment Setup
```
Help me configure [tool/service] for [purpose].

Current setup:
- OS: [your OS]
- Version: [tool version]
- Dependencies: [related tools/versions]

Requirements:
- [what you need it to do]
- [any constraints]

Provide configuration with explanations.
```

### CI/CD Pipeline
```
Review my CI/CD configuration:
[paste config file]

Pipeline should:
- [step 1]
- [step 2]
- [step 3]

Identify issues and suggest improvements.
```

---

## Usage Tips

1. **Be Specific**: Include relevant context, versions, and constraints
2. **Show Examples**: Provide sample inputs/outputs when possible
3. **State Preferences**: Mention your coding style or framework preferences
4. **Ask for Reasoning**: Request explanations for better understanding
5. **Iterate**: Use follow-up questions to refine solutions

## Combining with Git

```bash
# Review changes since last commit
git diff | gemini -p "Review these changes for issues:"

# Review specific file
cat myfile.py | gemini -p "Suggest improvements for this code:"

# Check branch differences
git diff main..feature-branch | gemini -p "Security review of these changes:"
```

## Quick Shell Aliases

Add to your `.bashrc` or `.zshrc`:

```bash
# Quick code review
alias gemini-review='gemini -p "Review this code for issues:"'

# Security check
alias gemini-security='gemini -p "Security audit this code:"'

# Performance check
alias gemini-perf='gemini -p "Analyze performance of this code:"'

# Bug help
alias gemini-debug='gemini -p "Help debug this error:"'
```