#!/bin/bash

# Gemini CLI Authentication Helper
# Helps users set up either OAuth or API key authentication

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

# Check current authentication status
check_auth_status() {
    print_header "Checking Current Authentication Status"
    
    # Check for existing API keys
    if [[ -n "$GOOGLE_API_KEY" ]]; then
        print_success "GOOGLE_API_KEY is set in environment"
        return 0
    elif [[ -n "$GEMINI_API_KEY" ]]; then
        print_success "GEMINI_API_KEY is set in environment"
        return 0
    elif [[ -f ".gemini/.env" ]] && grep -q "API_KEY" ".gemini/.env" 2>/dev/null; then
        print_success "API key found in .gemini/.env file"
        return 0
    elif [[ -f ".env" ]] && grep -q "API_KEY" ".env" 2>/dev/null; then
        print_success "API key found in .env file"
        return 0
    else
        print_info "No API key configuration found"
    fi
    
    # Try to check OAuth status
    if command -v gemini >/dev/null 2>&1; then
        if gemini auth status 2>/dev/null | grep -q "authenticated"; then
            print_success "OAuth authentication is active"
            return 0
        else
            print_info "OAuth authentication not active"
        fi
    fi
    
    return 1
}

# Setup API key authentication
setup_api_key() {
    print_header "API Key Authentication Setup"
    
    echo "API Key Authentication provides:"
    echo "• Quick setup without browser"
    echo "• 100 requests/day (free tier)"
    echo "• No recurring authentication prompts"
    echo "• Works in CI/CD environments"
    echo ""
    echo "Get your free API key from: https://aistudio.google.com/apikey"
    echo ""
    
    read -p "Do you have a Gemini API key? (y/n): " HAS_KEY
    
    if [[ "$HAS_KEY" != "y" ]]; then
        print_info "Please visit https://aistudio.google.com/apikey to generate a free API key"
        echo "Then run this script again"
        return 1
    fi
    
    echo ""
    echo -n "Enter your Gemini API key: "
    read -s API_KEY
    echo ""
    
    if [[ -z "$API_KEY" ]]; then
        print_error "No API key provided"
        return 1
    fi
    
    print_header "Choose Setup Method"
    echo "1) Temporary (this session only)"
    echo "2) Persistent - Add to shell profile (~/.bashrc or ~/.zshrc)"
    echo "3) Project-specific - Create .gemini/.env file"
    echo "4) Global .env - Create .env file in home directory"
    echo ""
    read -p "Select option (1-4): " OPTION
    
    case $OPTION in
        1)
            export GOOGLE_API_KEY="$API_KEY"
            print_success "API key set for this session"
            print_info "Run 'export GOOGLE_API_KEY=\"$API_KEY\"' to set it again"
            ;;
        2)
            # Detect shell
            if [[ -n "$ZSH_VERSION" ]]; then
                SHELL_RC="$HOME/.zshrc"
            elif [[ -n "$BASH_VERSION" ]]; then
                SHELL_RC="$HOME/.bashrc"
            else
                SHELL_RC="$HOME/.$(basename $SHELL)rc"
            fi
            
            # Add to shell profile
            echo "" >> "$SHELL_RC"
            echo "# Gemini CLI API Key" >> "$SHELL_RC"
            echo "export GOOGLE_API_KEY=\"$API_KEY\"" >> "$SHELL_RC"
            
            # Source it
            export GOOGLE_API_KEY="$API_KEY"
            
            print_success "API key added to $SHELL_RC"
            print_info "Run 'source $SHELL_RC' or restart your terminal"
            ;;
        3)
            mkdir -p .gemini
            echo "GOOGLE_API_KEY=$API_KEY" > .gemini/.env
            print_success "API key saved to .gemini/.env"
            print_info "This will be used when running gemini from this directory"
            ;;
        4)
            echo "GOOGLE_API_KEY=$API_KEY" > "$HOME/.env"
            print_success "API key saved to ~/.env"
            print_info "This will be used globally"
            ;;
        *)
            print_error "Invalid option"
            return 1
            ;;
    esac
    
    # Test the API key
    print_header "Testing API Key"
    export GOOGLE_API_KEY="$API_KEY"
    
    if gemini "test connection" 2>&1 | grep -q "error"; then
        print_error "API key test failed. Please check your key is valid"
        return 1
    else
        print_success "API key is working!"
    fi
}

