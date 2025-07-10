# Complete Workflow Integration for Claude Code + Gemini

Full development cycle examples showing how all the pieces work together.

## 🎬 Complete Feature Development Workflow

```
From now on, when I ask you to build any feature, follow this complete Gemini-integrated workflow:

1. FEATURE PLANNING (Before any code):
   echo "Feature request: [exactly what user asked for]" | gemini -p "
   /chat save feature-[feature-name]-$(date +%s)
   
   Break this down into:
   1. Core requirements
   2. Technical components needed
   3. Security considerations
   4. Database changes
   5. API endpoints
   6. Frontend components
   7. Test scenarios
   8. Potential edge cases
   9. Performance concerns
   10. Suggested implementation order"

2. ARCHITECTURE CONSULTATION:
   echo "Feature: [feature name]
   Gemini's breakdown: [summary from step 1]
   Current architecture: [brief description]
   
   How to integrate without breaking existing patterns?" | 
   gemini -p "/chat resume architecture-master-$(date +%Y%m%d)"

3. SECURITY PLANNING:
   echo "Feature security review: [feature name]
   Data handled: [what data types]
   User interactions: [how users interact]
   
   Security requirements and potential vulnerabilities?" | 
   gemini -p "/chat resume security-master-$(date +%Y%m%d)"

4. IMPLEMENTATION:
   For EACH component from the plan:
   
   a) Before coding:
      echo "Implementing: [component name]
      Purpose: [what it does]
      Interfaces with: [other components]
      
      Best practices and patterns?" | gemini -p "Implementation guidance"
   
   b) After coding:
      echo "[show the code]
      
      Review for improvements and issues" | gemini -p "Code review"
   
   c) Security check:
      echo "[show the code]
      
      Security vulnerabilities?" | gemini -p "/chat resume security-master-$(date +%Y%m%d)"

5. TESTING:
   echo "Feature implemented: [feature name]
   Components: [list components]
   
   Generate comprehensive test suite" | gemini -p "Create test plan and tests"

6. FINAL REVIEW:
   git diff [start-commit]..HEAD | gemini -p "
   Final review of feature implementation.
   Check: completeness, security, performance, best practices"

7. DOCUMENTATION:
   echo "Feature completed: [feature name]
   What it does: [functionality]
   
   Generate user-facing documentation" | gemini -p "Create documentation"

Show me the plan after step 1, then proceed with implementation.
```

## 🐛 Complete Bug Fix Workflow

```
When I report any bug, follow this comprehensive debugging workflow:

1. INITIAL DIAGNOSIS:
   echo "Bug report: [user's description]
   Symptoms: [what's happening]
   Expected: [what should happen]
   
   Diagnostic plan?" | gemini -p "/chat save bug-$(date +%s)"

2. REPRODUCE & INVESTIGATE:
   # Try to reproduce, then:
   echo "Bug reproduction results:
   [What you found]
   Error messages: [any errors]
   
   Where to investigate next?" | gemini -p "Guide investigation"

3. ROOT CAUSE ANALYSIS:
   echo "Investigation findings:
   [List what you discovered]
   Suspected cause: [your hypothesis]
   
   Confirm root cause?" | gemini -p "Verify root cause"

4. FIX PLANNING:
   echo "Root cause: [confirmed cause]
   Affected code: [what needs changing]
   
   Best fix approach? Side effects to watch?" | 
   gemini -p "Plan bug fix"

5. IMPLEMENTATION:
   # Implement fix, then:
   echo "Bug fix implemented:
   [Show the fix]
   
   Is this correct and complete?" | gemini -p "Verify fix"

6. REGRESSION PREVENTION:
   echo "Bug fixed: [description]
   Root cause: [cause]
   
   Write tests to prevent regression" | gemini -p "Generate regression tests"

7. SIMILAR ISSUES CHECK:
   echo "Fixed bug pattern: [pattern description]
   
   Other places with similar code?" | gemini -p "Find similar vulnerabilities"

Report progress at each step.
```

## 🔄 Daily Development Cycle

