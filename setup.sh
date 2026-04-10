#!/bin/bash

# Setup script for Demo Next.js App with AI Repair

set -e

echo "🚀 Setting up Demo Next.js App with AI Repair..."
echo ""

# Check Node.js
echo "✓ Checking Node.js..."
node --version

# Check Python
echo "✓ Checking Python..."
python3 --version

# Install npm dependencies
echo ""
echo "📦 Installing npm dependencies..."
npm install

# Install Python dependencies
echo ""
echo "🐍 Installing Python dependencies..."
pip install -r ai-repair/requirements.txt

# Run initial checks
echo ""
echo "🧪 Running CI checks (this will fail - that's expected!)..."
npm run ci || true

echo ""
echo "✅ Setup complete!"
echo ""
echo "📚 Next steps:"
echo "1. Read README-AI-REPAIR.md for detailed information"
echo "2. Set ANTHROPIC_API_KEY secret in GitHub repo settings"
echo "3. Push to GitHub: git push origin main"
echo "4. Watch the Magic: GitHub Actions → AI Pipeline Repair workflow"
echo ""
echo "💡 To trigger AI repair manually:"
echo "   gh workflow run ai-repair.yml -f run_id=<FAILED_RUN_ID>"
echo ""
