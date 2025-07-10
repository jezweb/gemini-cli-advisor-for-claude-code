# Manual Gemini CLI Installation Guide

If the automatic installation isn't working, here's how to install Gemini CLI manually:

## Option 1: Using pip (Recommended)

Open a terminal and run:

```bash
pip install -U google-generativeai
```

Or if that doesn't work:

```bash
pip3 install -U google-generativeai
```

## Option 2: Using Python directly

```bash
python -m pip install -U google-generativeai
```

Or:

```bash
python3 -m pip install -U google-generativeai
```

## Option 3: Using pipx (Isolated installation)

First install pipx:
```bash
python -m pip install pipx
```

Then install Gemini:
```bash
pipx install google-generativeai
```

## Verify Installation

After installation, test if it works:

```bash
gemini --version
```

If `gemini` command is not found, try:

```bash
python -m gemini --version
```

## Common Issues

### "gemini: command not found"

This usually means Python scripts aren't in your PATH. Try:

1. **Find where it was installed:**
   ```bash
   pip show google-generativeai
   ```

2. **Add to PATH (Windows):**
   - The scripts are usually in: `C:\Users\[YourName]\AppData\Local\Programs\Python\Python3X\Scripts`
   - Add this to your PATH environment variable

3. **Add to PATH (Mac/Linux):**
   - The scripts are usually in: `~/.local/bin`
   - Add to your `.bashrc` or `.zshrc`:
   ```bash
   export PATH="$HOME/.local/bin:$PATH"
   ```

### Alternative: Use Python module directly

If adding to PATH is difficult, create an alias:

```bash
# Add to .bashrc or .zshrc
alias gemini="python -m gemini"
```

## After Installation

Once Gemini CLI is installed, run the setup script again:

```bash
./gemini-setup.sh
```

It should detect that Gemini is installed and continue with the setup.