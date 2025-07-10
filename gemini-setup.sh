#!/bin/bash

# Gemini CLI Setup Script for Claude Code Integration
# Creates AI-powered development workflow with Gemini as advisor

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
CLAUDE_SETTINGS_DIR="$HOME/.claude/commands"
PROMPTS_FILE="claude-quick-start.txt"
STATUS_FILE="setup-complete.md"
TIMEOUT=300  # 5 minutes

# Helper functions
print_header() {
    echo -e "\n${BLUE}=== $1 ===${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ $1${NC}"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Use standard gemini command
GEMINI_CMD="gemini"

# Detect available CLIs
detect_available_clis() {
    print_info "Detecting available development tools..."
    
    AVAILABLE_CLIS=""
    
    if command_exists git; then
        AVAILABLE_CLIS="$AVAILABLE_CLIS git"
    fi
    
    if command_exists npm; then
        AVAILABLE_CLIS="$AVAILABLE_CLIS npm"
    fi
    
    if command_exists firebase; then
        AVAILABLE_CLIS="$AVAILABLE_CLIS firebase"
    fi
    
    if command_exists gh; then
        AVAILABLE_CLIS="$AVAILABLE_CLIS github"
    fi
    
    if command_exists docker; then
        AVAILABLE_CLIS="$AVAILABLE_CLIS docker"
    fi
    
    if [ -n "$AVAILABLE_CLIS" ]; then
        print_success "Found tools:$AVAILABLE_CLIS"
    else
        print_info "No additional CLI tools detected (that's fine!)"
    fi
}

# No authentication checking - user handles this themselves

# Create MCP-optimized slash commands
create_slash_commands() {
    print_header "Creating MCP-powered slash commands"
    
    mkdir -p "$CLAUDE_SETTINGS_DIR"
    
    local cli_context=""
    if [ -n "$AVAILABLE_CLIS" ]; then
        cli_context="Available dev tools: $AVAILABLE_CLIS. "
    fi
    
    # Enhanced Planning and architecture
    cat > "$CLAUDE_SETTINGS_DIR/gemini-plan.md" << EOF
---
description: Plan features and architecture with full project context
---

Plan this feature or project using Gemini with complete project context.

What do you want to plan or build?

!/gemini-cli:analyze @package.json @*/README.md @src/* "Help plan this feature/project: {input}. ${cli_context}Consider: 1) Existing project architecture and dependencies 2) Best technologies for this tech stack 3) Implementation steps and timeline 4) Potential integration issues 5) Security and performance implications. Provide comprehensive but actionable guidance." model:"gemini-2.5-pro"
EOF
    print_success "Created /gemini-plan command (MCP-enhanced)"
    
    # Context-aware best approach advice
    cat > "$CLAUDE_SETTINGS_DIR/gemini-approach.md" << EOF
---
description: Get best practice advice with full project context
---

Get expert best practice advice from Gemini with project awareness.

What approach question do you have?

!/gemini-cli:analyze @package.json @{selectedText} "{input} ${cli_context}Context: Based on the project's tech stack and selected code, recommend: 1) Best practices specific to this technology 2) Pros/cons of different approaches 3) Implementation strategy with examples 4) Common pitfalls to avoid 5) Performance and security considerations." model:"gemini-2.5-pro"
EOF
    print_success "Created /gemini-approach command (MCP-enhanced)"
    
    # Smart function generation with context
    cat > "$CLAUDE_SETTINGS_DIR/gemini-function.md" << EOF
---
description: Generate functions matching your project's style and dependencies
---

Generate a function that perfectly matches your project's style and uses appropriate dependencies.

What function do you need?

!/gemini-cli:sandbox "Create function: {input}. ${cli_context}Project context: {selectedText}. Requirements: 1) Match existing code style and patterns 2) Use project's existing dependencies appropriately 3) Include proper error handling and validation 4) Add TypeScript types if project uses TypeScript 5) Include comprehensive usage example and JSDoc comments."
EOF
    print_success "Created /gemini-function command (MCP-enhanced)"
    
    # Comprehensive code review with project context
    cat > "$CLAUDE_SETTINGS_DIR/gemini-review.md" << EOF
---
description: Comprehensive code review with full project awareness
---

Review selected code with Gemini using complete project context for thorough analysis.

!/gemini-cli:analyze @{currentFile} @package.json "Comprehensive code review with project context. ${cli_context}Analyze this code for: 1) Security vulnerabilities (input validation, authentication, data exposure) 2) Performance bottlenecks and optimization opportunities 3) Best practices adherence for this tech stack 4) Code maintainability and readability 5) Integration and dependency issues. Flag HIGH and CRITICAL issues with specific fixes."
EOF
    print_success "Created /gemini-review command (MCP-enhanced)"
    
    # Enhanced code explanation with context
    cat > "$CLAUDE_SETTINGS_DIR/gemini-explain.md" << EOF
---
description: Explain code with project and dependency context
---

Get detailed code explanation with full project context and dependency awareness.

!/gemini-cli:analyze @{currentFile} @package.json "Explain this code in detail with project context. ${cli_context}Cover: 1) What the code does and its purpose in the project 2) How it works step-by-step 3) Key concepts, patterns, and technologies used 4) Dependencies and their roles 5) Integration points with other project components. Use clear, educational language suitable for learning."
EOF
    print_success "Created /gemini-explain command (MCP-enhanced)"
    
    # Smart debugging with full context
    cat > "$CLAUDE_SETTINGS_DIR/gemini-fix.md" << EOF
---
description: Smart debugging with complete project context
---

Get expert debugging help with full project awareness and context.

What error or issue are you seeing?

!/gemini-cli:analyze @{currentFile} @package.json "Debug this error: {input}. ${cli_context}Code context provided. Comprehensive analysis: 1) Root cause identification with project context 2) Step-by-step fix with code examples 3) Why this error occurred (education) 4) Prevention strategies and best practices 5) Related code areas that might need attention. Provide working solution."
EOF
    print_success "Created /gemini-fix command (MCP-enhanced)"
    
    # Enhanced security audit with project-wide awareness
    cat > "$CLAUDE_SETTINGS_DIR/gemini-security.md" << EOF
---
description: Security audit with complete project context
---

Perform comprehensive security audit with full project awareness.

!/gemini-cli:analyze @{currentFile} @package.json @*.config.* "Security audit with project context. ${cli_context}Analyze for: 1) Input validation and sanitization issues 2) Authentication and authorization flaws 3) Data exposure and privacy risks 4) Dependency vulnerabilities and outdated packages 5) Configuration and environment security. List only HIGH/CRITICAL issues with specific, actionable fixes and code examples." model:"gemini-2.5-pro"
EOF
    print_success "Created /gemini-security command (MCP-enhanced)"
    
    # Enhanced general questions with context
    cat > "$CLAUDE_SETTINGS_DIR/gemini-ask.md" << EOF
---
description: Ask development questions with project context
---

Ask Gemini any development question with your project context automatically included.

What would you like to ask?

!/gemini-cli:analyze @package.json "Development question: {input}. ${cli_context}Project context provided. Answer considering: 1) Current tech stack and dependencies 2) Project architecture and constraints 3) Best practices for this technology 4) Practical implementation examples 5) Trade-offs, alternatives, and recommendations."
EOF
    print_success "Created /gemini-ask command (MCP-enhanced)"
    
    # NEW: Intelligent test generation
    cat > "$CLAUDE_SETTINGS_DIR/gemini-test.md" << EOF
---
description: Generate comprehensive tests for selected code
---

Generate intelligent, comprehensive tests for the selected code using project context.

!/gemini-cli:analyze @{currentFile} @package.json "Generate comprehensive tests for this code. ${cli_context}Consider: 1) Test framework and testing patterns used in project 2) Edge cases and error conditions 3) Mocking strategies for external dependencies 4) Coverage of all code paths and scenarios 5) Integration test considerations. Include setup, teardown, and clear test descriptions."
EOF
    print_success "Created /gemini-test command (NEW)"
    
    # NEW: Project-wide security audit
    cat > "$CLAUDE_SETTINGS_DIR/gemini-audit.md" << EOF
---
description: Comprehensive project-wide security audit
---

Perform complete project security audit across all files and configurations.

!/gemini-cli:analyze @src/* @package.json @*.config.* @.env.example "Comprehensive project-wide security audit. ${cli_context}Analyze entire project for: 1) Source code vulnerabilities across all files 2) Dependency security issues and outdated packages 3) Configuration security (CORS, headers, environment) 4) Secrets management and exposure risks 5) API security patterns and authentication. Prioritize HIGH/CRITICAL issues with remediation steps." model:"gemini-2.5-pro"
EOF
    print_success "Created /gemini-audit command (NEW)"
    
    # NEW: Performance optimization analysis
    cat > "$CLAUDE_SETTINGS_DIR/gemini-optimize.md" << EOF
---
description: Project-wide performance optimization analysis
---

Analyze entire project for performance optimization opportunities.

!/gemini-cli:analyze @src/* @package.json "Project performance optimization analysis. ${cli_context}Focus on: 1) Code efficiency bottlenecks and algorithmic improvements 2) Database query optimization opportunities 3) Memory usage patterns and potential leaks 4) Bundle size optimization and code splitting 5) Async/await patterns and concurrency improvements. Provide specific, measurable recommendations with implementation examples." model:"gemini-2.5-pro"
EOF
    print_success "Created /gemini-optimize command (NEW)"
    
    # NEW: Intelligent refactoring suggestions
    cat > "$CLAUDE_SETTINGS_DIR/gemini-refactor.md" << EOF
---
description: Get intelligent refactoring suggestions with architectural awareness
---

Get smart refactoring suggestions that consider your entire project architecture.

!/gemini-cli:analyze @{currentFile} @src/* "Intelligent refactoring analysis for this code within project architecture context. ${cli_context}Suggest: 1) Design pattern improvements and SOLID principles application 2) Code organization and structure enhancements 3) Dependency reduction and coupling improvements 4) Performance optimizations and efficiency gains 5) Maintainability and readability improvements. Provide before/after examples." model:"gemini-2.5-pro"
EOF
    print_success "Created /gemini-refactor command (NEW)"
    
    # RESPONSE HANDLER COMMANDS - What to do after Gemini gives advice
    
    # Implement Gemini's suggestions
    cat > "$CLAUDE_SETTINGS_DIR/gemini-implement.md" << EOF
---
description: Implement Gemini's suggestions from previous analysis
---

Take Gemini's recommendations and implement them in the codebase.

What Gemini suggestions should I implement? (paste or describe)

!echo "Implementing Gemini's suggestions: {input}. ${cli_context}Current file context: {selectedText}. I will now implement these recommendations carefully, maintaining code style and ensuring all changes are tested and working properly."
EOF
    print_success "Created /gemini-implement command (RESPONSE HANDLER)"
    
    # Verify implementation matches Gemini's advice
    cat > "$CLAUDE_SETTINGS_DIR/gemini-verify.md" << EOF
---
description: Verify changes match Gemini's recommendations
---

Check if the implemented changes correctly follow Gemini's advice.

!/gemini-cli:analyze @{currentFile} "Verify these changes match the recommendations given earlier. ${cli_context}Check: 1) All suggested changes were implemented correctly 2) No recommendations were missed 3) Implementation follows best practices 4) Changes don't introduce new issues. Compare current code with the original suggestions."
EOF
    print_success "Created /gemini-verify command (RESPONSE HANDLER)"
    
    # Iterate with Gemini on changes
    cat > "$CLAUDE_SETTINGS_DIR/gemini-iterate.md" << EOF
---
description: Show Gemini the changes and get iterative feedback
---

Get Gemini's feedback on the changes made based on previous suggestions.

!/gemini-cli:analyze @{currentFile} @package.json "Review the changes I just made based on your previous suggestions. ${cli_context}Provide feedback on: 1) Whether changes correctly address the original issues 2) Any improvements or adjustments needed 3) New issues that might have been introduced 4) Next steps for further improvement. Be specific and actionable."
EOF
    print_success "Created /gemini-iterate command (RESPONSE HANDLER)"
    
    # Get approval before proceeding
    cat > "$CLAUDE_SETTINGS_DIR/gemini-proceed.md" << EOF
---
description: Confirm approach with Gemini before major changes
---

Get Gemini's approval on your implementation plan before making major changes.

What's your implementation plan?

!/gemini-cli:analyze @{currentFile} @package.json "Review this implementation plan: {input}. ${cli_context}Evaluate: 1) Will this approach solve the problem effectively? 2) Are there better alternatives? 3) What edge cases should be considered? 4) Any risks or dependencies to watch for? Give a clear GO/NO-GO recommendation with reasoning." model:"gemini-2.5-pro"
EOF
    print_success "Created /gemini-proceed command (RESPONSE HANDLER)"
    
    # END-TO-END WORKFLOW COMMANDS - Complete development cycles
    
    # Fix and verify cycle
    cat > "$CLAUDE_SETTINGS_DIR/gemini-fix-cycle.md" << EOF
---
description: Complete fix cycle - identify issues, fix them, verify with Gemini
---

Start a complete debugging cycle with Gemini's guidance.

What issue needs to be fixed?

!echo "Starting fix cycle for: {input}. I'll work with Gemini to: 1) Identify root cause 2) Implement fix 3) Verify solution. Using /gemini-fix for analysis, then implementing changes, then /gemini-verify to confirm."
EOF
    print_success "Created /gemini-fix-cycle command (WORKFLOW)"
    
    # Build and review cycle
    cat > "$CLAUDE_SETTINGS_DIR/gemini-build-cycle.md" << EOF
---
description: Complete build cycle - plan, implement, review, iterate with Gemini
---

Start a complete feature building cycle with Gemini collaboration.

What feature do you want to build?

!echo "Starting build cycle for: {input}. Workflow: 1) Use /gemini-plan for architecture 2) Implement with regular /gemini-review checks 3) /gemini-test for test generation 4) /gemini-iterate for improvements. Creating comprehensive todo list with Gemini checkpoints."
EOF
    print_success "Created /gemini-build-cycle command (WORKFLOW)"
    
    # Security development cycle
    cat > "$CLAUDE_SETTINGS_DIR/gemini-secure-cycle.md" << EOF
---
description: Security-focused development - audit, fix, re-audit with Gemini
---

Start a security-focused development cycle with continuous Gemini auditing.

What code or feature needs security hardening?

!echo "Starting security cycle for: {input}. Process: 1) /gemini-security initial audit 2) Implement all security fixes 3) /gemini-verify each fix 4) /gemini-audit for comprehensive re-check. Following OWASP guidelines with Gemini validation at each step."
EOF
    print_success "Created /gemini-secure-cycle command (WORKFLOW)"
    
    # Performance optimization cycle
    cat > "$CLAUDE_SETTINGS_DIR/gemini-optimize-cycle.md" << EOF
---
description: Performance optimization cycle - analyze, optimize, measure with Gemini
---

Start a performance optimization cycle with Gemini's analysis.

What needs performance optimization?

!echo "Starting optimization cycle for: {input}. Steps: 1) /gemini-optimize for baseline analysis 2) Implement performance improvements 3) /gemini-verify optimizations maintain functionality 4) Measure improvements with Gemini. Creating metrics-driven optimization plan."
EOF
    print_success "Created /gemini-optimize-cycle command (WORKFLOW)"
}

# Generate prompts file
generate_prompts() {
    print_header "Creating copy-paste prompts"
    
    cat > "$PROMPTS_FILE" << EOF
# 🚀 Gemini MCP + Claude Code: Next-Gen AI Development

## ✅ What's Ready

- Gemini MCP server integrated with Claude Code
- 12 intelligent slash commands with project context
- File-aware analysis using @filename syntax
- Project-wide security and performance audits
- Smart code generation with dependency awareness

## 🎯 Prerequisites & Setup

**Required:**
1. Install Gemini MCP server: \`claude mcp add gemini-cli -s user -- npx -y gemini-mcp-tool\`
2. Ensure Gemini CLI is authenticated: \`gemini auth\`
3. Run this setup script to create enhanced commands

## 🔥 How to Activate

### Option 1: One-Line Activation (Recommended)

Copy and paste this into Claude Code:

\`\`\`
Gemini MCP server is my AI development advisor with project-aware capabilities. Available commands:

CORE COMMANDS:
- /gemini-plan - Project-aware feature and architecture planning
- /gemini-approach - Best practices with tech stack context  
- /gemini-function - Smart function generation matching project style
- /gemini-review - Comprehensive code review with dependencies
- /gemini-explain - Detailed code explanation with project context
- /gemini-fix - Smart debugging with full project awareness
- /gemini-security - Security audit with configuration analysis
- /gemini-ask - Context-aware development questions

ADVANCED COMMANDS:
- /gemini-test - Generate comprehensive tests for selected code
- /gemini-audit - Project-wide security audit across all files
- /gemini-optimize - Performance analysis of entire codebase
- /gemini-refactor - Intelligent refactoring with architectural awareness

Use these commands for project-aware AI assistance with automatic file context inclusion.
\`\`\`

### Option 2: Manual MCP Integration

#### For Architecture & Planning:
\`\`\`
Use /gemini-cli:analyze @package.json @src/* for project planning with full context
\`\`\`

#### For Code Analysis:
\`\`\`
Use /gemini-cli:analyze @{currentFile} @package.json for comprehensive code review
\`\`\`

#### For Safe Code Generation:
\`\`\`
Use /gemini-cli:sandbox for generating and testing new functions safely
\`\`\`

## 💡 Enhanced Command Capabilities

### Core Commands (MCP-Enhanced)
- **\`/gemini-plan\`** - Analyzes package.json, README, and source files for context-aware planning
- **\`/gemini-approach\`** - Considers project tech stack and dependencies for tailored advice
- **\`/gemini-function\`** - Uses sandbox mode for safe generation with project style matching
- **\`/gemini-review\`** - Comprehensive analysis including security, performance, and best practices
- **\`/gemini-explain\`** - Project-aware explanations with dependency context
- **\`/gemini-fix\`** - Smart debugging with full project context for better solutions
- **\`/gemini-security\`** - Analyzes code, configs, and dependencies for comprehensive security
- **\`/gemini-ask\`** - Project-aware answers considering your tech stack

### Advanced Commands (NEW)
- **\`/gemini-test\`** - Generates comprehensive tests using project's testing framework
- **\`/gemini-audit\`** - Project-wide security audit across all source files and configs
- **\`/gemini-optimize\`** - Performance analysis of entire codebase with specific recommendations
- **\`/gemini-refactor\`** - Architectural refactoring suggestions considering entire project

## 🚀 Usage Examples

### Planning with Full Context
1. Type: \`/gemini-plan\`
2. Enter: "user authentication with JWT"
3. Gets: Architecture advice based on your package.json dependencies and existing code

### Smart Code Review
1. Open a file in Claude Code
2. Type: \`/gemini-review\`
3. Gets: Security, performance, and best practice analysis with project context

### Intelligent Function Generation
1. Type: \`/gemini-function\`
2. Enter: "email validation with project's existing validation patterns"
3. Gets: Function that matches your existing code style and dependencies

### Project-Wide Security Audit
1. Type: \`/gemini-audit\`
2. Gets: Comprehensive security analysis of all source files, configs, and dependencies

## 🛠️ Pro Tips

- **File Context**: Commands automatically include relevant files (@package.json, @configs, etc.)
- **Project Awareness**: All commands consider your tech stack and dependencies
- **Smart Selection**: Use @src/* for project-wide analysis, @{currentFile} for specific files
- **Sandbox Safety**: Function generation uses safe sandbox environment
- **Multi-file Analysis**: Advanced commands can analyze entire project structure

## 🆘 Troubleshooting

- **Commands not showing?** Restart Claude Code after setup
- **MCP server issues?** Verify: \`claude mcp list\` shows gemini-cli
- **Authentication issues?** Run: \`gemini auth\` to re-authenticate
- **File not found errors?** MCP automatically handles missing files gracefully

## 🔗 MCP Integration Benefits

- ✅ **Native Claude Code integration** - No bash dependencies
- ✅ **File-aware analysis** - Automatic @filename context inclusion  
- ✅ **Large context windows** - Leverage Gemini's full capabilities
- ✅ **Sandbox safety** - Secure code generation and testing
- ✅ **Project intelligence** - Understands your entire codebase
- ✅ **Dependency awareness** - Considers package.json and configs

Happy coding with next-generation AI assistance! 🎉
EOF
    
    print_success "Created $PROMPTS_FILE"
}

# Generate status file
generate_status() {
    cat > "$STATUS_FILE" << EOF
# ✅ Gemini MCP + Claude Code Setup Complete!

Setup completed: $(date)

## 🎯 Prerequisites Met:

### Gemini MCP Server
- ✓ Install command: \`claude mcp add gemini-cli -s user -- npx -y gemini-mcp-tool\`
- ✓ Authentication: \`gemini auth\` (user handles this)
- ✓ File-aware analysis with @filename syntax
- ✓ Sandbox mode for safe code generation

### Enhanced Slash Commands in Claude Code

#### Core Commands (MCP-Enhanced)
| Command | Purpose | MCP Features |
|---------|---------|-------------|
| /gemini-plan | Project-aware feature planning | Analyzes package.json + source files |
| /gemini-approach | Tech stack specific best practices | Considers dependencies + context |
| /gemini-function | Smart function generation | Sandbox mode + style matching |
| /gemini-review | Comprehensive code review | Multi-file security + performance |
| /gemini-explain | Project-aware code explanation | Dependencies + integration context |
| /gemini-fix | Smart debugging with context | Full project awareness |
| /gemini-security | Security audit with configs | Analyzes code + configurations |
| /gemini-ask | Context-aware development questions | Project-specific answers |

#### Advanced Commands (NEW)
| Command | Purpose | Capabilities |
|---------|---------|-------------|
| /gemini-test | Intelligent test generation | Project testing framework aware |
| /gemini-audit | Project-wide security audit | All files + dependency analysis |
| /gemini-optimize | Performance optimization | Entire codebase analysis |
| /gemini-refactor | Architectural refactoring | Project-wide pattern analysis |

### Available Development Tools
$AVAILABLE_CLIS

## 🚀 Next Steps:

### 1. Install MCP Server (If Not Done)
\`\`\`bash
claude mcp add gemini-cli -s user -- npx -y gemini-mcp-tool
\`\`\`

### 2. Authenticate Gemini (If Not Done)
\`\`\`bash
gemini auth
\`\`\`

### 3. Activate in Claude Code
1. **Open Claude Code**
2. **Copy the activation prompt** from \`$PROMPTS_FILE\`
3. **Paste it into Claude Code**
4. **Start developing with next-gen AI assistance!**

## 🧪 Quick Tests:

### Test File Analysis:
1. Open any source file in Claude Code
2. Type: \`/gemini-explain\`
3. See project-aware explanation with dependencies!

### Test Project Planning:
1. Type: \`/gemini-plan\`
2. Enter: "add user authentication"
3. Get architecture advice based on your tech stack!

### Test Security Audit:
1. Type: \`/gemini-audit\`
2. Get comprehensive project-wide security analysis!

## 🔧 Troubleshooting:

- **Commands not appearing?** Restart Claude Code
- **MCP issues?** Verify with: \`claude mcp list\`
- **Auth problems?** Re-run: \`gemini auth\`
- **File errors?** MCP handles missing files gracefully

## 🎉 What's New:

- ✅ **12 intelligent commands** (8 enhanced + 4 new)
- ✅ **Project-wide awareness** using @filename syntax
- ✅ **Automatic context inclusion** (package.json, configs, etc.)
- ✅ **Sandbox safety** for code generation
- ✅ **Multi-file analysis** capabilities
- ✅ **Dependency intelligence** for better recommendations

---
*Gemini MCP integration: Next-generation AI development workflow* 🚀
EOF
    
    print_success "Created $STATUS_FILE"
}

# Main setup flow
main() {
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════╗"
    echo "║     Gemini MCP + Claude Code Setup               ║"
    echo "║    Next-Gen AI Development Workflow              ║"
    echo "╚══════════════════════════════════════════════════╝"
    echo -e "${NC}"
    
    echo "This setup creates 20 intelligent slash commands with:"
    echo "• Smart model selection (flash for speed, pro for depth)"
    echo "• Project-aware AI analysis using @filename syntax"
    echo "• Context-smart code generation and review"  
    echo "• Project-wide security audits and optimization"
    echo "• Intelligent refactoring and test generation"
    echo ""
    echo "Prerequisites (install these first):"
    echo "• Update Gemini CLI: npm install -g @google/gemini-cli"
    echo "• Verify installation: gemini --version"
    echo ""
    echo "• AUTHENTICATION (IMPORTANT - Choose one):"
    echo -e "  ${GREEN}RECOMMENDED:${NC} Use API Key (no browser popups!)"
    echo "  1. Get free key: https://aistudio.google.com/apikey"
    echo "  2. Run: export GOOGLE_API_KEY=\"your-key-here\""
    echo -e "  ${YELLOW}Alternative:${NC} OAuth with: gemini auth (may require re-auth)"
    echo ""
    echo "• Install MCP server: claude mcp add gemini-cli -s user -- npx -y gemini-mcp-tool"
    echo ""
    echo "What you get:"
    echo "• 8 core commands using flash model (fast, no rate limits)"
    echo "• 7 advanced commands using pro model (deep analysis)"
    echo "• 4 response handler commands (implement, verify, iterate, proceed)"
    echo "• 4 workflow commands (fix-cycle, build-cycle, secure-cycle, optimize-cycle)"
    echo "• Smart model selection to avoid rate limits"
    echo "• Complete development workflows with Gemini collaboration"
    echo ""
    
    read -p "Ready to set up next-gen AI development workflow? Press Enter..."
    
    # Detect available tools
    detect_available_clis
    
    # Create commands
    create_slash_commands
    
    # Generate files
    generate_prompts
    generate_status
    
    # Success message
    print_header "🎉 MCP Setup Complete!"
    
    echo "Your next-generation AI development workflow is ready!"
    echo ""
    echo -e "${GREEN}Next steps:${NC}"
    echo "1. Update Gemini CLI: npm install -g @google/gemini-cli"
    echo "2. Verify working: gemini --version"
    echo ""
    echo -e "${GREEN}3. SET UP AUTHENTICATION (Fixes OAuth popup issue!):${NC}"
    echo -e "   ${BLUE}Recommended - API Key:${NC}"
    echo "   • Get key: https://aistudio.google.com/apikey"
    echo "   • Set key: export GOOGLE_API_KEY=\"your-key-here\""
    echo "   • Or run: ./gemini-auth-helper.sh for guided setup"
    echo ""
    echo "4. Install MCP server: claude mcp add gemini-cli -s user -- npx -y gemini-mcp-tool"
    echo "5. Copy activation prompt from: $PROMPTS_FILE into Claude Code"
    echo "6. Start coding with smart model selection!"
    echo ""
    echo -e "${BLUE}Try these enhanced commands:${NC}"
    echo "• /gemini-review (uses flash - fast, no limits)"
    echo "• /gemini-plan (uses pro - deep analysis)"
    echo "• /gemini-build-cycle (smart model switching)"
    echo ""
    read -p "Press Enter to finish..."
}

# Run main function
main "$@"