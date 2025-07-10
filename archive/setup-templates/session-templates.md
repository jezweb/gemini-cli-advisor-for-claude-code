# Gemini Session Templates

Templates used by gemini-setup.sh to create specialized advisor sessions.

## Security Master Template

```
/chat save security-master-[DATE]
/memory add 'Role: Security Expert
Project: [PROJECT_NAME]
Tech Stack: [TECH_STACK]
Focus: Vulnerability detection, authentication, input validation, OWASP risks
Priority: Flag HIGH and CRITICAL issues immediately
Specialized Knowledge:
- Authentication best practices for [TECH_STACK]
- Common vulnerabilities in [FRAMEWORK]
- Security headers and CSP policies
- Secrets management
- API security patterns
Initialized: [DATE]'
```

## Architecture Master Template

```
/chat save architecture-master-[DATE]
/memory add 'Role: Senior Software Architect
Project: [PROJECT_NAME]
Tech Stack: [TECH_STACK]
Framework: [FRAMEWORK]
Focus: Design patterns, SOLID principles, clean code, maintainability
Priority: Consistency and long-term sustainability
Specialized Knowledge:
- [TECH_STACK] best practices
- [FRAMEWORK] patterns and anti-patterns
- Microservices vs monolith decisions
- API design principles
- Database schema design
- Caching strategies
Initialized: [DATE]'
```

## Performance Master Template

```
/chat save performance-master-[DATE]
/memory add 'Role: Performance Engineer
Project: [PROJECT_NAME]
Tech Stack: [TECH_STACK]
Focus: Optimization, scalability, resource usage, bottlenecks
Priority: User-facing performance impacts
Specialized Knowledge:
- [TECH_STACK] performance optimization
- Database query optimization
- Caching strategies for [FRAMEWORK]
- Profiling and monitoring
- Load testing approaches
- Memory management
- Async/concurrent patterns
Initialized: [DATE]'
```

## Testing Master Template

```
/chat save testing-master-[DATE]
/memory add 'Role: QA/Test Engineer
Project: [PROJECT_NAME]
Tech Stack: [TECH_STACK]
Framework: [FRAMEWORK]
Focus: Comprehensive testing, TDD, coverage, edge cases
Testing Framework: [TEST_FRAMEWORK]
Priority: Preventing regressions and ensuring quality
Specialized Knowledge:
- [TECH_STACK] testing best practices
- Unit, integration, and E2E testing
- Mocking and stubbing strategies
- Test data management
- CI/CD test integration
- Performance testing
- Security testing
Initialized: [DATE]'
```

## Project Context Template

```
/chat save project-[PROJECT_NAME]
/memory add 'Project: [PROJECT_NAME]
Directory: [PROJECT_DIR]
Tech Stack: [TECH_STACK]
Framework: [FRAMEWORK]
Type: [PROJECT_TYPE]
Git Remote: [GIT_REMOTE]
Team Size: [TEAM_SIZE]
Stage: [development/production]
Key Features:
- [FEATURE_1]
- [FEATURE_2]
- [FEATURE_3]
Technical Decisions:
- Database: [DB_TYPE]
- Authentication: [AUTH_METHOD]
- Deployment: [DEPLOYMENT_TARGET]
Initialized: [DATE]'
```

## Daily Development Template

```
/chat save daily-dev
/memory add 'Daily development session
Project: [PROJECT_NAME]
Developer: [USER]
Workflow Preferences:
- Morning review of previous work
- Task prioritization
- Continuous code review
- End-of-day summary
Integration Points:
- Git for version control
- [ISSUE_TRACKER] for task management
- [CI_CD] for deployment
Initialized: [DATE]'
```

## Feature Development Template

```
/chat save feature-[FEATURE_NAME]-[TIMESTAMP]
/memory add 'Feature: [FEATURE_NAME]
Description: [DESCRIPTION]
Requirements:
- [REQ_1]
- [REQ_2]
- [REQ_3]
Technical Approach: [APPROACH]
Dependencies: [DEPENDENCIES]
Security Considerations: [SECURITY]
Performance Targets: [PERFORMANCE]
Test Strategy: [TESTING]
Started: [DATE]'
```

## Bug Fix Template

```
/chat save bug-[ISSUE_ID]-[TIMESTAMP]
/memory add 'Bug: [ISSUE_ID]
Description: [BUG_DESCRIPTION]
Severity: [CRITICAL/HIGH/MEDIUM/LOW]
Reported By: [REPORTER]
Symptoms: [SYMPTOMS]
Expected Behavior: [EXPECTED]
Actual Behavior: [ACTUAL]
Environment: [ENV_DETAILS]
Initial Investigation: [FINDINGS]
Started: [DATE]'
```

## Customization Guide

To customize these templates:

1. **Add Domain-Specific Knowledge**
   - Include industry-specific requirements
   - Add compliance needs (HIPAA, PCI, etc.)
   - Include company coding standards

2. **Enhance Tech Stack Details**
   - Add specific library versions
   - Include internal frameworks
   - Note deprecated patterns to avoid

3. **Project-Specific Context**
   - Add team conventions
   - Include deployment environments
   - Note integration points

4. **Workflow Preferences**
   - Adjust check frequencies
   - Modify severity thresholds
   - Add custom review criteria