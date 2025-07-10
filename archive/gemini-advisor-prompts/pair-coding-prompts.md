# Comprehensive Pair Coding Prompts for Gemini CLI

Extended prompts for in-depth development sessions with persistent context and specialized expertise.

## 🚀 Project Initialization

### New Project Setup
```
/chat save project-[project-name]
/memory add 'Project: [project-name]
Type: [web app/API/library]
Stack: [your tech stack]
Goals: [primary objectives]
Constraints: [any limitations]'

I'm starting a new [project type] project. Please help me:

1. Set up the project structure following best practices
2. Configure the development environment
3. Create initial boilerplate with proper patterns
4. Set up testing framework
5. Configure linting and formatting
6. Create a comprehensive .gitignore
7. Set up basic CI/CD pipeline

Tech stack:
- Backend: [framework]
- Frontend: [framework]
- Database: [database]
- Testing: [test framework]

Special requirements:
- [requirement 1]
- [requirement 2]

Let's start with the project structure and core setup.
```

### Existing Project Analysis
```
/chat save analysis-[project-name]
/memory add 'Analyzing existing project: [project-name]'

I need you to analyze my existing codebase and act as a senior developer advisor.

Project structure:
[paste output of: find . -type f -name "*.py" -o -name "*.js" | head -20]

Key files:
[paste package.json/requirements.txt/etc]

Please:
1. Identify the architecture patterns being used
2. Assess code quality and consistency
3. Find potential security vulnerabilities
4. Identify performance bottlenecks
5. Suggest improvement priorities
6. Note any technical debt

After analysis, maintain context as my coding advisor for this project.
```

## 👥 Specialized Master Sessions

### Security Master Session
```
/chat save security-master
/memory add 'Role: Security Expert
Focus: Vulnerability detection, secure coding practices, authentication, authorization, data protection
Context: [Current project name and type]'

You are my security advisor for this project. Your role:

1. Continuously review code for vulnerabilities
2. Suggest security best practices
3. Identify OWASP Top 10 risks
4. Review authentication and authorization
5. Check for data exposure risks
6. Validate input sanitization
7. Review API security
8. Check dependency vulnerabilities

Initial security audit request:
[paste relevant code or describe current implementation]

For all future interactions in this session:
- Flag security issues immediately
- Provide specific, actionable fixes
- Rate severity (Critical/High/Medium/Low)
- Include security test examples
```

### Architecture Master Session
```
/chat save architecture-master
/memory add 'Role: Senior Software Architect
Focus: Design patterns, scalability, maintainability, clean code principles
Context: [Current project details]'

You are my architecture advisor. Your responsibilities:

1. Review and suggest design patterns
2. Ensure SOLID principles
3. Identify code smells
4. Suggest refactoring opportunities
5. Plan for scalability
6. Maintain consistency across codebase
7. Guide technology decisions
8. Document architectural decisions

Current architecture:
[describe or paste high-level structure]

Key challenges:
- [challenge 1]
- [challenge 2]

For all future interactions:
- Focus on long-term maintainability
- Consider team scaling needs
- Provide examples with rationale
- Document decisions and trade-offs
```

### Performance Master Session
```
/chat save performance-master
/memory add 'Role: Performance Engineer
Focus: Optimization, scalability, resource usage, response times
Metrics: [Define target metrics]'

You are my performance optimization specialist. Focus on:

1. Identifying performance bottlenecks
2. Database query optimization
3. Caching strategies
4. Algorithm efficiency
5. Resource usage optimization
6. Load testing recommendations
7. Scalability planning
8. Performance monitoring setup

Current performance profile:
- Average response time: [metric]
- Database queries per request: [metric]
- Memory usage: [metric]
- User load: [current/expected]

Priority areas:
[List specific endpoints or features needing optimization]

Always provide:
- Before/after performance estimates
- Implementation complexity assessment
- Monitoring recommendations
```

### Testing Master Session
```
/chat save testing-master
/memory add 'Role: QA/Test Engineer
Focus: Comprehensive testing, TDD, coverage, edge cases
Framework: [Your test framework]'

You are my testing advisor. Your role includes:

1. Writing comprehensive test suites
2. Identifying edge cases
3. Suggesting test strategies
4. Reviewing test coverage
5. Creating integration tests
6. Planning E2E tests
7. Performance test scenarios
8. Security test cases

Testing philosophy:
- TDD when possible
- Minimum 80% coverage for business logic
- Focus on behavior, not implementation
- Clear test names and documentation

Current test setup:
[Describe current testing approach]

For each feature or fix:
- Write tests first (TDD)
- Cover happy path and edge cases
- Include negative test cases
- Suggest missing test scenarios
```

## 💻 Feature Development Sessions

