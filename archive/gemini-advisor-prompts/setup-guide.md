# Gemini CLI Setup Guide for Development Workflows

Complete setup instructions and scripts for integrating Gemini CLI into your development workflow.

## Prerequisites

### Install Gemini CLI
```bash
# Using pip (recommended)
pip install google-generativeai

# Or using pipx for isolated installation
pipx install google-generativeai

# Verify installation
gemini --version
```

### Configure API Key
```bash
# Set your API key (get from https://makersuite.google.com/app/apikey)
export GEMINI_API_KEY="your-api-key-here"

# Add to your shell profile for persistence
echo 'export GEMINI_API_KEY="your-api-key-here"' >> ~/.bashrc
# or for zsh
echo 'export GEMINI_API_KEY="your-api-key-here"' >> ~/.zshrc
```

## Shell Functions and Aliases

Add these to your `~/.bashrc` or `~/.zshrc`:

### Basic Aliases
```bash
# Quick gemini access
alias gm='gemini'
alias gmp='gemini -p'  # with prompt

# Common tasks
alias gm-review='gemini -p "Review this code for issues:"'
alias gm-security='gemini -p "Security audit this code:"'
alias gm-explain='gemini -p "Explain this code:"'
alias gm-optimize='gemini -p "Optimize this code for performance:"'
alias gm-test='gemini -p "Write tests for this code:"'
alias gm-debug='gemini -p "Help debug this error:"'
```

### Advanced Functions
```bash
# Initialize a new project advisor
gemini_init_project() {
    local project_name="${1:-$(basename $(pwd))}"
    local tech_stack="$2"
    
    gemini -p "/chat save project-$project_name
/memory add 'Project: $project_name
Directory: $(pwd)
Tech Stack: $tech_stack
Initialized: $(date)'

You are now my development advisor for $project_name.
Please analyze the project structure and be ready to help with development."
}

# Daily development session
gemini_daily() {
    local message="${1:-Starting daily development session}"
    
    # Get recent git activity
    local recent_commits=$(git log --oneline -10 2>/dev/null || echo "No git repository")
    local modified_files=$(git status --porcelain 2>/dev/null || echo "No git repository")
    
    gemini -p "/chat resume daily-dev
/memory add 'Daily session: $(date)'

$message

Recent commits:
$recent_commits

Modified files:
$modified_files

What should we focus on today?"
}

# Review staged changes before commit
gemini_precommit() {
    if [ -z "$(git diff --staged)" ]; then
        echo "No staged changes to review"
        return 1
    fi
    
    git diff --staged | gemini -p "Review these staged changes for:
1. Security issues
2. Logic errors
3. Performance problems
4. Missing edge cases
5. Code style issues

Provide specific feedback only for problems found."
}

# Security-focused code review
gemini_security() {
    local file_or_pattern="$1"
    
    if [ -f "$file_or_pattern" ]; then
        cat "$file_or_pattern" | gemini -p "Security audit this code.
Check for: SQL injection, XSS, authentication issues, data exposure.
Rate severity and provide fixes."
    else
        find . -name "$file_or_pattern" -type f -exec cat {} \; | \
        gemini -p "Security audit these files for vulnerabilities."
    fi
}

# Feature development starter
gemini_feature() {
    local feature_name="$1"
    local description="$2"
    
    if [ -z "$feature_name" ]; then
        echo "Usage: gemini_feature <feature-name> [description]"
        return 1
    fi
    
    gemini -p "/chat save feature-$feature_name
/memory add 'Feature: $feature_name
Description: $description
Started: $(date)'

I'm implementing a new feature: $feature_name
$description

Help me:
1. Plan the implementation
2. Identify affected components
3. Design the architecture
4. List required tests
5. Consider security implications"
}

# Bug fix helper
gemini_bugfix() {
    local issue_id="$1"
    local description="$2"
    
    gemini -p "/chat save bugfix-$issue_id

I need to fix bug #$issue_id: $description

Please help me:
1. Understand the root cause
2. Find the problematic code
3. Suggest a fix
4. Identify similar issues
5. Plan regression tests"
}

# Architecture review
gemini_architecture() {
    local focus="${1:-general}"
    
    # Gather project info
    local file_count=$(find . -type f -name "*.py" -o -name "*.js" -o -name "*.ts" | wc -l)
    local loc=$(find . -type f -name "*.py" -o -name "*.js" -o -name "*.ts" -exec wc -l {} + | tail -1)
    
    gemini -p "/chat resume architecture-master

Analyze architecture (focus: $focus)
Project stats: $file_count files, $loc

Review for:
1. Design pattern consistency
2. SOLID principle violations
3. Coupling and cohesion issues
4. Scalability concerns
5. Technical debt

Suggest improvements."
}

# Test generator
gemini_test() {
    local file="$1"
    local framework="${2:-pytest}"  # default to pytest
    
    if [ ! -f "$file" ]; then
        echo "File not found: $file"
        return 1
    fi
    
    cat "$file" | gemini -p "Generate comprehensive tests for this code.

Framework: $framework
Include:
- Unit tests for all functions
- Edge cases
- Error conditions
- Integration tests if applicable
- Mock external dependencies

Follow TDD best practices."
}

# Performance analysis
gemini_perf() {
    local file_or_code="$1"
    
    if [ -f "$file_or_code" ]; then
        cat "$file_or_code" | gemini -p "Analyze this code for performance issues.
Identify: bottlenecks, inefficient algorithms, memory leaks.
Suggest optimizations with complexity analysis."
    else
        echo "$file_or_code" | gemini -p "Analyze this code snippet for performance."
    fi
}

# API endpoint reviewer
gemini_api() {
    local endpoint_file="$1"
    
    cat "$endpoint_file" | gemini -p "Review this API endpoint for:
1. RESTful conventions
2. Security (auth, input validation)
3. Error handling
4. Performance
5. Documentation completeness

Suggest improvements."
}

# Quick consultation (doesn't affect main session)
gemini_quick() {
    local question="$1"
    timeout 300 gemini -a -p "Quick consultation - keep response concise:
$question"
}

# Compress current session
gemini_compress() {
    gemini -p "/compress
Keep only:
1. Critical decisions and their rationale
2. Current task context
3. Unresolved issues and blockers
4. Key code patterns established
5. Security findings"
}

# Save important code snippet to memory
gemini_remember() {
    local description="$1"
    local code="$2"
    
    gemini -p "/memory add 'CODE PATTERN: $description
$code
Added: $(date)'"
}
```