# Setup OAuth authentication
setup_oauth() {
    print_header "OAuth Authentication Setup"
    
    echo "OAuth Authentication provides:"
    echo "• 1,000 requests/day (10x more than API key)"
    echo "• 60 requests/minute rate limit"
    echo "• Secure token-based auth"
    echo "• Best for development"
    echo ""
    print_warning "Note: OAuth may prompt for re-authentication periodically"
    echo ""
    
    read -p "Continue with OAuth setup? (y/n): " CONTINUE
    
    if [[ "$CONTINUE" != "y" ]]; then
        return 1
    fi
    
    print_info "Opening browser for Google authentication..."
    gemini auth
    
    if gemini auth status 2>/dev/null | grep -q "authenticated"; then
        print_success "OAuth authentication successful!"
    else
        print_error "OAuth authentication failed or was cancelled"
        return 1
    fi
}

# Main menu
main() {
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════╗"
    echo "║        Gemini CLI Authentication Helper          ║"
    echo "╚══════════════════════════════════════════════════╝"
    echo -e "${NC}"
    
    # Check current status
    if check_auth_status; then
        echo ""
        print_success "Authentication is already configured!"
        echo ""
        read -p "Do you want to reconfigure authentication? (y/n): " RECONFIG
        if [[ "$RECONFIG" != "y" ]]; then
            print_info "Keeping current authentication setup"
            exit 0
        fi
    fi
    
    print_header "Choose Authentication Method"
    
    echo "1) API Key (Recommended for reliability)"
    echo "   • No browser needed"
    echo "   • 100 requests/day"
    echo "   • Never expires"
    echo ""
    echo "2) OAuth (Google Account)"
    echo "   • 1,000 requests/day"
    echo "   • Requires browser"
    echo "   • May need periodic re-auth"
    echo ""
    echo "3) View Authentication Comparison"
    echo "4) Exit"
    echo ""
    
    read -p "Select option (1-4): " CHOICE
    
    case $CHOICE in
        1)
            setup_api_key
            ;;
        2)
            setup_oauth
            ;;
        3)
            print_header "Authentication Method Comparison"
            echo "┌─────────────────┬──────────────────┬─────────────────────┐"
            echo "│ Feature         │ API Key          │ OAuth (Google)      │"
            echo "├─────────────────┼──────────────────┼─────────────────────┤"
            echo "│ Daily Limit     │ 100 requests     │ 1,000 requests      │"
            echo "│ Rate Limit      │ Limited          │ 60/minute           │"
            echo "│ Setup           │ Simple           │ Requires browser    │"
            echo "│ Expiration      │ Never            │ Token refresh       │"
            echo "│ Best For        │ CI/CD, Scripts   │ Development         │"
            echo "│ MCP Support     │ Yes              │ Yes (preferred)     │"
            echo "└─────────────────┴──────────────────┴─────────────────────┘"
            echo ""
            read -p "Press Enter to return to menu..."
            main
            ;;
        4)
            print_info "Exiting..."
            exit 0
            ;;
        *)
            print_error "Invalid option"
            main
            ;;
    esac
    
    # Show next steps
    if [[ $? -eq 0 ]]; then
        print_header "Next Steps"
        echo "1. Run 'gemini-mcp-setup' to create Claude Code commands"
        echo "2. Start using Gemini with Claude Code!"
        echo ""
        print_info "If you encounter issues, run this script again"
    fi
}

# Run main function
main