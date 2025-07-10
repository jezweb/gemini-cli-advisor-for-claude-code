# Initial Setup Prompts for Claude Code + Gemini CLI

Copy and paste these prompts into Claude Code to establish Gemini CLI integration.

## 🚀 Initial Connection Test

```
Please verify that Gemini CLI is available and working by running:
1. Check if gemini is installed with `which gemini`
2. Test basic functionality with: gemini -p "Say 'Gemini CLI is working!'"
3. Show me the output

If it's not installed, let me know and we'll set it up.
```

## 🔧 Establish Gemini Master Sessions

```
I want you to set up Gemini CLI as our development advisor. Please create the following specialized Gemini sessions using bash commands:

1. First, create a Security Master session:
   gemini -p "/chat save security-master-$(date +%Y%m%d)
   /memory add 'Role: Security Expert for $(basename $(pwd)) project
   Focus: Vulnerability detection, authentication, input validation, OWASP risks
   Priority: Flag HIGH and CRITICAL issues immediately'
   Security master initialized."

2. Create an Architecture Master session:
   gemini -p "/chat save architecture-master-$(date +%Y%m%d)
   /memory add 'Role: Senior Architect for $(basename $(pwd)) project
   Focus: Design patterns, SOLID principles, clean code, maintainability
   Priority: Consistency and long-term sustainability'
   Architecture master initialized."

3. Create a Performance Master session:
   gemini -p "/chat save performance-master-$(date +%Y%m%d)
   /memory add 'Role: Performance Engineer for $(basename $(pwd)) project
   Focus: Optimization, scalability, resource usage, bottlenecks
   Priority: User-facing performance impacts'
   Performance master initialized."

4. List all sessions to confirm: gemini --list-chats | grep master

Show me the output of each command.
```

## 📊 Project Context Initialization

```
Now let's give Gemini context about our project. Please:

1. Analyze the project structure and create a project overview:
   - Run: find . -type f -name "*.py" -o -name "*.js" -o -name "*.ts" | head -20
   - Check for package files: ls -la package.json requirements.txt go.mod Cargo.toml 2>/dev/null
   - Count files by type: find . -type f | sed 's/.*\.//' | sort | uniq -c | sort -rn | head -10

2. Initialize a project context session:
   gemini -p "/chat save project-context-$(basename $(pwd))
   /memory add 'Project: $(basename $(pwd))
   Directory: $(pwd)
   Main Language: [you determine from the file analysis]
   Framework: [you determine from package files]
   File Count: $(find . -type f | wc -l)
   Initialized: $(date)'
   
   Project structure:
   $(tree -L 2 -I 'node_modules|__pycache__|.git' 2>/dev/null || find . -maxdepth 2 -type d)
   
   Analyze this project and remember its structure."

3. Show me what Gemini identified about the project.
```

## 🔄 Continuous Advisor Mode Setup

```
I want you to establish a continuous development advisor pattern with Gemini. From now on:

1. Before any significant code changes, consult the appropriate Gemini master:
   - Security changes → security-master
   - Architecture/design → architecture-master  
   - Performance-critical → performance-master

2. Create a helper function in our current session (not in any file):
   When I ask you to implement something, you should:
   a) First describe what you plan to do
   b) Run: echo "[your implementation plan]" | gemini -p "/chat resume architecture-master
      Review this implementation plan: [the plan]
      Identify potential issues and suggest improvements."
   c) Show me Gemini's feedback
   d) Adjust your approach based on the feedback
   e) Then implement

3. Confirm you understand this workflow by summarizing it back to me.
```

## 🛡️ Automated Security Check Pattern

```
From now on, I want you to automatically run security checks using Gemini. Here's the pattern:

1. After creating or modifying any authentication, authorization, or data handling code:
   - Immediately run: git diff | gemini -p "/chat resume security-master-$(date +%Y%m%d)
     Security review of these changes:
     [diff content]
     Focus on: injection risks, authentication bypasses, data exposure
     Rate severity: CRITICAL/HIGH/MEDIUM/LOW"

2. Before any database query modifications:
   - Run: echo "[the query or ORM code]" | gemini -p "Check this database operation for:
     - SQL injection vulnerabilities
     - N+1 query problems  
     - Missing indexes
     - Data exposure risks"

3. For any API endpoint changes:
   - Run: cat [the endpoint file] | gemini -p "Security audit this API endpoint for:
     - Authentication requirements
     - Input validation
     - Rate limiting needs
     - CORS issues"

Acknowledge this pattern and demonstrate it by checking any existing authentication code in the project.
```

## 📝 Code Review Integration

```
Set up automatic code review with Gemini. From now on:

1. Before I commit any code, you should automatically:
   git diff --staged | gemini -p "Code review checklist:
   - Security vulnerabilities: 
   - Logic errors:
   - Performance issues:
   - Missing edge cases:
   - Code style problems:
   
   Only report actual issues found, be specific with line numbers."

2. Create an alias for our session (don't save to file):
   - Before commits: Run the above review
   - After review: Show me issues rated HIGH or CRITICAL
   - Ask if I want to proceed despite issues

3. For any function over 20 lines, automatically run:
   echo "[function code]" | gemini -p "Analyze complexity and suggest refactoring if needed"

Test this pattern by reviewing any existing complex function in the codebase.
```

## 🎯 Quick Verification

```
Let's verify everything is working. Please:

1. Show all Gemini sessions: gemini --list-chats
2. Test security master: echo "SELECT * FROM users WHERE id = '$user_id'" | gemini -p "/chat resume security-master-$(date +%Y%m%d) 
   Quick check: is this query safe?"
3. Test architecture master: echo "class UserManager { [20 methods] }" | gemini -p "/chat resume architecture-master-$(date +%Y%m%d)
   Quick check: does this violate SOLID principles?"
4. Confirm the advisory pattern is active by summarizing what checks you'll run automatically

If all tests pass, we're ready to start development with Gemini as our advisor!
```

## 💡 Usage Notes

After pasting these prompts:
- Claude Code will have established multiple Gemini sessions
- It will automatically consult Gemini for security, architecture, and performance decisions
- You won't need to specify what to check - Claude will know when to use Gemini
- The integration will be seamless in your development workflow

Next: Use the prompts in `automated-checks.md` for specific development scenarios.