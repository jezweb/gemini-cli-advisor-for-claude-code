# MCP Migration Plan: Gemini CLI Advisor

## Current State Analysis

### Existing Architecture
- **Current approach**: Bash-based slash commands calling `gemini` CLI directly
- **8 existing commands**: plan, approach, function, review, explain, fix, security, ask
- **Current issues**: Authentication problems, complex timeout handling, bash dependency

### Existing Commands Structure
```
~/.claude/commands/
├── gemini-plan.md      # Architecture planning
├── gemini-approach.md  # Best practices advice  
├── gemini-function.md  # Single function generation
├── gemini-review.md    # Code reviews
├── gemini-explain.md   # Code explanation
├── gemini-fix.md       # Bug fixing
├── gemini-security.md  # Security audits
└── gemini-ask.md       # General questions
```

## Target State: MCP Integration

### MCP Server Capabilities
Based on research of https://jamubc.github.io/gemini-mcp-tool/:

**Available MCP Tools:**
- `/gemini-cli:analyze` - File analysis and code questions
- `/gemini-cli:sandbox` - Safe code execution environment
- `/gemini-cli:help` - Help information
- `/gemini-cli:ping` - Connectivity test

**Key MCP Features:**
- File analysis using `@filename` syntax
- Multiple file selection with wildcards
- Recursive directory scanning
- Sandbox environment for safe testing
- Large token window for complex analysis

## Migration Strategy

### Phase 1: Command Mapping
Map existing bash commands to MCP equivalents:

| Current Command | New MCP Approach | MCP Tool Used |
|----------------|------------------|---------------|
| `/gemini-plan` | Analyze project files + planning prompt | `/gemini-cli:analyze` |
| `/gemini-approach` | Context-aware best practices | `/gemini-cli:analyze` |
| `/gemini-function` | Generate with context | `/gemini-cli:sandbox` |
| `/gemini-review` | File-based code review | `/gemini-cli:analyze` |
| `/gemini-explain` | File-based explanation | `/gemini-cli:analyze` |
| `/gemini-fix` | Debug with file context | `/gemini-cli:analyze` |
| `/gemini-security` | Security audit with files | `/gemini-cli:analyze` |
| `/gemini-ask` | General questions | `/gemini-cli:analyze` |

### Phase 2: Enhanced Commands
Add new MCP-specific capabilities:

| New Command | Purpose | MCP Features Used |
|-------------|---------|-------------------|
| `/gemini-test` | Generate tests | Sandbox + file analysis |
| `/gemini-refactor` | Refactoring suggestions | Multi-file analysis |
| `/gemini-audit` | Project-wide audit | Wildcard file selection |
| `/gemini-optimize` | Performance analysis | Directory scanning |

### Phase 3: Syntax Improvements
Leverage MCP's file selection capabilities:

**Before (Bash):**
```bash
!echo "{selectedText}" | timeout 300 gemini -n -p "Review this code..."
```

**After (MCP):**
```bash
!/gemini-cli:analyze @{currentFile} review this code for security, performance, and best practices
```

## Implementation Plan

### 1. Command Structure Updates
- Replace `!timeout $TIMEOUT $gemini_exec` with `/gemini-cli:analyze` or `/gemini-cli:sandbox`
- Add automatic file selection using `@filename` syntax
- Include project context for better analysis

### 2. User Experience Improvements
- **File Context**: Automatically include relevant files in analysis
- **Project Awareness**: Use package.json and config files for context
- **Better Prompts**: Leverage MCP's larger context window
- **Intelligent Selection**: Auto-detect which files to include

### 3. New Capabilities
- **Multi-file Analysis**: Analyze entire directories
- **Safe Testing**: Use sandbox for code generation
- **Project Scanning**: Recursive analysis for large codebases
- **Context Preservation**: Better state management between calls

## Benefits of MCP Approach

### Technical Benefits
- ✅ **No Authentication Issues**: MCP handles Gemini CLI integration
- ✅ **Better File Handling**: Native support for file analysis
- ✅ **Larger Context**: Leverage Gemini's token window
- ✅ **Sandbox Safety**: Safe code execution environment
- ✅ **Native Integration**: Built into Claude Code

### User Experience Benefits  
- ✅ **Simpler Setup**: One command installation
- ✅ **Better Prompts**: File-aware context
- ✅ **Faster Analysis**: No bash overhead
- ✅ **More Reliable**: No timeout issues
- ✅ **File-centric**: Natural workflow for developers

## Implementation Steps

1. **Create MCP-optimized commands** with file selection
2. **Update setup script** to use MCP syntax
3. **Add project-aware context** for better analysis
4. **Create usage examples** with `@filename` syntax
5. **Update documentation** for MCP workflow
6. **Test integration** with real projects

## Success Criteria
- [ ] All 8 existing commands work with MCP
- [ ] File selection works automatically
- [ ] Project context is included properly
- [ ] Setup process is simplified
- [ ] Documentation is updated
- [ ] Users can install with single command

---
*Next: Implement MCP-optimized slash commands*