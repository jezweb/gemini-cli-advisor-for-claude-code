# Gemini MCP Usage Guide: Complete AI Development Workflows

## 🚀 Quick Start

### 1. Prerequisites Setup
```bash
# Keep Gemini updated
npm install -g @google/gemini-cli

# Verify installation
gemini --version

# Authenticate with personal Gmail
gemini auth

# Install MCP server
claude mcp add gemini-cli -s user -- npx -y gemini-mcp-tool

# Run setup for 20 commands
./gemini-setup.sh
```

### ⚡ Automatic Model Selection
Commands automatically use the optimal model:
- **gemini-2.5-flash** (default): Most commands, avoids rate limits
- **gemini-2.5-pro**: Complex analysis only (may hit rate limits)

No manual configuration needed!

### 2. Choose Your Activation Method

#### Option A: Full Workflow Integration (Recommended)
```
Gemini MCP server is my AI development advisor with 20 specialized commands.

DEVELOPMENT WORKFLOW:
When working on any task:
1. Create initial plan using TodoWrite for task tracking
2. Check plan with /gemini-plan or /gemini-proceed before starting
3. Implement changes methodically, using /gemini-approach for decisions
4. Use /gemini-review regularly during development
5. When Gemini suggests changes, use /gemini-implement then /gemini-verify
6. Use /gemini-iterate to refine until Gemini approves
7. For complex tasks, use workflow commands like /gemini-build-cycle

COMMAND CATEGORIES:
CORE (8): plan, approach, function, review, explain, fix, security, ask
ADVANCED (4): test, audit, optimize, refactor  
RESPONSE (4): implement, verify, iterate, proceed
WORKFLOW (4): fix-cycle, build-cycle, secure-cycle, optimize-cycle

REMEMBER:
- Use Gemini throughout development, not just for finding problems
- Ask Gemini to search the web for latest documentation when needed
- Consider architecture, dependencies, and connections in all work
- Test changes continuously with Gemini verification
```

#### Option B: Simple Commands Only
```
Gemini MCP server is available. Use slash commands:
/gemini-plan, /gemini-review, /gemini-fix, /gemini-security, /gemini-test,
/gemini-audit, /gemini-optimize, /gemini-implement, /gemini-verify, etc.
Or use direct commands: "Use gemini to analyze this file"
```

## 📋 Command Reference

### Core Commands (Enhanced)

#### `/gemini-plan` - Project-Aware Planning
**What it does:** Analyzes your entire project (package.json, README, source files) to provide architecture and feature planning.

**Best for:**
- Planning new features with existing tech stack in mind
- Architecture decisions based on current dependencies
- Integration planning with existing codebase

**Example usage:**
```
/gemini-plan
> "user authentication with JWT tokens"
```

**What gets analyzed:**
- `@package.json` - Current dependencies and scripts
- `@*/README.md` - Project documentation
- `@src/*` - Existing source code structure

---

#### `/gemini-approach` - Context-Aware Best Practices
**What it does:** Provides best practice advice considering your specific tech stack and project context.

**Best for:**
- Deciding between different implementation approaches
- Getting tech-stack specific recommendations
- Understanding pros/cons for your specific project

**Example usage:**
```
/gemini-approach
> "should I use REST API or GraphQL for this project?"
```

**Context included:**
- Current project dependencies
- Selected code or text for specific context

---

#### `/gemini-function` - Smart Function Generation
**What it does:** Uses sandbox mode to safely generate functions that match your project's coding style and use appropriate dependencies.

**Best for:**
- Creating utility functions that fit your codebase
- Generating functions with proper error handling
- TypeScript-aware function generation

**Example usage:**
```
/gemini-function
> "email validation function using the validation library we already have"
```

**Features:**
- Matches existing code style and patterns
- Uses project's existing dependencies
- Includes proper error handling
- Adds TypeScript types if applicable
- Provides usage examples

---

#### `/gemini-review` - Comprehensive Code Review
**What it does:** Performs thorough code review considering your project's architecture, dependencies, and best practices.

**Best for:**
- Pre-commit code reviews
- Security and performance analysis
- Catching integration issues

**Example usage:**
1. Select code in Claude Code
2. Type: `/gemini-review`

