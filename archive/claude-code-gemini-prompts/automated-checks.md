# Automated Check Prompts for Claude Code

Copy and paste these to enable automatic Gemini checks during development.

## 🔍 Enable Comprehensive Auto-Checking

```
Enable automatic Gemini consultation for all code changes. From now on:

WHENEVER you write or modify code, you must:

1. BEFORE implementing any function/class/component:
   - First describe what you're about to implement
   - Run: echo "Planning to implement: [description]
     Approach: [your approach]
     Potential issues to consider?" | gemini -p "Provide quick guidance"
   - Incorporate the feedback

2. AFTER writing any code block (>10 lines):
   - Automatically run: echo "[the code you just wrote]" | gemini -p "Quick review:
     1. Security issues? (especially auth, input validation, data exposure)
     2. Performance problems? (n+1, inefficient algorithms, memory leaks)
     3. Better approach? (be concise)"
   - If Gemini flags issues rated HIGH or CRITICAL, fix them before proceeding

3. AFTER modifying any existing function:
   - Run: git diff [filename] | gemini -p "What risks does this change introduce?
     Consider: breaking changes, security, performance, edge cases"

You don't need to show me all Gemini responses, but you MUST:
- Fix any CRITICAL issues immediately
- Mention HIGH issues and ask if I want them fixed
- Proceed with MEDIUM/LOW issues but note them

Acknowledge this pattern and tell me you'll now auto-check all code with Gemini.
```

## 🚨 Critical Path Auto-Protection

```
For these critical areas, ALWAYS consult Gemini before AND after changes:

1. Authentication/Authorization code:
   BEFORE: echo "About to modify auth: [what you're changing]" | gemini -p "/chat resume security-master-$(date +%Y%m%d)
           What security risks should I watch for?"
   AFTER: git diff | gemini -p "/chat resume security-master-$(date +%Y%m%d)
          Security audit these auth changes. Flag any vulnerabilities."

2. Database queries/schemas:
   BEFORE: echo "Database change: [description]" | gemini -p "Risks and best practices?"
   AFTER: echo "[the query/schema]" | gemini -p "Check for: SQL injection, performance, indexes"

3. API endpoints:
   BEFORE: echo "New endpoint: [METHOD] [path] - [purpose]" | gemini -p "Security and design considerations?"
   AFTER: cat [endpoint file] | gemini -p "Audit: auth, validation, rate limiting, CORS"

4. File operations:
   BEFORE: echo "File operation: [read/write] [purpose]" | gemini -p "Security considerations?"
   AFTER: echo "[the code]" | gemini -p "Check: path traversal, permissions, resource leaks"

5. External API calls:
   BEFORE: echo "Calling external API: [which API] for [purpose]" | gemini -p "Security and reliability concerns?"
   AFTER: echo "[the implementation]" | gemini -p "Check: error handling, timeouts, data validation"

Confirm you'll auto-check these critical paths.
```

## 🔄 Continuous Quality Monitoring

```
Implement continuous quality monitoring. Every 10-15 minutes of active development, automatically run:

1. Architecture drift check:
   git diff --name-only HEAD~5..HEAD | gemini -p "/chat resume architecture-master-$(date +%Y%m%d)
   These files changed recently: [file list]
   Are we maintaining architectural consistency?"

2. Security scan of recent changes:
   git diff HEAD~5..HEAD | gemini -p "/chat resume security-master-$(date +%Y%m%d)
   Security scan these accumulated changes. Any concerns?"

3. Complexity check:
   find . -name "*.py" -o -name "*.js" -type f -exec wc -l {} + | sort -rn | head -5 | gemini -p "
   These are our largest files. Any that need refactoring?"

Set a mental timer to run these checks periodically and mention when you do.
```

## 🎯 Smart Context-Aware Checking