### Feature Development Session
```
/chat save feature-[feature-name]
/memory add 'Working on feature: [feature-name]
Requirements: [key requirements]
Dependencies: [related features/systems]
Timeline: [if relevant]'

I'm implementing [feature-name]. Here are the requirements:

Functional Requirements:
1. [requirement 1]
2. [requirement 2]
3. [requirement 3]

Technical Constraints:
- [constraint 1]
- [constraint 2]

User Story:
As a [user type]
I want to [action]
So that [benefit]

Please help me:
1. Break down into implementation tasks
2. Identify potential challenges
3. Suggest the architecture approach
4. Plan the database schema changes
5. Design the API endpoints
6. Plan the UI components
7. List required tests
8. Consider security implications
9. Plan for error handling
10. Consider performance impact

Let's start with task breakdown and architecture planning.
```

### Bug Fix Session
```
/chat save bugfix-[issue-id]
/memory add 'Bug: [brief description]
Severity: [critical/high/medium/low]
Reported: [date]
Affected areas: [list areas]'

I need to fix this bug:

Issue Description:
[Detailed bug description]

Steps to Reproduce:
1. [step 1]
2. [step 2]
3. [step 3]

Expected Behavior:
[What should happen]

Actual Behavior:
[What actually happens]

Error Messages/Logs:
```
[paste relevant logs]
```

Environment:
- Version: [version]
- Browser/OS: [details]
- User type: [user role]

Please help me:
1. Analyze the root cause
2. Identify affected code areas
3. Suggest fixes with minimal impact
4. Plan regression tests
5. Consider edge cases
6. Review for similar issues elsewhere

Let's start by reproducing and analyzing the issue.
```

## 🔄 Continuous Development Workflows

### Daily Development Session
```
/chat resume daily-dev
/memory add 'Daily session: [date]'

Good morning! Let's plan today's development work.

Yesterday's Progress:
[Summary or git log output]

Today's Goals:
1. [goal 1]
2. [goal 2]
3. [goal 3]

Current Blockers:
- [blocker if any]

PR/Issues to Address:
- [list open items]

Please:
1. Review yesterday's changes for any issues
2. Prioritize today's tasks
3. Identify potential challenges
4. Suggest optimal task order
5. Flag any technical debt to address

Throughout today's session:
- Review code as I write it
- Suggest improvements proactively
- Help with any blockers
- Maintain context for tomorrow
```

### Code Review Session
```
/chat save review-[pr-number]
/memory add 'Reviewing PR #[number]: [title]
Author: [author]
Target branch: [branch]'

I need a thorough code review of this PR:

Changes Summary:
[paste PR description]

Files Changed:
[paste file list]

Diff:
```
[paste git diff or key changes]
```

Please review for:
1. Logic errors and bugs
2. Security vulnerabilities
3. Performance implications
4. Code style consistency
5. Test coverage
6. Documentation needs
7. Breaking changes
8. Database migration issues
9. API contract changes
10. Error handling

Provide:
- Severity ratings for issues
- Specific line-by-line feedback
- Suggestions for improvements
- Overall assessment
```

### Refactoring Session
```
/chat save refactor-[component]
/memory add 'Refactoring: [component/module]
Goal: [primary refactoring goal]
Constraints: [backward compatibility, etc]'

I need to refactor [component/module name].

Current Issues:
1. [issue 1]
2. [issue 2]
3. [issue 3]

Current Code:
```
[paste current implementation]
```

Refactoring Goals:
- [goal 1: e.g., improve testability]
- [goal 2: e.g., reduce complexity]
- [goal 3: e.g., better separation of concerns]

Constraints:
- Must maintain backward compatibility
- Cannot change API signatures
- Must complete in phases

Please:
1. Analyze current code structure
2. Identify code smells
3. Suggest refactoring approach
4. Plan incremental changes
5. Show before/after examples
6. Plan tests for each phase
7. Identify risks

Let's start with analysis and planning.
```

## 🔧 DevOps and Deployment

### Deployment Planning Session
```
/chat save deployment-[version]
/memory add 'Deployment: v[version]
Environment: [staging/production]
Date: [planned date]'

Planning deployment for version [version].

Changes in this Release:
1. [feature/fix 1]
2. [feature/fix 2]
3. [feature/fix 3]

Database Changes:
- [migration 1]
- [migration 2]

Configuration Changes:
- [config change 1]
- [config change 2]

Please help me:
1. Review deployment checklist
2. Identify risks and rollback plan
3. Plan database migrations
4. Review performance impact
5. Check for breaking changes
6. Plan monitoring and alerts
7. Create deployment scripts
8. Plan smoke tests
9. Document for team

Current deployment process:
[describe current process]
```