```
Implement this daily development cycle with Gemini:

MORNING STARTUP:
1. echo "Starting work on project: $(basename $(pwd))
   git status: $(git status -s)
   
   Yesterday's work: $(git log --oneline -5)
   
   Today's priorities?" | gemini -p "/chat resume daily-dev"

2. echo "Pending tasks: [list any known tasks]
   
   Optimal order of work?" | gemini -p "Plan daily tasks"

DURING DEVELOPMENT:
- Every 30 minutes: Run the automated checks from automated-checks.md
- Before each task: Consult relevant master (security/architecture/performance)
- After each completion: Quick review with Gemini

BEFORE BREAKS:
echo "Work checkpoint:
Completed: [what you finished]
In progress: [current state]
Next: [what's next]

Anything to reconsider?" | gemini -p "Checkpoint review"

END OF DAY:
echo "Daily summary:
Completed: [list completions]
Challenges: [any issues faced]
Tomorrow: [planned work]

Key learnings? Architecture concerns?" | 
gemini -p "/memory add Daily summary: $(date)"

This maintains continuous quality and knowledge transfer.
```

## 🚀 Sprint/Project Kickoff Workflow

```
When starting a new project or sprint:

1. PROJECT INITIALIZATION:
   echo "New project: [project name]
   Type: [web app/API/etc]
   Requirements: [key requirements]
   Tech preferences: [any specified tech]
   
   Recommend architecture and setup" | 
   gemini -p "/chat save project-[name]-kickoff"

2. SETUP ALL MASTERS:
   # Run all from initial-setup.md to create specialized sessions

3. ARCHITECTURE PLANNING:
   echo "Project: [name]
   Gemini's recommendations: [from step 1]
   
   Detailed architecture plan with:
   - Directory structure
   - Key components
   - Data flow
   - Security architecture
   - Scalability approach" | 
   gemini -p "/chat resume architecture-master-$(date +%Y%m%d)"

4. TECH STACK VALIDATION:
   echo "Planned stack:
   [List each technology choice]
   
   Validate choices and suggest alternatives if needed" | 
   gemini -p "Validate technology choices"

5. INITIAL SCAFFOLDING:
   For each core component:
   echo "Scaffolding: [component]
   Role: [what it does]
   
   Best initial structure?" | gemini -p "Guide scaffolding"

6. DEVELOPMENT PATTERNS:
   echo "Establish patterns for:
   - Error handling
   - Logging
   - Authentication
   - API responses
   - Database access
   
   Show examples for this stack" | 
   gemini -p "Establish project patterns"

This ensures projects start with best practices built-in.
```

## 🔍 Code Review Workflow

```
When you finish any significant code change:

1. SELF-REVIEW WITH GEMINI:
   git diff | gemini -p "Pre-review checklist:
   - Logic errors?
   - Security issues?
   - Performance problems?
   - Missing edge cases?
   - Test coverage?"

2. ARCHITECTURE CONSISTENCY:
   git diff --name-only | gemini -p "/chat resume architecture-master-$(date +%Y%m%d)
   Changed files: [list]
   
   Architecture consistency check"

3. SECURITY AUDIT:
   git diff | gemini -p "/chat resume security-master-$(date +%Y%m%d)
   Security audit required.
   Flag any vulnerabilities."

4. PERFORMANCE IMPACT:
   echo "Changes made: [summary]
   Key algorithms: [list any loops/queries]
   
   Performance impact assessment" | 
   gemini -p "/chat resume performance-master-$(date +%Y%m%d)"

5. TEST COMPLETENESS:
   echo "Feature/fix: [what was built]
   Tests written: [list tests]
   
   Missing test scenarios?" | gemini -p "Test coverage review"

6. FINAL APPROVAL:
   echo "All reviews complete:
   - Security: [status]
   - Architecture: [status]
   - Performance: [status]
   - Tests: [status]
   
   Ready to commit?" | gemini -p "Final review approval"

Only proceed with commit after all checks pass.
```

## 🔄 Refactoring Workflow

```
When code needs refactoring:

1. REFACTORING PLANNING:
   echo "Need to refactor: [what and why]
   Current issues: [problems]
   Goals: [desired outcome]
   
   Refactoring strategy?" | 
   gemini -p "/chat save refactor-$(date +%s)"

2. RISK ASSESSMENT:
   echo "Refactoring plan: [Gemini's strategy]
   Affected areas: [what touches this code]
   
   Risk assessment and mitigation?" | 
   gemini -p "Refactoring risk analysis"

3. INCREMENTAL APPROACH:
   echo "Full refactoring scope: [all changes needed]
   
   Break into safe incremental steps" | 
   gemini -p "Plan incremental refactoring"

4. EACH REFACTOR STEP:
   a) Before:
      echo "Refactor step [N]: [what you're changing]
      
      Safety checks?" | gemini -p "Pre-refactor verification"
   
   b) After:
      git diff | gemini -p "Verify refactor correctness"
   
   c) Test:
      echo "Refactored: [what changed]
      
      Tests to verify behavior unchanged?" | 
      gemini -p "Generate refactor tests"

5. COMPLETION REVIEW:
   git diff [start]..HEAD | gemini -p "
   Full refactoring review.
   Verify: goals met, no regressions, improvements achieved"

This ensures safe, effective refactoring.
```