```
Make Gemini checks context-aware. Detect what I'm working on and adjust checks accordingly:

1. If working on frontend code:
   - Auto-check for: XSS vulnerabilities, accessibility, performance
   - Run: echo "[component code]" | gemini -p "Check: XSS risks, a11y issues, render performance"

2. If working on backend APIs:
   - Auto-check for: authentication, rate limiting, input validation
   - Run: echo "[endpoint code]" | gemini -p "API security checklist review"

3. If working on database code:
   - Auto-check for: SQL injection, query performance, transaction handling
   - Run: echo "[db code]" | gemini -p "Database safety and performance check"

4. If working on authentication:
   - IMMEDIATELY run comprehensive security check
   - Use security-master session for all reviews

5. If working on payment/financial code:
   - STOP and run: echo "Working on payment code: [description]" | gemini -p "
     CRITICAL financial code review needed. Check for:
     - Security vulnerabilities
     - Precision/rounding errors  
     - Audit trail requirements
     - PCI compliance if applicable"

Acknowledge these context-aware patterns.
```

## 🐛 Proactive Problem Detection

```
Enable proactive problem detection. Without me asking, you should:

1. When you see error-prone patterns:
   echo "[code snippet]" | gemini -p "Is this a common source of bugs? Suggest safer alternative"

2. When you notice code duplication:
   echo "Duplicated logic: [description]" | gemini -p "Best way to DRY this up?"

3. When functions get complex (>30 lines or >3 nesting levels):
   echo "[function code]" | gemini -p "Refactoring needed? Suggest cleaner approach"

4. When you see hardcoded values:
   echo "Hardcoded: [values]" | gemini -p "Should these be configurable? Best practice?"

5. When error handling seems missing:
   echo "[code without try/catch]" | gemini -p "What errors should we handle here?"

Run these checks naturally as you notice issues, without me having to point them out.
```

## 📊 Performance Guard Rails

```
Set up automatic performance guards:

1. For any loop over data from database/API:
   echo "[loop code]" | gemini -p "Performance check: O(n) complexity? N+1 queries? Better approach?"

2. For any recursive function:
   echo "[recursive function]" | gemini -p "Check: stack overflow risk? Tail recursion possible? Iterative better?"

3. For any file processing:
   echo "[file processing code]" | gemini -p "Memory efficient? Handles large files? Streaming needed?"

4. For any real-time features:
   echo "[real-time code]" | gemini -p "Scalability check: WebSocket limits? Polling intervals? Caching strategy?"

5. Before adding new dependencies:
   echo "Adding dependency: [package name]" | gemini -p "Check: bundle size impact? Better alternatives? Security issues?"

These checks should happen automatically when you detect these patterns.
```

## 🔐 Security-First Development

```
Implement security-first checking:

1. NEVER write code that handles user input without running:
   echo "[input handling code]" | gemini -p "Input validation check: injection risks? sanitization needed?"

2. NEVER write auth code without running:
   echo "[auth code]" | gemini -p "/chat resume security-master-$(date +%Y%m%d)
   CRITICAL security review required. Check everything."

3. NEVER handle sensitive data without running:
   echo "[data handling code]" | gemini -p "Sensitive data check: encryption? logging? exposure risks?"

4. For EVERY external API integration:
   echo "[API integration code]" | gemini -p "Security: API key storage? HTTPS? Certificate validation?"

5. For ANY file upload feature:
   echo "[upload code]" | gemini -p "Upload security: file type validation? size limits? path traversal?"

If Gemini finds security issues, you MUST fix them before proceeding. No exceptions.
```

## 🎬 Activation Confirmation

```
To confirm all automated checks are active, please:

1. Tell me which patterns you'll check automatically
2. Demonstrate by showing what you'd check for this code:
   ```python
   def get_user(user_id):
       query = f"SELECT * FROM users WHERE id = {user_id}"
       return db.execute(query)
   ```
3. Explain when you'll run periodic quality checks
4. Confirm you'll fix CRITICAL issues without asking

Once confirmed, these checks will run seamlessly in the background.
```

## 💡 Remember

- You don't need to ask permission to run these checks
- Run them automatically based on context
- Only report HIGH/CRITICAL issues to me
- Fix CRITICAL security issues immediately
- Keep the workflow smooth and unobtrusive