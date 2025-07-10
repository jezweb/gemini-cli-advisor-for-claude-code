# Gemini MCP Advisor for Claude Code

Transform Claude Code into a next-generation AI development environment using Gemini MCP server for project-aware coding assistance.

## 🚀 Quick Start

### Option 1: Install via npm (Recommended)
```bash
# Install globally
npm install -g gemini-mcp-advisor

# Run setup to create 20 slash commands
gemini-mcp-setup
```

### Option 2: Use npx (No Installation)
```bash
# Run directly without installing
npx gemini-mcp-advisor
```

### Option 3: Clone and Run Locally
```bash
# Clone repository
git clone https://github.com/jezweb/gemini-cli-advisor-for-claude-code.git
cd gemini-cli-advisor-for-claude-code

# Run setup
./gemini-setup.sh
```

### Prerequisites (Both Methods)
```bash
# 1. Install/Update Gemini CLI (do this regularly)
npm install -g @google/gemini-cli

# 2. Verify Gemini is working
gemini --version

# 3. Authenticate with personal Gmail (not workspace)
gemini auth

# 4. Install Gemini MCP Server
claude mcp add gemini-cli -s user -- npx -y gemini-mcp-tool
```

### 🎯 Model Selection Strategy

**Smart Model Assignment:**
- **gemini-2.5-flash** (Default) - Used for most commands to avoid rate limits
- **gemini-2.5-pro** - Reserved for complex analysis tasks

Commands automatically use the optimal model:
- ✨ **Flash**: review, explain, fix, test, implement, verify (high-frequency tasks)
- 🧠 **Pro**: plan, audit, security, optimize, refactor, approach (deep analysis)

## 🎯 What This Does

Creates 20 intelligent slash commands that enable complete AI-powered development workflows:

**Core Commands (8)** - Enhanced with project awareness:
- Planning, code generation, reviews, debugging, security audits
- All commands understand your tech stack and dependencies

**Advanced Commands (4)** - Project-wide analysis:
- Test generation, security audits, performance optimization, refactoring
- Analyze entire codebases with architectural awareness

**Response Handlers (4)** - Act on Gemini's advice:
- Implement suggestions, verify changes, iterate on feedback
- Complete the loop from analysis to implementation

**Workflow Commands (4)** - End-to-end development cycles:
- Fix-cycle, build-cycle, secure-cycle, optimize-cycle
- Automated workflows that use multiple Gemini commands

## 🔄 The Workflow Approach

Instead of just finding problems, this setup enables complete development cycles:

1. **Plan** with Gemini's architectural advice
2. **Implement** with continuous Gemini reviews
3. **Verify** changes match recommendations
4. **Iterate** until Gemini approves the solution

This creates a true AI pair programming experience where Gemini actively participates throughout development, not just during code review.

## 💫 Key MCP Advantages

- **Project Intelligence** - Analyzes package.json, configs, and source files automatically
- **File-Aware Analysis** - Uses @filename syntax for context inclusion
- **Sandbox Safety** - Secure code generation and testing environment
- **Large Context Windows** - Leverage Gemini's full analytical capabilities
- **Native Integration** - Built into Claude Code with no bash dependencies
- **Multi-File Analysis** - Understand entire project architecture

## 🛠️ Available Commands (20 Total)

### Core Commands (8) - Enhanced with MCP
- `/gemini-plan` - Project-aware feature and architecture planning
- `/gemini-approach` - Best practices with tech stack context
- `/gemini-function` - Smart function generation matching project style
- `/gemini-review` - Comprehensive code review with dependencies
- `/gemini-explain` - Detailed explanation with project context
- `/gemini-fix` - Smart debugging with full project awareness
- `/gemini-security` - Security audit with configuration analysis
- `/gemini-ask` - Context-aware development questions

### Advanced Commands (4) - Project-Wide Analysis
- `/gemini-test` - Generate comprehensive tests for selected code
- `/gemini-audit` - Project-wide security audit across all files
- `/gemini-optimize` - Performance analysis of entire codebase
- `/gemini-refactor` - Intelligent refactoring with architectural awareness

### Response Handlers (4) - Act on Gemini's Advice
- `/gemini-implement` - Take Gemini's suggestions and implement them
- `/gemini-verify` - Check if changes match Gemini's recommendations
- `/gemini-iterate` - Show Gemini the changes and get feedback
- `/gemini-proceed` - Confirm approach with Gemini before major changes

### Workflow Commands (4) - Complete Development Cycles
- `/gemini-fix-cycle` - Complete debugging: identify → fix → verify
- `/gemini-build-cycle` - Feature development: plan → build → review → iterate
- `/gemini-secure-cycle` - Security hardening: audit → fix → re-audit
- `/gemini-optimize-cycle` - Performance tuning: analyze → optimize → measure

## 📋 Requirements