**Analysis includes:**
- Security vulnerabilities (input validation, auth, data exposure)
- Performance bottlenecks and optimization opportunities
- Best practices for your specific tech stack
- Code maintainability and readability
- Integration and dependency issues

---

#### `/gemini-explain` - Project-Context Code Explanation
**What it does:** Explains code with full understanding of your project architecture and dependencies.

**Best for:**
- Understanding complex code sections
- Learning how code fits into the larger project
- Onboarding new team members

**Example usage:**
1. Select code in Claude Code
2. Type: `/gemini-explain`

**Explanation covers:**
- What the code does and its purpose in the project
- How it works step-by-step
- Key concepts, patterns, and technologies used
- Dependencies and their roles
- Integration points with other project components

---

#### `/gemini-fix` - Smart Debugging
**What it does:** Provides debugging help with full project context and awareness.

**Best for:**
- Debugging complex errors
- Understanding why errors occur
- Getting education along with solutions

**Example usage:**
```
/gemini-fix
> "TypeError: Cannot read property 'name' of undefined in user authentication"
```

**Analysis provides:**
- Root cause identification with project context
- Step-by-step fix with code examples
- Educational explanation of why error occurred
- Prevention strategies and best practices
- Related code areas that might need attention

---

#### `/gemini-security` - Context-Aware Security Audit
**What it does:** Performs security audit considering your specific configurations and dependencies.

**Best for:**
- Security reviews before deployment
- Identifying configuration security issues
- Dependency vulnerability analysis

**Example usage:**
1. Select code in Claude Code
2. Type: `/gemini-security`

**Security analysis:**
- Input validation and sanitization issues
- Authentication and authorization flaws
- Data exposure and privacy risks
- Dependency vulnerabilities
- Configuration and environment security

---

#### `/gemini-ask` - Project-Context Questions
**What it does:** Answers development questions with automatic inclusion of your project context.

**Best for:**
- Getting project-specific advice
- Understanding how to implement features in your tech stack
- Clarifying best practices for your specific setup

**Example usage:**
```
/gemini-ask
> "how should I handle file uploads in this application?"
```

**Context considered:**
- Current tech stack and dependencies
- Project architecture and constraints
- Best practices for your technology
- Trade-offs and alternatives

### Advanced Commands (New)

#### `/gemini-test` - Intelligent Test Generation
**What it does:** Generates comprehensive tests that understand your project's testing framework and patterns.

**Best for:**
- Creating test suites for new functions
- Generating edge case tests
- Following project testing conventions

**Example usage:**
1. Select a function in Claude Code
2. Type: `/gemini-test`

**Test generation includes:**
- Tests using your project's testing framework
- Edge cases and error conditions
- Mocking strategies for external dependencies
- Coverage of all code paths
- Setup and teardown procedures

---

#### `/gemini-audit` - Project-Wide Security Audit
**What it does:** Comprehensive security analysis across your entire project including all source files and configurations.

**Best for:**
- Pre-deployment security reviews
- Comprehensive vulnerability assessment
- Security compliance checks

**Example usage:**
```
/gemini-audit
```

**Analyzes:**
- All source code files for vulnerabilities
- Dependency security issues and outdated packages
- Configuration security (CORS, headers, environment)
- Secrets management and exposure risks
- API security patterns and authentication

---

#### `/gemini-optimize` - Performance Analysis
**What it does:** Analyzes your entire codebase for performance optimization opportunities.

**Best for:**
- Performance tuning before production
- Identifying bottlenecks across the application
- Getting specific optimization recommendations

**Example usage:**
```
/gemini-optimize
```

**Analysis focuses on:**
- Code efficiency bottlenecks and algorithmic improvements
- Database query optimization opportunities
- Memory usage patterns and potential leaks
- Bundle size optimization and code splitting
- Async/await patterns and concurrency improvements

---

#### `/gemini-refactor` - Architectural Refactoring
**What it does:** Provides refactoring suggestions that consider your entire project architecture.

**Best for:**
- Improving code maintainability
- Applying design patterns consistently
- Reducing technical debt

**Example usage:**
1. Select code to refactor in Claude Code
2. Type: `/gemini-refactor`