### Git Integration Functions
```bash
# Review entire PR/branch
gemini_pr_review() {
    local base_branch="${1:-main}"
    local pr_diff=$(git diff $base_branch...HEAD)
    local file_list=$(git diff --name-only $base_branch...HEAD)
    
    echo "$pr_diff" | gemini -p "/chat save pr-review-$(date +%s)
    
Reviewing PR changes against $base_branch

Files changed:
$file_list

Please provide:
1. Overall assessment
2. Security issues (with severity)
3. Logic errors
4. Performance concerns
5. Missing tests
6. Breaking changes
7. Suggestions for improvement

Be specific with line numbers where possible."
}

# Weekly summary
gemini_weekly() {
    local commits=$(git log --oneline --since='1 week ago')
    local files_changed=$(git diff --stat HEAD~20..HEAD 2>/dev/null || echo "No recent changes")
    
    gemini -p "/chat resume weekly-review
/memory add 'Weekly review: $(date)'

This week's development summary:

Commits:
$commits

Files changed:
$files_changed

Please:
1. Summarize key accomplishments
2. Identify technical debt introduced
3. Highlight security concerns
4. Suggest focus for next week
5. Note any architectural drift"
}
```

## Specialized Session Initializers

Create a file `~/.gemini-sessions.sh` and source it in your shell profile:

```bash
#!/bin/bash
# ~/.gemini-sessions.sh - Gemini CLI session initializers

# Initialize all master sessions for a project
init_gemini_masters() {
    local project_name="${1:-$(basename $(pwd))}"
    
    echo "Initializing Gemini master sessions for $project_name..."
    
    # Security Master
    timeout 300 gemini -a -p "/chat save security-master
/memory add 'Role: Security Expert
Project: $project_name
Focus: Vulnerability detection, secure coding practices
Initialized: $(date)'
Security master session initialized."
    
    # Architecture Master
    timeout 300 gemini -a -p "/chat save architecture-master
/memory add 'Role: Senior Software Architect
Project: $project_name
Focus: Design patterns, scalability, clean code
Initialized: $(date)'
Architecture master session initialized."
    
    # Performance Master
    timeout 300 gemini -a -p "/chat save performance-master
/memory add 'Role: Performance Engineer
Project: $project_name
Focus: Optimization, scalability, resource usage
Initialized: $(date)'
Performance master session initialized."
    
    # Testing Master
    timeout 300 gemini -a -p "/chat save testing-master
/memory add 'Role: QA/Test Engineer
Project: $project_name
Focus: Comprehensive testing, TDD, coverage
Initialized: $(date)'
Testing master session initialized."
    
    echo "All master sessions initialized!"
    gemini --list-chats | grep master
}

# Switch between master sessions
gemini_switch() {
    local session_type="$1"
    
    case "$session_type" in
        security|sec)
            gemini -p "/chat resume security-master"
            ;;
        architecture|arch)
            gemini -p "/chat resume architecture-master"
            ;;
        performance|perf)
            gemini -p "/chat resume performance-master"
            ;;
        testing|test)
            gemini -p "/chat resume testing-master"
            ;;
        *)
            echo "Usage: gemini_switch [security|architecture|performance|testing]"
            gemini --list-chats
            ;;
    esac
}

# Source this file in your .bashrc/.zshrc
# echo "source ~/.gemini-sessions.sh" >> ~/.bashrc
```

