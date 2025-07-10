# Bug Resolution Prompts for Claude Code + Gemini

These prompts enable Claude Code to leverage Gemini for effective debugging and problem-solving.

## 🐛 Activate Debug Advisor Mode

```
Enable Gemini as your debugging partner. Whenever I report a bug or you encounter an error:

1. IMMEDIATELY consult Gemini:
   echo "Bug encountered: [error message or description]
   Context: [what was being done when it occurred]
   Stack trace: [if available]
   
   Likely causes and fixes?" | gemini -p "/chat save debug-$(date +%s)"

2. If the cause isn't obvious:
   echo "Debugging: [issue description]
   
   What I've checked:
   - [thing 1]
   - [thing 2]
   
   Still occurring. What else should I investigate?" | gemini -p "Guide debugging process"

3. For persistent issues:
   echo "Stuck on bug: [description]
   Attempts made: [list what you tried]
   Still failing with: [current error]
   
   Suggest different debugging approach" | gemini -p "Alternative debug strategies"

Never spend more than 5 minutes on a bug without consulting Gemini.
```

## 🔍 Systematic Debug Process

```
When debugging any issue, follow this Gemini-guided systematic approach:

1. Initial bug analysis:
   echo "Bug Report:
   Expected: [what should happen]
   Actual: [what's happening]
   Steps to reproduce: [if known]
   Error message: [exact error]
   
   Provide structured debugging approach" | gemini -p "Create debug plan"

2. For each debugging step:
   echo "Debug step [N]: [what you're checking]
   Result: [what you found]
   
   What should I check next?" | gemini -p "Guide next debug step"

3. When finding the root cause:
   echo "Found issue: [root cause]
   Current code: [show problematic code]
   
   Best fix approach? Other places to check for similar issues?" | 
   gemini -p "Recommend fix and prevent recurrence"

This ensures systematic, efficient debugging.
```

## 💥 Error Pattern Recognition

```
Use Gemini to recognize and quickly resolve common error patterns:

1. On ANY error, immediately run:
   echo "Error encountered:
   Type: [error type/name]
   Message: [full error message]
   Code context: [surrounding code]
   
   Is this a common pattern? Quick fix?" | gemini -p "Recognize error pattern"

2. For framework-specific errors:
   echo "[Framework] error: [error message]
   Code: [relevant code]
   
   Common causes and solutions for this [Framework] error?" | 
   gemini -p "Framework-specific debugging"

3. For mysterious behaviors:
   echo "Weird behavior: [describe what's happening]
   Expected: [what should happen]
   Environment: [dev/prod, versions]
   
   What could cause this?" | gemini -p "Diagnose unexpected behavior"

Let Gemini's pattern recognition accelerate debugging.
```

## 🔧 Fix Verification Protocol

```
After implementing any bug fix, verify with Gemini:

1. Verify the fix is correct:
   echo "Bug: [original issue]
   Root cause: [what caused it]
   Fix applied: [show the fix code]
   
   Is this fix correct and complete?" | gemini -p "Verify bug fix"

2. Check for side effects:
   echo "Fixed: [what was fixed]
   Changed: [what code was modified]
   
   Potential side effects or regressions?" | gemini -p "Identify fix side effects"

3. Prevent recurrence:
   echo "Bug fixed: [description]
   Cause: [root cause]
   
   How to prevent similar bugs? What tests to add?" | 
   gemini -p "Prevent bug recurrence"

Never consider a bug fixed without Gemini verification.
```

## 🎯 Performance Issue Debugging

```
For performance-related issues, use specialized Gemini debugging:

1. When things are slow:
   echo "Performance issue: [what's slow]
   Expected time: [rough expectation]
   Actual time: [measured time]
   Scale: [data size/user count]
   
   Likely bottlenecks?" | gemini -p "/chat resume performance-master-$(date +%Y%m%d)"

2. Profile guidance:
   echo "Need to profile: [slow operation]
   
   What metrics to collect? Best profiling approach?" | 
   gemini -p "Guide performance profiling"

3. After profiling:
   echo "Profiling results:
   [paste key metrics]
   
   Interpret results and suggest optimizations" | 
   gemini -p "Analyze performance data"

Performance debugging needs specialized Gemini guidance.
```

## 🔒 Security Issue Resolution