**Refactoring suggestions:**
- Design pattern improvements and SOLID principles
- Code organization and structure enhancements
- Dependency reduction and coupling improvements
- Performance optimizations and efficiency gains
- Maintainability and readability improvements

### Response Handler Commands (New)

#### `/gemini-implement` - Implement Gemini's Suggestions
**What it does:** Takes Gemini's recommendations from previous analysis and helps implement them correctly.

**Best for:**
- Acting on code review feedback
- Implementing security fixes
- Applying optimization suggestions
- Following architectural recommendations

**Example usage:**
```
/gemini-implement
> "Add input validation for email field and hash passwords with bcrypt"
```

**Claude Code will:**
- Implement the suggested changes
- Maintain existing code style
- Ensure changes are tested
- Follow best practices

---

#### `/gemini-verify` - Verify Implementation
**What it does:** Checks if your implementation correctly follows Gemini's recommendations.

**Best for:**
- Confirming fixes are complete
- Ensuring nothing was missed
- Validating implementation quality
- Checking for new issues

**Example usage:**
1. After implementing changes
2. Type: `/gemini-verify`

**Verification includes:**
- All suggestions were implemented
- Implementation follows best practices
- No new issues introduced
- Changes match original recommendations

---

#### `/gemini-iterate` - Iterative Refinement
**What it does:** Shows Gemini your changes and gets feedback for further improvements.

**Best for:**
- Refining implementations
- Getting feedback on partial work
- Continuous improvement cycles
- Learning from feedback

**Example usage:**
1. After making changes
2. Type: `/gemini-iterate`

**Iteration focuses on:**
- Whether changes address original issues
- Improvements or adjustments needed
- New issues that might have appeared
- Next steps for enhancement

---

#### `/gemini-proceed` - Confirm Before Major Changes
**What it does:** Gets Gemini's approval on your implementation plan before making significant changes.

**Best for:**
- Major refactoring decisions
- Architecture changes
- Security implementations
- Performance optimizations

**Example usage:**
```
/gemini-proceed
> "Plan to replace synchronous file operations with async/await pattern across all API endpoints"
```

**Evaluation includes:**
- Will approach solve the problem?
- Are there better alternatives?
- What edge cases to consider?
- Risks and dependencies
- GO/NO-GO recommendation

### Workflow Commands (New)

#### `/gemini-fix-cycle` - Complete Fix Workflow
**What it does:** Automates the entire debugging process from identification to verification.

**Best for:**
- Bug fixes with root cause analysis
- Error resolution workflows
- Systematic debugging
- Verified solutions

**Example usage:**
```
/gemini-fix-cycle
> "Users getting 'undefined' error when submitting forms"
```

**Workflow steps:**
1. Identify root cause with `/gemini-fix`
2. Implement the solution
3. Verify with `/gemini-verify`
4. Iterate if needed

---

#### `/gemini-build-cycle` - Feature Development Workflow
**What it does:** Complete feature building cycle with continuous Gemini collaboration.

**Best for:**
- New feature development
- Complex implementations
- Test-driven development
- Iterative building

**Example usage:**
```
/gemini-build-cycle
> "Add real-time chat feature with WebSocket"
```

**Workflow includes:**
1. Architecture planning with `/gemini-plan`
2. Implementation with regular `/gemini-review`
3. Test generation with `/gemini-test`
4. Iterative improvements with `/gemini-iterate`

---

#### `/gemini-secure-cycle` - Security Hardening Workflow
**What it does:** Security-focused development with continuous auditing.

**Best for:**
- Security-critical features
- Compliance requirements
- Vulnerability remediation
- Security-first development

**Example usage:**
```
/gemini-secure-cycle
> "User authentication and session management"
```

**Security workflow:**
1. Initial audit with `/gemini-security`
2. Implement security fixes
3. Verify each fix with `/gemini-verify`
4. Comprehensive re-audit with `/gemini-audit`

---

#### `/gemini-optimize-cycle` - Performance Optimization Workflow
**What it does:** Complete performance tuning cycle with measurements.

**Best for:**
- Performance bottlenecks
- Optimization sprints
- Load time improvements
- Resource optimization

**Example usage:**
```
/gemini-optimize-cycle
> "API response times over 2 seconds"
```

