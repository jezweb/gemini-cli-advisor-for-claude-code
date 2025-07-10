# Claude Code + Gemini CLI Integration Prompts

Ready-to-use prompts that make Claude Code automatically use Gemini CLI as a development advisor.

## 🎯 Purpose

These prompts transform Claude Code into an AI pair programmer that automatically consults Gemini CLI for:
- Architecture decisions
- Security reviews
- Performance optimization
- Bug resolution
- Code quality checks
- Best practices enforcement

## 📁 Contents

1. **[initial-setup.md](initial-setup.md)** - First-time setup prompts
   - Verify Gemini CLI installation
   - Create specialized advisor sessions
   - Initialize project context

2. **[automated-checks.md](automated-checks.md)** - Automatic code checking
   - Security vulnerability scanning
   - Performance issue detection
   - Code quality monitoring
   - Context-aware reviewing

3. **[development-advisor.md](development-advisor.md)** - Development guidance
   - Feature planning assistance
   - Technology decision support
   - Implementation best practices
   - Continuous improvement

4. **[bug-resolution.md](bug-resolution.md)** - Debugging assistance
   - Systematic debug processes
   - Root cause analysis
   - Fix verification
   - Regression prevention

5. **[workflow-integration.md](workflow-integration.md)** - Complete workflows
   - Feature development cycles
   - Code review processes
   - Production issue handling
   - Daily/weekly routines

## 🚀 Quick Start

1. **Initial Setup** (one-time):
   ```
   # Copy and paste all prompts from initial-setup.md into Claude Code
   # This establishes Gemini connections and creates advisor sessions
   ```

2. **Enable Automation**:
   ```
   # Copy and paste the first prompt from automated-checks.md
   # This activates automatic checking for all code changes
   ```

3. **Start Developing**:
   ```
   # Claude Code will now automatically consult Gemini for:
   - Architecture decisions before implementation
   - Security reviews after code changes
   - Performance checks for critical paths
   - Bug diagnosis when errors occur
   ```

## 💡 How It Works

Once activated, Claude Code will:

1. **Before Implementation**: Ask Gemini for best approaches
2. **During Coding**: Check with specialized masters (security/architecture/performance)
3. **After Changes**: Run automated security and quality checks
4. **When Stuck**: Consult Gemini for debugging help
5. **Periodically**: Run architecture health checks

## 📋 Usage Patterns

### For a New Feature
```
User: "Add user authentication to the app"
Claude Code will automatically:
1. Consult Gemini for implementation plan
2. Check security requirements with security-master
3. Review each component with architecture-master
4. Generate comprehensive tests
5. Run final security audit
```

### For Bug Fixing
```
User: "The app crashes when uploading large files"
Claude Code will automatically:
1. Create systematic debug plan with Gemini
2. Analyze error patterns
3. Verify fix completeness
4. Generate regression tests
5. Check for similar issues
```

### For Daily Development
```
Just start working, and Claude Code will:
- Review overnight changes each morning
- Check code quality every 30 minutes
- Consult Gemini before major decisions
- Run security scans on sensitive code
- Compress and save context at day's end
```

## 🔧 Customization

You can modify the prompts to:
- Adjust checking frequency
- Change severity thresholds
- Add project-specific patterns
- Customize advisor specializations
- Modify workflow steps

## ⚡ Best Practices

1. **Let It Run**: Don't interrupt automatic checks
2. **Trust the Process**: Claude Code + Gemini catch issues you might miss
3. **Review Critical Issues**: Always address HIGH/CRITICAL findings
4. **Learn from Patterns**: Notice what Gemini flags repeatedly
5. **Maintain Sessions**: Let Claude Code manage Gemini sessions

## 🔍 Troubleshooting

If Claude Code isn't using Gemini:
1. Verify Gemini CLI is installed: `which gemini`
2. Check API key is set: `echo $GEMINI_API_KEY`
3. Re-run initial setup prompts
4. Ensure you copied complete prompts (not partial)

## 🎓 Advanced Usage

For maximum benefit:
1. Start with initial-setup.md
2. Add automated-checks.md for continuous monitoring
3. Use development-advisor.md for major features
4. Apply bug-resolution.md when issues arise
5. Follow workflow-integration.md for complete cycles

## 📈 Expected Benefits

With full integration active:
- 50% faster feature development
- 80% fewer security vulnerabilities
- Better architecture consistency
- Faster bug resolution
- Continuous code improvement
- Built-in senior developer guidance

---

*These prompts turn Claude Code into an AI pair programmer with the wisdom of senior developers across security, architecture, and performance domains.*