# Development Advisor Prompts for Claude Code

These prompts enable Claude Code to actively consult Gemini for development decisions and implementation guidance.

## 🧠 Enable Proactive Advisory Mode

```
Activate Gemini as your senior development advisor. From now on:

BEFORE implementing any feature or making design decisions:

1. When I ask you to build something, FIRST consult Gemini:
   echo "User wants: [feature description]
   Current tech stack: [detected stack]
   
   Advise on:
   1. Best implementation approach
   2. Potential pitfalls
   3. Security considerations
   4. Performance implications
   5. Recommended patterns" | gemini -p "/chat resume architecture-master-$(date +%Y%m%d)"
   
   Then present me with a plan based on Gemini's advice.

2. For ANY architectural decision:
   echo "Decision needed: [describe the choice]
   Options: [list options you're considering]
   Context: [relevant constraints]
   
   Recommend best option with rationale" | gemini -p "Provide architectural guidance"

3. When encountering multiple ways to implement something:
   echo "Implementation choices:
   Option 1: [approach 1]
   Option 2: [approach 2]
   
   Use case: [what we're building]
   
   Which is better and why?" | gemini -p "Compare and recommend"

Always incorporate Gemini's advice into your implementation strategy.
```

## 🎯 Feature Implementation Advisor

```
When I ask you to implement any feature, follow this Gemini-advised workflow:

1. IMMEDIATELY run planning consultation:
   echo "New feature request: [exact user request]
   
   Please provide:
   1. Break down into tasks
   2. Identify components needed
   3. Suggest data model
   4. Recommend API design
   5. Security requirements
   6. Testing strategy
   7. Performance considerations
   8. Potential edge cases" | gemini -p "/chat save feature-$(date +%s)"

2. Based on Gemini's response, create an implementation plan and show it to me

3. For EACH component you build, consult:
   echo "Building: [component name]
   Purpose: [what it does]
   Interface: [inputs/outputs]
   
   Best practices for this component?" | gemini -p "Guide implementation"

4. After implementing each part:
   echo "[show the code you wrote]
   
   Review for:
   - Correctness
   - Improvements
   - Missing edge cases
   - Performance optimizations" | gemini -p "Review and suggest improvements"

This ensures every feature benefits from senior-level guidance.
```

## 🔧 Technology Decision Advisor

```
Activate Gemini for all technology decisions:

1. When choosing between libraries/frameworks:
   echo "Need to: [what you need to accomplish]
   Options I'm considering:
   - [option 1]: [pros/cons you see]
   - [option 2]: [pros/cons you see]
   
   Current stack: [project stack]
   Constraints: [any limitations]
   
   Which would you recommend?" | gemini -p "Help choose the best option"

2. When deciding on patterns or approaches:
   echo "Design decision needed:
   Requirement: [what needs to be built]
   Patterns applicable: [patterns you're considering]
   
   Trade-offs and recommendation?" | gemini -p "/chat resume architecture-master-$(date +%Y%m%d)"

3. For database schema decisions:
   echo "Data modeling for: [feature/entity]
   Requirements:
   - [requirement 1]
   - [requirement 2]
   
   Current schema: [relevant existing tables]
   
   Suggest optimal schema design" | gemini -p "Design database schema"

Never make technology decisions without Gemini consultation.
```

## 🚀 Implementation Pattern Advisor

```
Use Gemini to ensure consistent, high-quality implementations:

1. When implementing common patterns:
   echo "Need to implement: [pattern name, e.g., 'user authentication']
   Framework: [your framework]
   Requirements: [specific needs]
   
   Show me the modern, secure way to implement this" | gemini -p "Provide implementation example"

2. For API endpoint design:
   echo "API endpoint needed:
   Purpose: [what it does]
   Data flow: [input -> processing -> output]
   
   Suggest:
   - HTTP method and path
   - Request/response schema
   - Validation rules
   - Error responses
   - Security requirements" | gemini -p "Design REST API endpoint"

3. For complex algorithms:
   echo "Algorithm needed for: [problem description]
   Constraints: [time/space requirements]
   Data size: [expected scale]
   
   Suggest efficient implementation" | gemini -p "Provide algorithm guidance"

Always ask Gemini for the best way to implement standard patterns.
```

## 💡 Learning and Improvement Mode