**Optimization workflow:**
1. Baseline analysis with `/gemini-optimize`
2. Implement improvements
3. Verify functionality maintained
4. Measure performance gains

## 🎯 Complete Development Workflows

### Example 1: Building a New Feature (Manual Steps)
```bash
# 1. Initial planning
/gemini-plan
> "user profile management with avatar upload"

# 2. Confirm approach
/gemini-proceed
> "Use S3 for avatars, add profile table with user_id foreign key"

# 3. Build incrementally
# ... write initial code ...
/gemini-review  # Get early feedback

# 4. Act on feedback
/gemini-implement
> "Add file size validation, sanitize filenames, use UUID for S3 keys"

# 5. Verify implementation
/gemini-verify  # Ensure all suggestions implemented

# 6. Generate tests
/gemini-test  # Create comprehensive test suite

# 7. Security check
/gemini-security  # Final security audit

# 8. Iterate if needed
/gemini-iterate  # Get final improvements
```

### Example 2: Using Workflow Commands (Automated)
```bash
# Option A: Complete feature cycle
/gemini-build-cycle
> "Add user profile management with avatar upload"
# Automatically handles: planning → implementation → testing → review → iteration

# Option B: Security-focused development
/gemini-secure-cycle
> "Payment processing with Stripe integration"
# Automatically handles: security audit → secure implementation → verification → re-audit

# Option C: Performance optimization
/gemini-optimize-cycle
> "Dashboard loading takes 5+ seconds"
# Automatically handles: analysis → optimization → verification → measurement
```

### Example 3: Debugging Workflow
```bash
# Manual approach
1. /gemini-fix → "TypeError in user registration"
2. /gemini-implement → "Add null checks and validation"
3. /gemini-verify → Confirm fix works
4. /gemini-test → Generate tests to prevent regression

# Automated approach
/gemini-fix-cycle
> "TypeError in user registration"
# Handles entire fix process automatically
```

### Example 4: Iterative Development Pattern
```bash
# Start simple, iterate with Gemini
1. Write basic implementation
2. /gemini-review → Get improvement suggestions
3. /gemini-implement → Apply suggestions
4. /gemini-iterate → Get feedback on changes
5. Repeat until Gemini approves

# This creates a tight feedback loop for quality code
```

## 🔧 Pro Tips

### File Selection Strategy
- **@package.json** - Always included for project context
- **@src/*** - Includes all source files for comprehensive analysis
- **@*.config.*** - Configuration files for security/setup analysis
- **@{currentFile}** - Currently open file in Claude Code

### Command Optimization
- **Use specific commands** for targeted analysis
- **Combine commands** for comprehensive reviews
- **Select relevant code** before running commands for focused analysis
- **Use project-wide commands** (audit, optimize) periodically

### Best Practices
- **Start with workflow commands** for complex tasks
- **Use response handlers** to act on Gemini's feedback
- **Iterate frequently** with `/gemini-iterate` for quality
- **Verify always** with `/gemini-verify` after changes
- **Security first** - Run `/gemini-security` on all user input
- **Test everything** - Use `/gemini-test` for new code
- **Ask Gemini to search** - "search the web for React 19 best practices"

## 🆘 Troubleshooting

### Rate Limit Errors (429)
- **Most commands use flash** to avoid this issue
- **Complex commands (plan, audit, etc.) use pro** and may hit limits
- **Solutions:**
  - Wait 5-10 minutes for rate limit reset
  - Manually switch to flash: `gemini -m gemini-2.5-flash`
  - Use simpler commands during high usage

### Commands Not Appearing
- Restart Claude Code after setup
- Verify MCP server: `claude mcp list` should show `gemini-cli`

### Authentication Issues
- Re-authenticate: `gemini auth`
- Check MCP server status: `claude mcp get gemini-cli`
- Must use personal Gmail (workspace accounts don't work)

### File Analysis Errors
- MCP handles missing files gracefully
- Ensure files exist in expected locations
- Check project structure matches command expectations

### Performance Issues
- Large projects may take longer to analyze
- Use specific file selection for faster results
- Flash model is faster than pro for most tasks

---

*Elevate your development workflow with AI-powered, project-aware assistance* 🚀