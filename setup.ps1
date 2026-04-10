# Setup script for Demo Next.js App with AI Repair (Windows)

Write-Host "🚀 Setting up Demo Next.js App with AI Repair..." -ForegroundColor Green
Write-Host ""

# Check Node.js
Write-Host "✓ Checking Node.js..." -ForegroundColor Cyan
node --version

# Check Python
Write-Host "✓ Checking Python..." -ForegroundColor Cyan
python --version

# Install npm dependencies
Write-Host ""
Write-Host "📦 Installing npm dependencies..." -ForegroundColor Cyan
npm install

# Install Python dependencies
Write-Host ""
Write-Host "🐍 Installing Python dependencies..." -ForegroundColor Cyan
pip install -r ai-repair/requirements.txt

# Run initial checks
Write-Host ""
Write-Host "🧪 Running CI checks (this will fail - that's expected!)..." -ForegroundColor Cyan
npm run ci; $true  # Ignore error

Write-Host ""
Write-Host "✅ Setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "📚 Next steps:" -ForegroundColor Yellow
Write-Host "1. Read README-AI-REPAIR.md for detailed information"
Write-Host "2. Set ANTHROPIC_API_KEY secret in GitHub repo settings"
Write-Host "3. Push to GitHub: git push origin main"
Write-Host "4. Watch the Magic: GitHub Actions → AI Pipeline Repair workflow"
Write-Host ""
Write-Host "💡 To trigger AI repair manually:" -ForegroundColor Yellow
Write-Host "   gh workflow run ai-repair.yml -f run_id=<FAILED_RUN_ID>"
Write-Host ""