- **Claude Code** - Latest version with MCP support
- **Node.js** - For Gemini MCP server installation
- **Google Account** - For Gemini CLI authentication

## 🎬 How MCP Integration Works

1. **MCP Server** provides native Gemini integration to Claude Code
2. **Enhanced Commands** automatically include project context (@files)
3. **Claude Code** orchestrates intelligent development workflow
4. **Gemini** analyzes with full project awareness and dependency understanding
5. **You** maintain complete control with superior AI assistance

## 🌟 Perfect For

- **Any Developer** wanting project-aware AI assistance
- **Teams** needing consistent code quality and security practices
- **Complex Projects** requiring architectural guidance and optimization
- **Security-Conscious Development** with comprehensive audit capabilities
- **Performance-Critical Applications** needing optimization insights

## 🔧 Setup Details

**Prerequisites (follow Quick Start above):**
1. **Keep Gemini CLI updated:** Run `npm install -g @google/gemini-cli` regularly
2. **Use latest model:** Ensure you're on gemini-2.5-pro (shows when you run `gemini`)
3. **Personal Gmail only:** Workspace accounts don't work with Gemini CLI
4. **Install MCP server:** `claude mcp add gemini-cli -s user -- npx -y gemini-mcp-tool`

**Setup creates:**
1. 20 intelligent slash commands in 4 categories
2. Complete development workflows with Gemini collaboration
3. File-aware analysis using @filename syntax  
4. Multiple activation options (workflow, simple, custom)

**Three ways to use Gemini:**
- **Direct commands:** "Use gemini to analyze index.js" (no setup needed)
- **Individual commands:** `/gemini-plan`, `/gemini-review`, etc.
- **Workflow commands:** `/gemini-build-cycle` for complete development flows

## 💡 Usage Examples

### Complete Feature Development
```bash
# 1. Start with planning
/gemini-plan
> "add user authentication with JWT"

# 2. Confirm approach
/gemini-proceed
> "Use Passport.js with JWT strategy, PostgreSQL for users"

# 3. Build with continuous review
# ... implement code ...
/gemini-review  # Check progress

# 4. Handle Gemini's feedback
/gemini-implement
> "Add input validation and bcrypt for passwords"

# 5. Verify implementation
/gemini-verify  # Confirms changes match recommendations
```

### Quick Bug Fix Workflow
```bash
# 1. Understand the issue
/gemini-fix
> "TypeError: Cannot read property 'id' of undefined"

# 2. Implement the fix
/gemini-implement
> "Add null check before accessing user.id"

# 3. Verify it's correct
/gemini-verify
```

### Using Workflow Commands
```bash
# Complete development cycle in one command
/gemini-build-cycle
> "Add real-time notifications feature"
# Automatically: plans → implements → tests → reviews → iterates
```

## 🆘 Troubleshooting

**Setup Issues:**
- Ensure Node.js is installed  
- Update Gemini CLI: `npm install -g @google/gemini-cli`
- Use personal Gmail (not workspace): `gemini auth`
- Check model version: `gemini` should show gemini-2.5-pro

**Commands Not Showing:**
- Restart Claude Code after setup
- Verify MCP server: `claude mcp list` should show `gemini-cli`
- Re-install if needed: `claude mcp add gemini-cli -s user -- npx -y gemini-mcp-tool`

**Model & Rate Limit Issues:**
- **Rate limit (429 error)?** Commands automatically use flash for most tasks
- **Need different model?** Set manually: `gemini -m gemini-2.5-flash`
- **Complex task failing?** May need pro model - wait for rate limit reset
- **Workspace account?** Use personal Gmail instead

**Integration Tips:**
- Try direct commands first: "Use gemini to analyze this file"
- MCP handles missing files gracefully
- Large projects may take longer to analyze

## 🎉 Get Started

### Via npm (Easiest)
```bash
npm install -g gemini-mcp-advisor
gemini-mcp-setup
```

### Manual Steps
1. **Prerequisites:** Complete all steps in Prerequisites section above
2. **Install package:** `npm install -g gemini-mcp-advisor`
3. **Run setup:** `gemini-mcp-setup`
4. **Choose activation method:**
   - **Full Workflow:** Copy Option 1 from generated `claude-quick-start.txt` 
   - **Simple Commands:** Copy Option 2 for basic usage
   - **Custom:** Create your own workflow with Option 3
5. **Start developing:** 
   - Try direct: "Use gemini to analyze this file"
   - Or workflow: `/gemini-build-cycle` for complete features

## 📚 Documentation

- **[Quick Reference](QUICK-REFERENCE.md)** - Fast setup and command cheat sheet
- **[MCP Usage Guide](MCP-USAGE-GUIDE.md)** - Comprehensive command reference and examples

---

*Next-generation AI development with project intelligence and architectural awareness* 🚀