## Integration Scripts

### Pre-commit Hook
Create `.git/hooks/pre-commit`:

```bash
#!/bin/bash
# Gemini CLI pre-commit hook

# Only run if gemini is available
if ! command -v gemini &> /dev/null; then
    exit 0
fi

echo "Running Gemini security review..."

# Review staged changes
git diff --staged | gemini -a -p "Quick security review of staged changes.
Only report HIGH or CRITICAL issues.
Be concise." > /tmp/gemini-review.txt

# Check if any issues were found
if grep -iE "(critical|high|vulnerability|security)" /tmp/gemini-review.txt; then
    echo "Security concerns found:"
    cat /tmp/gemini-review.txt
    echo ""
    read -p "Continue with commit? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

exit 0
```

### VS Code Integration
Add to `.vscode/tasks.json`:

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Gemini: Review Current File",
            "type": "shell",
            "command": "cat ${file} | gemini -p 'Review this code for issues'",
            "presentation": {
                "reveal": "always",
                "panel": "new"
            }
        },
        {
            "label": "Gemini: Security Audit",
            "type": "shell",
            "command": "cat ${file} | gemini -p 'Security audit this code'",
            "presentation": {
                "reveal": "always",
                "panel": "new"
            }
        },
        {
            "label": "Gemini: Generate Tests",
            "type": "shell",
            "command": "cat ${file} | gemini -p 'Generate tests for this code'",
            "presentation": {
                "reveal": "always",
                "panel": "new"
            }
        }
    ]
}
```

## Environment Variables

Add to your shell profile:

```bash
# Gemini CLI Configuration
export GEMINI_API_KEY="your-api-key"
export GEMINI_MODEL="gemini-pro"  # or gemini-pro-vision for images
export GEMINI_TEMPERATURE="0.7"
export GEMINI_MAX_TOKENS="8192"

# Custom project settings
export GEMINI_PROJECT_ROOT="$HOME/projects"
export GEMINI_SESSIONS_DIR="$HOME/.gemini-sessions"
export GEMINI_MEMORY_FILE="$HOME/.gemini-memory"

# Timeout settings for long operations
export GEMINI_TIMEOUT_DEFAULT="300"  # 5 minutes
export GEMINI_TIMEOUT_ANALYSIS="900"  # 15 minutes
export GEMINI_TIMEOUT_REVIEW="600"   # 10 minutes
```

## Daily Workflow Example

```bash
# Morning: Start your day
gemini_daily "Good morning! Let's review yesterday's work and plan today."

# Before coding: Initialize feature session
gemini_feature "user-authentication" "Implement JWT-based auth with refresh tokens"

# While coding: Quick consultations
gemini_quick "What's the best way to handle JWT refresh tokens?"

# Before commit: Review changes
gemini_precommit

# After feature: Comprehensive review
gemini_pr_review main

# End of day: Compress and save context
gemini_compress
gemini -p "/memory add 'EOD Summary: Completed auth token implementation, pending tests'"

# Weekly: Architecture review
gemini_weekly
```

## Troubleshooting

### Common Issues

1. **Token Limit Exceeded**
   ```bash
   # Compress the conversation
   gemini_compress
   
   # Or start fresh session
   gemini -p "/chat save archived-$(date +%s)"
   gemini -p "/chat new"
   ```

2. **Session Not Found**
   ```bash
   # List available sessions
   gemini --list-chats
   
   # Create new session if needed
   gemini -p "/chat save session-name"
   ```

3. **Slow Responses**
   ```bash
   # Use timeout for non-critical queries
   timeout 300 gemini -a -p "Your prompt here"
   
   # Or use simpler model
   GEMINI_MODEL="gemini-flash" gemini -p "Quick question"
   ```

### Debug Mode
```bash
# Enable verbose output
export GEMINI_DEBUG="true"
gemini -p "Test prompt"

# Check configuration
gemini --config
```

## Best Practices

1. **Session Management**
   - Use descriptive session names
   - Regularly compress long sessions
   - Archive completed feature sessions

2. **Memory Usage**
   - Store key decisions in memory
   - Don't duplicate conversation in memory
   - Clean up memory periodically

3. **Integration**
   - Start small with aliases
   - Add functions as needed
   - Integrate with existing tools gradually

4. **Security**
   - Never commit API keys
   - Be cautious with sensitive code
   - Review Gemini's suggestions critically

---

*Remember: Gemini CLI is a tool to enhance your development, not replace your judgment. Always review and understand suggested changes before applying them.*