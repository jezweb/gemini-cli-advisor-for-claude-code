# Gemini MCP Quick Reference

## 🚀 Installation & Setup

```bash
# 1. Keep Gemini CLI updated (do regularly)
npm install -g @google/gemini-cli

# 2. Check Gemini is working
gemini --version

# 3. Model info (commands auto-select optimal model)
# Default: gemini-2.5-flash (avoids rate limits)
# Complex tasks: gemini-2.5-pro (may hit limits)

# 4. Authenticate (personal Gmail only, not workspace)
gemini auth

# 5. Install MCP server
claude mcp add gemini-cli -s user -- npx -y gemini-mcp-tool

# 6. Optional: Install custom slash commands
./gemini-setup.sh
```

## 💬 Basic Usage in Claude Code

**Direct Commands (no setup needed):**
```
"Use gemini to analyze index.js"
"Ask gemini to create a test file" 
"Have gemini explain this error"
"Use gemini to review this code for security issues"
```

## ⚡ Custom Slash Commands (20 total after setup)

### Core Commands (8) 
✨ **Using Flash (Fast, No Rate Limits)**
- `/gemini-review` - Code review with project context
- `/gemini-explain` - Explain code with dependencies context
- `/gemini-fix` - Debug with full project awareness
- `/gemini-function` - Generate functions matching your style
- `/gemini-test` - Generate comprehensive tests
- `/gemini-ask` - Context-aware questions
- `/gemini-implement` - Implement suggestions
- `/gemini-verify` - Verify changes

🧠 **Using Pro (Deep Analysis, Watch Rate Limits)**
- `/gemini-plan` - Project-aware architecture planning
- `/gemini-approach` - Best practice advice with context
- `/gemini-security` - Security audit with configs
- `/gemini-audit` - Project-wide security audit
- `/gemini-optimize` - Performance analysis
- `/gemini-refactor` - Architectural improvements
- `/gemini-proceed` - Validate major decisions

### Response Handlers (4)
- `/gemini-implement` - Implement Gemini's suggestions
- `/gemini-verify` - Check changes match recommendations
- `/gemini-iterate` - Get feedback on changes
- `/gemini-proceed` - Confirm approach before major changes

### Workflow Commands (4)
- `/gemini-fix-cycle` - Complete debugging workflow
- `/gemini-build-cycle` - Feature development workflow
- `/gemini-secure-cycle` - Security hardening workflow
- `/gemini-optimize-cycle` - Performance tuning workflow

## 🛠️ Quick Troubleshooting

**Commands not working?**
```bash
# Check MCP server is installed
claude mcp list

# Verify Gemini is authenticated  
gemini --help

# Restart Claude Code
```

**Rate limit (429 error)?**
```bash
# Commands auto-use flash to avoid this
# If you hit limits on pro commands:
# 1. Wait a bit for rate limit reset
# 2. Or manually switch to flash:
gemini -m gemini-2.5-flash
```

**Workspace account issues?**
- Use personal Gmail only
- Run: `gemini auth`

## 🚀 Example Workflows

### Quick Feature Build
```bash
/gemini-build-cycle
> "Add user notifications"
# Handles: plan → build → test → review → iterate
```

### Fix a Bug Fast
```bash
/gemini-fix-cycle
> "Login form crashes on submit"
# Handles: analyze → fix → verify
```

### Manual Workflow
```bash
1. /gemini-plan → Plan feature
2. /gemini-proceed → Confirm approach
3. Build code...
4. /gemini-review → Get feedback
5. /gemini-implement → Apply suggestions
6. /gemini-verify → Check implementation
```

## 📋 References

- **Gemini MCP Tool:** https://github.com/jamubc/gemini-mcp-tool
- **Usage Examples:** https://jamubc.github.io/gemini-mcp-tool/usage/commands.html
- **Full Documentation:** [MCP-USAGE-GUIDE.md](MCP-USAGE-GUIDE.md)

---
*Keep Gemini CLI updated regularly for best results!*