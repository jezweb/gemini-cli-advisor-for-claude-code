# Gemini CLI Authentication Handling for Claude Code

Prompts and strategies for managing Gemini CLI authentication within Claude Code sessions.

## 🔐 Initial Authentication Setup

### Option 1: Pre-authenticated Environment (Recommended)
```
Before using these Gemini integration prompts, ensure Gemini CLI is authenticated:

1. In your terminal (outside Claude Code), run:
   gemini -p "test"
   
2. If prompted for authentication:
   - Complete the OAuth flow in your browser
   - This creates persistent credentials in ~/.config/gemini/

3. Once authenticated, the credentials persist across sessions

4. Now Claude Code can use Gemini CLI without authentication prompts
```

### Option 2: API Key Authentication
```
For automated environments, use API key authentication instead of OAuth:

1. Get your API key from: https://makersuite.google.com/app/apikey

2. Set environment variable:
   export GEMINI_API_KEY="your-api-key-here"
   
3. Add to your shell profile:
   echo 'export GEMINI_API_KEY="your-api-key-here"' >> ~/.bashrc

This avoids interactive OAuth flows entirely.
```

## 🤖 Claude Code Prompts for Auth Handling

### Detection and Guidance Prompt
```
When using Gemini CLI, first check authentication status:

1. Test Gemini availability:
   timeout 5 gemini -p "Say 'authenticated'" 2>&1 | grep -E "(authenticated|auth|login)"

2. If you see authentication errors, inform me:
   "Gemini CLI requires authentication. Please run 'gemini -p test' in your terminal outside Claude Code to complete the OAuth flow, then return here."

3. If authenticated, confirm:
   "Gemini CLI is authenticated and ready to use."

Never attempt to handle OAuth flows directly - always guide me to authenticate outside Claude Code.
```

### Environment Variable Check
```
Before using Gemini integration, check for API key:

1. Check if API key is set:
   if [ -n "$GEMINI_API_KEY" ]; then
       echo "Using Gemini API key authentication"
   else
       echo "No API key found. Checking for OAuth credentials..."
       if [ -f ~/.config/gemini/credentials.json ]; then
           echo "OAuth credentials found"
       else
           echo "Please authenticate Gemini CLI first (see instructions)"
       fi
   fi

2. Test connection:
   timeout 5 gemini -p "test" >/dev/null 2>&1 && echo "Gemini ready" || echo "Gemini auth required"
```

## 🔄 Session Management Strategies

### Persistent Sessions Approach
```
To avoid authentication issues with Gemini sessions:

1. Use non-interactive mode for all Gemini calls:
   gemini -n -p "your prompt"  # -n flag prevents interactive prompts

2. Set timeout for all commands:
   timeout 30 gemini -n -p "your prompt"

3. If timeout occurs, assume auth is needed:
   echo "Gemini command timed out - possible auth required"
```

### Fallback Handling
```
Implement graceful fallbacks when Gemini is unavailable:

1. Wrap all Gemini calls:
   run_gemini() {
       local prompt="$1"
       local output
       
       if output=$(timeout 10 gemini -n -p "$prompt" 2>&1); then
           echo "$output"
       else
           echo "⚠️ Gemini unavailable - proceeding without AI advisor"
           echo "Reason: $output" >&2
           return 1
       fi
   }

2. Use the wrapper:
   if ! gemini_advice=$(run_gemini "Review this code: $code"); then
       echo "Continuing without Gemini review"
   fi
```

## 📝 Modified Initial Setup Prompt

### Auth-Aware Setup Prompt
```
Let's set up Gemini CLI integration with proper authentication handling:

1. First, check Gemini authentication status:
   # Check for API key
   [ -n "$GEMINI_API_KEY" ] && echo "✓ API key found" || echo "✗ No API key"
   
   # Test Gemini connection
   if timeout 5 gemini -n -p "test" >/dev/null 2>&1; then
       echo "✓ Gemini CLI is authenticated and working"
   else
       echo "✗ Gemini CLI requires authentication"
       echo ""
       echo "Please choose one option:"
       echo "1. Set GEMINI_API_KEY environment variable (recommended for automation)"
       echo "2. Run 'gemini -p test' in your terminal to complete OAuth"
       echo ""
       echo "Once authenticated, let me know and we'll continue setup."
       exit 0
   fi

2. If authenticated, create wrapper function:
   gemini_safe() {
       timeout "${GEMINI_TIMEOUT:-30}" gemini -n -p "$1" 2>&1 || {
           echo "Gemini command failed" >&2
           return 1
       }
   }

3. Now proceed with creating advisor sessions using gemini_safe function
```

## 🛡️ Best Practices for Claude Code

### Do's:
1. ✓ Always use non-interactive mode (-n flag)
2. ✓ Set timeouts on all Gemini commands
3. ✓ Check authentication before starting workflows
4. ✓ Provide clear instructions for manual auth steps
5. ✓ Use API keys for fully automated workflows

### Don'ts:
1. ✗ Don't try to handle OAuth flows in Claude Code
2. ✗ Don't store credentials in code
3. ✗ Don't assume Gemini is always available
4. ✗ Don't use interactive commands that expect input

## 🔧 Wrapper Script for Projects

Create a `gemini-setup.sh` in your project:

```bash
#!/bin/bash
# gemini-setup.sh - Ensures Gemini is ready for the project

check_gemini_auth() {
    echo "Checking Gemini CLI authentication..."
    
    # Check for API key first
    if [ -n "$GEMINI_API_KEY" ]; then
        echo "✓ Using API key authentication"
        return 0
    fi
    
    # Test command
    if timeout 5 gemini -n -p "test" >/dev/null 2>&1; then
        echo "✓ Gemini CLI is authenticated"
        return 0
    else
        echo "✗ Gemini CLI requires authentication"
        echo ""
        echo "To authenticate:"
        echo "1. Run: gemini -p test"
        echo "2. Complete the browser authentication"
        echo "3. Run this script again"
        echo ""
        echo "Or set GEMINI_API_KEY environment variable"
        return 1
    fi
}

# Run check
if check_gemini_auth; then
    echo ""
    echo "Gemini CLI is ready for use!"
    echo "You can now use Claude Code with Gemini integration."
else
    exit 1
fi
```

## 💡 Alternative Approaches

### 1. Pre-authenticated Docker Container
```dockerfile
FROM python:3.11
RUN pip install google-generativeai
ENV GEMINI_API_KEY=${GEMINI_API_KEY}
# Credentials baked into image (for development only)
```

### 2. Local API Proxy
```python
# Run a local proxy that handles auth
# Claude Code talks to localhost:8080 instead of Gemini directly
```

### 3. Credential Helper Script
```bash
# ~/.local/bin/gemini-helper
#!/bin/bash
# Manages credentials and retries
export GEMINI_API_KEY=$(cat ~/.gemini-key 2>/dev/null)
exec gemini "$@"
```

## 🚀 Quick Start for New Projects

Add to project README:

```markdown
## Gemini CLI Setup

This project uses Gemini CLI for AI-assisted development.

### First Time Setup:
1. Install Gemini CLI: `pip install google-generativeai`
2. Choose authentication method:
   - API Key (recommended): `export GEMINI_API_KEY="your-key"`
   - OAuth: Run `gemini -p test` and complete browser auth
3. Verify: `./gemini-setup.sh`

### For Claude Code Integration:
Once authenticated, Gemini will be automatically used for:
- Code reviews
- Architecture decisions  
- Security audits
- Performance optimization
```

---

This approach ensures smooth integration without getting blocked by authentication during Claude Code sessions.