### Performance Optimization Sprint
```
/chat save perf-sprint-[date]
/memory add 'Performance Sprint: [date]
Target Metrics: [define targets]
Budget: [time/resource budget]'

Starting a performance optimization sprint.

Current Performance Metrics:
- Page load time: [metric]
- API response time: [metric]
- Database query time: [metric]
- Memory usage: [metric]
- CPU usage: [metric]

Problem Areas:
1. [slow endpoint/feature 1]
2. [slow endpoint/feature 2]
3. [resource-heavy operation]

Available Tools:
- Profiler: [tool name]
- APM: [tool name]
- Load testing: [tool name]

Please help me:
1. Prioritize optimization targets
2. Set realistic improvement goals
3. Plan measurement strategy
4. Identify quick wins
5. Plan major optimizations
6. Create performance tests
7. Plan caching strategy
8. Review database indexes
9. Consider architecture changes

Let's start with profiling and analysis.
```

## 📊 Analysis and Planning

### Technical Debt Assessment
```
/chat save tech-debt-assessment
/memory add 'Technical Debt Review: [date]
Focus Areas: [list priority areas]'

I need to assess and plan technical debt reduction.

Known Issues:
1. [debt item 1]
2. [debt item 2]
3. [debt item 3]

Code Metrics:
- Test coverage: [percentage]
- Cyclomatic complexity: [metric]
- Duplication: [metric]
- Outdated dependencies: [count]

Business Context:
- Upcoming features: [list]
- Team size: [number]
- Time budget: [hours/sprint]

Please:
1. Analyze and prioritize technical debt
2. Estimate effort for each item
3. Identify dependencies
4. Suggest incremental approach
5. Balance with feature development
6. Create measurement criteria
7. Plan for prevention

Output a prioritized backlog with rationale.
```

### Architecture Evolution Planning
```
/chat save architecture-evolution
/memory add 'Architecture Planning Session
Current State: [brief description]
Target State: [vision]
Timeline: [timeframe]'

Let's plan the evolution of our architecture.

Current Architecture:
[Describe or diagram current state]

Pain Points:
1. [pain point 1]
2. [pain point 2]
3. [pain point 3]

Future Requirements:
- Scale: [expected growth]
- Features: [planned capabilities]
- Team: [team growth plans]

Constraints:
- Budget: [constraints]
- Timeline: [constraints]
- Skills: [team capabilities]

Please help me:
1. Assess current architecture
2. Define target architecture
3. Plan migration phases
4. Identify risks and mitigation
5. Estimate effort and timeline
6. Plan proof of concepts
7. Define success metrics
8. Create decision records

Focus on incremental, low-risk evolution.
```

## 💡 Learning and Improvement

### Code Review Learning Session
```
/chat save learning-review
/memory add 'Learning Focus: [topic]
Goal: Improve [specific skill]'

I want to improve my code through review and learning.

Current Code Sample:
```
[paste your code]
```

I want to learn about:
1. [topic 1: e.g., design patterns]
2. [topic 2: e.g., performance]
3. [topic 3: e.g., testing]

Please:
1. Review my code thoroughly
2. Identify improvement opportunities
3. Explain better approaches
4. Show refactored examples
5. Explain the "why" behind suggestions
6. Recommend learning resources
7. Suggest practice exercises

Teaching style:
- Explain concepts clearly
- Use examples from my code
- Provide actionable feedback
- Balance theory and practice
```

## 🛠️ Integration Helpers

### Git Workflow Integration
```bash
# Pre-commit review
git diff --staged | gemini -p "
/chat resume security-master
Review these staged changes for security issues:
[diff content]
"

# Feature branch review
git diff main..feature-branch | gemini -p "
/chat resume architecture-master
Review these feature changes for architecture consistency:
[diff content]
"
```

### Continuous Monitoring
```bash
# Weekly architecture review
gemini -p "
/chat resume architecture-master
/memory add 'Weekly review: $(date)'

This week's changes:
$(git log --oneline --since='1 week ago')

Modified files:
$(git diff --name-only HEAD~20..HEAD | sort | uniq)

Please:
1. Review architectural consistency
2. Identify emerging patterns
3. Spot technical debt accumulation
4. Suggest refactoring priorities
"
```

---

## Best Practices for Long Sessions

1. **Use Memory Commands**: Regularly update context with `/memory add`
2. **Save Sessions**: Use `/chat save` for important conversations
3. **Compress When Needed**: Use `/compress` to manage token limits
4. **Stay Focused**: One master session per concern
5. **Document Decisions**: Ask for rationale and trade-offs
6. **Review Regularly**: Schedule periodic reviews
7. **Integrate with Tools**: Connect with your existing workflow

## Session Management Commands

```bash
# List saved sessions
gemini --list-chats

# Resume specific session
gemini -p "/chat resume [session-name]"

# Compress current session
gemini -p "/compress
Keep: Critical decisions, current task context, blockers"

# Update memory
gemini -p "/memory add '[New context information]'"
```