```
Enable continuous learning from Gemini:

1. After completing any implementation:
   echo "Just implemented: [what you built]
   
   [show the code]
   
   Teaching moment: What could be better? What patterns should I remember?" | 
   gemini -p "Provide learning feedback"

2. When you see me make the same mistake twice:
   echo "Pattern noticed: [describe the repeated issue]
   
   How to avoid this in the future?" | gemini -p "Suggest better habits"

3. Weekly improvement check:
   git log --oneline --since='1 week ago' | gemini -p "
   Review this week's commits. What patterns need improvement?
   What architectural drift do you see?"

Use these insights to improve future implementations.
```

## 🏗️ Architecture Evolution Advisor

```
Consult Gemini for architectural evolution:

1. When code starts feeling messy:
   find . -name "*.py" -o -name "*.js" | xargs wc -l | sort -rn | head -10 | 
   gemini -p "/chat resume architecture-master-$(date +%Y%m%d)
   These are our largest files. Refactoring needed?
   Suggest architectural improvements."

2. When adding features that don't fit well:
   echo "Trying to add: [feature]
   Current structure: [describe architecture]
   Why it's awkward: [the friction you feel]
   
   How should we evolve the architecture?" | gemini -p "Architectural guidance needed"

3. Before major refactoring:
   echo "Planning to refactor: [what and why]
   Current state: [describe current code]
   Goal: [desired outcome]
   
   Best approach? Risks? Migration strategy?" | gemini -p "Guide refactoring approach"

Never refactor without Gemini's architectural guidance.
```

## 🔄 Continuous Improvement Loop

```
Establish a continuous improvement loop with Gemini:

1. Start of each work session:
   echo "Continuing work on: [current feature/task]
   Last session ended with: [where you left off]
   Today's goal: [what you plan to achieve]
   
   Any advice before I continue?" | gemini -p "/chat resume daily-dev"

2. When stuck or unsure:
   echo "I'm stuck on: [problem description]
   What I've tried: [attempts made]
   Error/Issue: [specific problem]
   
   Suggest solutions" | gemini -p "Help me get unstuck"

3. End of work session:
   echo "Today I worked on: [summary]
   Challenges faced: [list challenges]
   Decisions made: [key decisions]
   
   Anything I should reconsider? Notes for tomorrow?" | 
   gemini -p "/memory add Today's progress: [summary]"

This creates a continuous learning and improvement cycle.
```

## 🎨 Code Quality Advisor

```
Use Gemini to maintain high code quality:

1. For every new module/class:
   echo "New [module/class]: [name]
   Purpose: [what it does]
   Initial structure:
   [show outline]
   
   Suggestions for clean, maintainable design?" | gemini -p "Review design"

2. When code feels complex:
   echo "This feels too complex:
   [show code]
   
   How to simplify while maintaining functionality?" | gemini -p "Simplify code"

3. For naming decisions:
   echo "Naming help needed:
   Concept: [what you're naming]
   Context: [where it's used]
   Current ideas: [your naming options]
   
   Best name following conventions?" | gemini -p "Suggest clear naming"

Quality advice should be continuous, not just during reviews.
```

## 🔍 Best Practices Enforcement

```
Have Gemini enforce best practices proactively:

1. When starting any new file:
   echo "Creating new file: [filename]
   Purpose: [what it will contain]
   
   What's the best structure and what patterns should I follow?" | 
   gemini -p "Guide file structure"

2. When implementing user-facing features:
   echo "User feature: [description]
   
   Remind me of:
   - Accessibility requirements
   - Error handling needs
   - Loading states
   - Edge cases to handle" | gemini -p "UX best practices checklist"

3. For any data processing:
   echo "Processing: [data type and operation]
   
   Best practices for:
   - Validation
   - Error handling
   - Performance
   - Memory usage" | gemini -p "Data processing best practices"

Actively seek best practice guidance, don't wait for problems.
```

## ✅ Activation Confirmation

```
Confirm the advisory mode is active by:

1. Telling me you'll now consult Gemini for:
   - All feature implementations
   - Architecture decisions
   - Technology choices
   - Code quality improvements

2. Demonstrating with: "If you asked me to build a user login feature, show me the first three Gemini consultations you'd run"

3. Confirming you'll proactively seek advice when:
   - Starting new features
   - Feeling uncertain
   - Seeing complexity
   - Making design decisions

Once confirmed, Gemini becomes your always-available senior advisor.
```

## 💡 Remember

- Consult BEFORE implementing, not after
- Ask for guidance when uncertain
- Learn from Gemini's patterns
- Incorporate advice immediately
- Build with best practices from the start