```
For ANY security-related bug, escalate to Gemini immediately:

1. CRITICAL - Security bug detected:
   echo "SECURITY ISSUE: [description]
   Impact: [what's exposed/vulnerable]
   
   Immediate mitigation steps?" | 
   gemini -p "/chat resume security-master-$(date +%Y%m%d) URGENT"

2. Implement fix with guidance:
   echo "Security fix for: [vulnerability]
   Proposed fix: [your approach]
   
   Is this sufficient? What else needed?" | 
   gemini -p "Verify security fix completeness"

3. Post-fix audit:
   echo "Security issue fixed: [what was fixed]
   
   Check for:
   1. Similar vulnerabilities elsewhere
   2. Complete fix verification
   3. Additional hardening needed" | 
   gemini -p "Security fix audit"

NEVER attempt security fixes without Gemini verification.
```

## 🔄 Regression Debugging

```
When bugs reappear or new bugs emerge after changes:

1. Identify regression source:
   git log --oneline -20 | gemini -p "
   Bug appeared: [description]
   Recent commits above.
   
   Which change likely caused this?"

2. Compare working vs broken:
   echo "Regression: [what broke]
   Last working commit: [hash]
   First broken commit: [hash]
   
   Key differences causing issue?" | gemini -p "Diagnose regression"

3. Fix without breaking other things:
   echo "Need to fix: [regression]
   Original change purpose: [why the change was made]
   
   How to fix regression while keeping original functionality?" | 
   gemini -p "Fix regression safely"

Use Gemini to quickly pinpoint and fix regressions.
```

## 🧪 Test-Driven Debugging

```
Use Gemini to create tests that capture and prevent bugs:

1. When fixing any bug:
   echo "Bug fixed: [description]
   Root cause: [cause]
   Fix: [what you changed]
   
   Write test to prevent regression" | gemini -p "Generate regression test"

2. For edge case bugs:
   echo "Edge case bug: [description]
   Scenario: [when it happens]
   
   Generate comprehensive edge case tests" | gemini -p "Create edge case tests"

3. For intermittent bugs:
   echo "Intermittent bug: [description]
   Occurs: [frequency/conditions]
   
   Test strategy to reliably reproduce?" | gemini -p "Test intermittent issues"

Every bug fix should include Gemini-generated tests.
```

## 🚨 Emergency Debug Mode

```
For critical production issues, activate emergency mode:

1. IMMEDIATE triage:
   echo "PRODUCTION DOWN: [symptoms]
   Error logs: [key errors]
   Recent changes: [what changed]
   
   Quick diagnosis and mitigation?" | gemini -p "EMERGENCY DEBUG"

2. Rapid root cause analysis:
   echo "Production issue timeline:
   [time]: [event 1]
   [time]: [event 2]
   
   Root cause analysis" | gemini -p "Emergency RCA"

3. Hotfix guidance:
   echo "Need hotfix for: [critical issue]
   Constraints: [what we can't break]
   
   Safest immediate fix?" | gemini -p "Emergency hotfix approach"

In emergencies, Gemini provides rapid, focused debugging.
```

## 📊 Debug Intelligence Gathering

```
Enhance debugging with Gemini's analytical capabilities:

1. When stuck, gather intelligence:
   echo "Can't solve: [bug description]
   
   What diagnostic information should I collect?" | 
   gemini -p "Debug data collection guide"

2. Log analysis:
   tail -n 100 [logfile] | gemini -p "
   Analyze these logs for issues.
   Context: [what the app was doing]"

3. Pattern detection across bugs:
   echo "Recent bugs:
   1. [bug 1]
   2. [bug 2]
   3. [bug 3]
   
   Common pattern or systemic issue?" | gemini -p "Identify bug patterns"

Use Gemini to see patterns you might miss.
```

## ✅ Debug Mode Activation

```
Confirm debug advisor mode is active:

1. Tell me you'll automatically:
   - Consult Gemini for all errors
   - Follow systematic debug processes
   - Verify all fixes
   - Generate tests for bugs

2. Show me what you'd do for this error:
   "TypeError: Cannot read property 'name' of undefined"

3. Confirm you'll escalate to Gemini:
   - Immediately for security issues
   - After 5 minutes for other bugs
   - For all production issues

Once confirmed, you'll debug efficiently with Gemini's help.
```

## 💡 Remember

- Don't debug alone - Gemini has seen similar issues
- Follow systematic approaches, not random attempts
- Verify fixes prevent recurrence
- Learn from each bug to prevent categories of issues
- In emergencies, Gemini provides calm, expert guidance