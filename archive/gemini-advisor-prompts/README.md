# Gemini CLI Coding Advisor Prompts

A collection of structured prompts and patterns for using Google Gemini CLI as an AI coding advisor during web development projects.

## Overview

This repository provides ready-to-use prompts that leverage Gemini CLI's massive context window (1M+ tokens) and session management capabilities to create an effective AI pair programming experience.

## Quick Start

```bash
# Install Gemini CLI if not already installed
# See: https://github.com/google/generative-ai-python/tree/main/google/generativeai/cli

# Simple advice request
gemini -p "how would you implement rate limiting in FastAPI?"

# Load a prompt template
gemini -p "$(cat simple-prompts.md | grep -A10 'Code Review Template' | tail -9)"
```

## Contents

### 📄 [simple-prompts.md](simple-prompts.md)
Quick, focused prompts for common development tasks:
- Code reviews
- Bug diagnosis
- Architecture decisions
- Security checks
- Performance optimization tips

### 📄 [pair-coding-prompts.md](pair-coding-prompts.md)
Comprehensive prompts for extended coding sessions:
- Feature development workflows
- Multi-session specialized advisors
- Project initialization patterns
- Continuous code analysis

### 📄 [setup-guide.md](setup-guide.md)
Scripts and instructions for setting up your Gemini CLI environment:
- Bash aliases and functions
- Session management scripts
- Integration with development tools

## Key Concepts

### 1. **Context Management**
Gemini CLI can maintain context across sessions using:
- `/memory` commands for persistent information
- `/chat save` and `/chat resume` for session continuity
- `/compress` for managing token limits

### 2. **Specialized Sessions**
Create focused advisor sessions for different concerns:
- **Security Master**: Vulnerability analysis and fixes
- **Architecture Master**: Design patterns and best practices
- **Performance Master**: Optimization and scalability

### 3. **Integration Points**
These prompts work best when integrated with:
- Git workflows (pre-commit reviews, PR analysis)
- Testing frameworks (test generation, coverage analysis)
- Issue tracking (feature planning, bug fixes)

## Usage Patterns

### Simple Advice (One-off Questions)
```bash
# Quick consultation without affecting main session
timeout 300 gemini -a -p "Question: [your question]
Context: [brief context]
Keep response concise and actionable."
```

### Continuous Advisor (Development Session)
```bash
# Start a feature development session
gemini -p "$(cat pair-coding-prompts.md | grep -A20 'Feature Development Session')"
```

### Code Review Workflow
```bash
# Review staged changes before commit
git diff --staged > /tmp/changes.diff
gemini -p "Review these changes for issues: $(cat /tmp/changes.diff)"
```

## Best Practices

1. **Use Structured Prompts**: Clear sections for context, request, and expected output format
2. **Manage Sessions**: Save important sessions for later resumption
3. **Compress When Needed**: Use `/compress` to maintain context within token limits
4. **Specialize Advisors**: Create separate sessions for security, architecture, etc.
5. **Integrate with Tools**: Connect with your existing development workflow

## Examples

### Morning Routine
```bash
# Review overnight changes and plan the day
git log --oneline --since='yesterday' > /tmp/overnight.txt
gemini -p "Review these overnight changes and suggest today's priorities: $(cat /tmp/overnight.txt)"
```

### Pre-Push Security Check
```bash
# Security review before pushing to remote
git diff origin/main..HEAD > /tmp/branch-changes.diff
gemini -p "Security review of all changes in this branch: $(cat /tmp/branch-changes.diff)"
```

## Contributing

Feel free to add your own prompt patterns and integration scripts. The goal is to build a comprehensive toolkit for AI-assisted development.

## Tips

- Use `timeout` to prevent long-running sessions from blocking
- Add `-a` flag for non-interactive mode in scripts
- Combine with shell functions for reusable workflows
- Keep prompts focused for better results
- Use memory commands to maintain project context

---

*Based on insights from Gemini CLI development partnership experiments*