# MCP Command Design Specification

## Command Syntax Reference

### MCP Tool Calls
Based on Gemini MCP documentation, the proper syntax is:

```bash
# Analysis with file selection
!/gemini-cli:analyze @filename "prompt text here"

# Analysis with multiple files  
!/gemini-cli:analyze @src/*.js "analyze these JavaScript files"

# Sandbox for code generation
!/gemini-cli:sandbox "create a Python function for..."

# General analysis without files
!/gemini-cli:analyze "general question"
```

## Enhanced Command Designs

### 1. Planning & Architecture Commands

#### `/gemini-plan` - Enhanced Project Planning
```yaml
---
description: Plan features and architecture with project context
---

Plan this feature or project using Gemini with full project context.

What do you want to plan or build?

!/gemini-cli:analyze @package.json @*/README.md @src/* "Help plan this feature/project: {input}. Consider: 1) Existing architecture 2) Best technologies for this stack 3) Implementation steps 4) Potential issues 5) Integration points. Be comprehensive but concise."
```

#### `/gemini-approach` - Context-Aware Best Practices
```yaml
---
description: Get best practice advice with project context
---

Get best practice advice from Gemini with project context.

What approach question do you have?

!/gemini-cli:analyze @package.json @{selectedText} "Question: {input}. Consider project context and recommend: 1) Best practices for this tech stack 2) Pros/cons of different approaches 3) Implementation strategy 4) Common pitfalls to avoid."
```

### 2. Code Analysis Commands

#### `/gemini-review` - Enhanced Code Review
```yaml
---
description: Comprehensive code review with project context
---

Review selected code with Gemini using full project context.

!/gemini-cli:analyze @{currentFile} @package.json "Review this code comprehensively. Focus on: 1) Security vulnerabilities 2) Performance issues 3) Best practices for this tech stack 4) Maintainability concerns 5) Integration issues. Flag HIGH and CRITICAL issues."
```

#### `/gemini-explain` - Context-Aware Code Explanation
```yaml
---
description: Explain code with project and dependency context
---

Explain the selected code using project context.

!/gemini-cli:analyze @{currentFile} @package.json "Explain this code in detail: 1) What it does 2) How it works 3) Key concepts and patterns 4) Dependencies and integrations 5) Business logic. Use clear, educational language."
```

#### `/gemini-security` - Security Audit with Context
```yaml
---
description: Security audit with full project awareness
---

Perform comprehensive security audit with project context.

!/gemini-cli:analyze @{currentFile} @package.json @*.config.* "Security audit - analyze for: 1) Input validation issues 2) Authentication/authorization flaws 3) Data exposure risks 4) Dependency vulnerabilities 5) Configuration security. List only HIGH/CRITICAL issues with specific fixes."
```

### 3. Code Generation Commands

#### `/gemini-function` - Context-Aware Function Generation
```yaml
---
description: Generate functions with project style and dependencies
---

Generate a function that matches your project's style and dependencies.

What function do you need?

!/gemini-cli:sandbox "Create function: {input}. Context from project: {currentFile}. Requirements: 1) Match existing code style 2) Use project dependencies 3) Include proper error handling 4) Add TypeScript types if applicable 5) Include usage example."
```

#### `/gemini-test` - Intelligent Test Generation
```yaml
---
description: Generate tests for the selected code
---

Generate comprehensive tests for the selected code.

!/gemini-cli:analyze @{currentFile} @package.json "Generate tests for this code. Consider: 1) Test framework used in project 2) Edge cases and error conditions 3) Mock external dependencies 4) Coverage of all code paths 5) Integration test scenarios. Include setup and teardown."
```

#### `/gemini-fix` - Smart Debugging
```yaml
---
description: Debug errors with full project context
---

Get debugging help with project context.

What error are you seeing?

!/gemini-cli:analyze @{currentFile} @package.json "Debug this error: {input}. Code context provided. Analysis needed: 1) Root cause identification 2) Step-by-step fix 3) Prevention strategies 4) Related code that might be affected 5) Testing approach."
```

### 4. Project-Wide Commands

#### `/gemini-audit` - Full Project Security Audit
```yaml
---
description: Comprehensive project security audit
---

Perform full project security audit.

!/gemini-cli:analyze @src/* @package.json @*.config.* @.env.example "Comprehensive security audit of entire project. Check: 1) All source files for vulnerabilities 2) Dependency security issues 3) Configuration security 4) Secrets management 5) API security patterns. Prioritize HIGH/CRITICAL issues."
```

#### `/gemini-optimize` - Project Performance Analysis
```yaml
---
description: Project-wide performance optimization analysis
---

Analyze project for performance optimization opportunities.

!/gemini-cli:analyze @src/* @package.json "Performance analysis of entire project. Focus on: 1) Code efficiency bottlenecks 2) Database query optimization 3) Memory usage patterns 4) Bundle size optimization 5) Async/await improvements. Provide specific, actionable recommendations."
```

#### `/gemini-refactor` - Intelligent Refactoring Suggestions
```yaml
---
description: Get refactoring suggestions with architectural awareness
---

Get intelligent refactoring suggestions for selected code.

!/gemini-cli:analyze @{currentFile} @src/* "Refactoring analysis for this code considering entire project architecture. Suggest: 1) Design pattern improvements 2) Code organization enhancements 3) Dependency reduction opportunities 4) Performance optimizations 5) Maintainability improvements."
```

### 5. Utility Commands

#### `/gemini-ask` - Enhanced General Questions
```yaml
---
description: Ask development questions with project context
---

Ask Gemini any development question with project context.

What would you like to ask?

!/gemini-cli:analyze @package.json "Development question: {input}. Project context provided. Please answer considering: 1) Current tech stack 2) Project constraints 3) Best practices 4) Implementation examples 5) Trade-offs and alternatives."
```

## Smart File Selection Logic

### Automatic Context Inclusion
- `@{currentFile}` - Currently open/selected file
- `@package.json` - Always include for project context
- `@src/*` - Source code analysis
- `@*.config.*` - Configuration files
- `@.env.example` - Environment setup context

### Dynamic Selection Patterns
- For planning: Include README, package.json, main source directories
- For security: Include all source files, configs, and dependency files
- For performance: Include source files and build configurations
- For debugging: Include relevant file and its dependencies

## Implementation Notes

### Command Structure
```yaml
---
description: Brief description of what the command does
---

User prompt explaining what the command will do.

Optional input prompt if needed.

!/gemini-cli:analyze|sandbox @files "optimized prompt with context"
```

### Key Improvements
1. **Project Awareness**: Include package.json and configs for context
2. **Smart File Selection**: Automatically include relevant files
3. **Enhanced Prompts**: More specific, actionable prompts
4. **Context Preservation**: Better understanding of project architecture
5. **Error Handling**: More robust error analysis with project context

---
*Next: Update gemini-setup.sh with these designs*