## 🚨 Production Issue Workflow

```
When production issues occur:

1. IMMEDIATE TRIAGE:
   echo "PRODUCTION ISSUE: [symptoms]
   Impact: [who/what affected]
   Recent changes: $(git log --oneline -10)
   
   Triage and immediate mitigation?" | 
   gemini -p "URGENT: Production triage"

2. DIAGNOSTIC DATA:
   echo "Issue: [description]
   Gemini suggests checking: [from step 1]
   
   What diagnostic commands to run?" | 
   gemini -p "Production diagnostics"

3. ROOT CAUSE:
   echo "Diagnostic results:
   [paste results]
   
   Root cause analysis" | 
   gemini -p "Production RCA"

4. FIX APPROACH:
   echo "Root cause: [identified cause]
   Production constraints: [what we can't break]
   
   Safest fix approach?" | 
   gemini -p "Production fix strategy"

5. VALIDATION:
   echo "Fix prepared: [show fix]
   
   Verify safe for production?" | 
   gemini -p "Production fix validation"

6. POST-MORTEM:
   echo "Incident summary:
   - Issue: [what happened]
   - Cause: [root cause]
   - Fix: [what fixed it]
   - Timeline: [key times]
   
   Lessons learned? Prevention measures?" | 
   gemini -p "Incident post-mortem"

This ensures rapid, safe production fixes.
```

## 📊 Weekly Review Workflow

```
Every week, run this comprehensive review:

1. WEEK SUMMARY:
   git log --oneline --since='1 week ago' | 
   gemini -p "Weekly development summary.
   Key achievements? Patterns noticed?"

2. ARCHITECTURE HEALTH:
   find . -name "*.py" -o -name "*.js" | xargs wc -l | sort -rn | head -20 |
   gemini -p "/chat resume architecture-master-$(date +%Y%m%d)
   Code growth patterns. Architecture health check."

3. SECURITY POSTURE:
   git diff HEAD~50..HEAD | 
   gemini -p "/chat resume security-master-$(date +%Y%m%d)
   Weekly security review. Any concerns?"

4. TECHNICAL DEBT:
   echo "Known issues:
   [list any known problems]
   
   Code smells noticed:
   [any patterns you've seen]
   
   Technical debt assessment" | 
   gemini -p "Technical debt prioritization"

5. LEARNING POINTS:
   echo "This week's challenges:
   [list key challenges]
   
   Mistakes made:
   [any errors or suboptimal choices]
   
   Learning summary and improvement suggestions" | 
   gemini -p "Weekly learning extraction"

6. NEXT WEEK PLANNING:
   echo "Upcoming work: [planned features/fixes]
   Current velocity: [what you accomplished]
   
   Optimal plan for next week?" | 
   gemini -p "Weekly planning"

This maintains long-term code health and continuous improvement.
```

## ✅ Workflow Integration Confirmation

```
Confirm full workflow integration:

1. Tell me you understand all workflows:
   - Feature development (planning → implementation → review)
   - Bug fixing (diagnosis → fix → prevention)
   - Daily cycles (morning → development → evening)
   - Code reviews (multi-aspect checking)
   - Production issues (triage → fix → post-mortem)

2. Demonstrate by describing what you'd do if I said:
   "Build a user authentication feature"
   (Show first 5 Gemini consultations you'd run)

3. Confirm you'll:
   - Follow complete workflows automatically
   - Consult Gemini at each decision point
   - Never skip security/architecture reviews
   - Maintain continuous improvement cycles

Once confirmed, we'll develop with senior-level guidance throughout.
```

## 💡 Remember

- These workflows compound - each cycle improves the next
- Gemini maintains context across sessions
- Follow workflows completely - each step prevents future issues
- The goal is not just working code, but excellent, maintainable code
- With Gemini integration, you develop with the wisdom of an entire team