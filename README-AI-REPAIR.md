# Demo Next.js App with AI Pipeline Repair

This is a demo Next.js application that showcases the **AI Pipeline Repair** system - an automated CI/CD failure detection and fixing agent powered by Claude AI.

## 🎯 What's Included

### Next.js Application
- **Framework**: Next.js 16 with TypeScript
- **Styling**: Tailwind CSS
- **Testing**: Jest + React Testing Library
- **Linting**: ESLint (with intentional errors for demo)
- **CI/CD**: GitHub Actions with 4 parallel jobs

### AI Repair Module
- **Location**: `/ai-repair` directory
- **Language**: Python 3.12 with async/await
- **AI Engine**: Claude Sonnet 4 (via Anthropic API)
- **Features**:
  - Automatic failure detection from CI logs
  - Multi-tool log parsing (ESLint, Jest, pytest, TypeScript, etc.)
  - AI-powered diagnosis and code generation
  - Automated PR creation with fixes

## 🚀 Quick Start

### 1. Install Dependencies
```bash
npm install
```

### 2. Set Up AI Repair
```bash
pip install -r ai-repair/requirements.txt
```

### 3. Create GitHub Secrets
In your repository settings, add:
- `ANTHROPIC_API_KEY`: Your Anthropic API key

### 4. Run Local Tests (Preview)
```bash
# This will FAIL - intentional bugs are present
npm run ci

# Individual checks:
npm run lint        # ESLint errors
npm run type-check  # TypeScript checks
npm run test:coverage  # Jest failures
```

## 🔧 Intentional Issues (for AI Repair Demo)

The app includes deliberate CI failures to demonstrate the repair system:

### 1. **Lint Errors** in `app/components/Button.tsx`
- Missing semicolons
- Improper spacing
- ESLint violations

**Expected AI Fix**: Auto-run `eslint --fix` and `prettier --write`

### 2. **Type Errors**
- TypeScript compilation issues
- Missing type annotations

**Expected AI Fix**: Add proper type definitions

### 3. **Test Failures** in `app/__tests__/Button.test.tsx`
- Failing test case (intentional assertion bug)
- Missing test coverage

**Expected AI Fix**: Fix test implementation, add coverage for Counter component

### 4. **Coverage Gaps**
- `Counter` function has no test coverage
- Coverage threshold: 50% (some files below)

**Expected AI Fix**: Generate missing test cases

## 📊 CI Pipeline

### GitHub Actions Workflows

#### `ci.yml` (Main Pipeline)
```
┌─────────┐   ┌──────────┐   ┌──────┐
│  Lint   │   │Type-Check│   │ Test │
└────┬────┘   └────┬─────┘   └──┬───┘
     └────────────┬──────────────┘
                  ▼
              ┌────────┐
              │ Build  │
              └────────┘
```

**Jobs**:
- `lint`: Runs ESLint, Prettier checks
- `type-check`: TypeScript compilation
- `test`: Jest tests + coverage reporting
- `build`: Next.js build (only if all above pass)

#### `ai-repair.yml` (Auto-Fix Pipeline)
Triggers when CI fails:
1. ✅ Fetches failed CI logs
2. ✅ Parses failures (ESLint, Jest, TS, etc.)
3. ✅ Sends to Claude API for diagnosis
4. ✅ Runs handlers to fix code
5. ✅ Creates PR with fixes
6. ✅ CI re-runs on PR to verify fixes

## 🤖 How AI Repair Works

### Flow Diagram
```
CI Failure
    ↓
[Workflow Triggered]
    ↓
Fetch Logs → Parse → Diagnose (Claude) → Fix → Create PR → Re-run CI
```

### Example: Lint Error Fix

**Original Error**:
```
app/components/Button.tsx:8:23 - Missing semicolon
const handleClick = () => {
```

**AI Repair Pipeline**:
1. Parse error from logs
2. Claude analyzes: "Missing semicolon in arrow function"
3. Run `eslint --fix` → Auto-fix
4. Commit: `fix: auto-fix lint failures from run #12345`
5. Create PR with diff
6. CI re-runs and passes ✅

## 📋 Project Structure

```
.
├── app/                           # Next.js app directory
│   ├── components/
│   │   └── Button.tsx            # Component with intentional bugs
│   ├── __tests__/
│   │   └── Button.test.tsx       # Tests with failing cases
│   └── page.tsx
├── ai-repair/                     # AI Repair Module (copied from source)
│   ├── src/
│   │   ├── main.py              # CLI entry point
│   │   ├── agent.py             # Repair orchestrator
│   │   ├── config.py            # Configuration
│   │   ├── models.py            # Data models
│   │   ├── handlers/            # Failure handlers (lint, test, coverage, validation)
│   │   ├── ai/                  # AI client (Claude)
│   │   ├── providers/           # Git providers (GitHub, GitLab, Bitbucket)
│   │   └── parser/              # CI log parser
│   ├── tests/                   # 46 passing tests
│   ├── requirements.txt         # Python dependencies
│   └── config.yaml             # Default config
├── .github/
│   └── workflows/
│       ├── ci.yml              # Main CI pipeline
│       └── ai-repair.yml       # AI auto-fix pipeline
├── jest.config.ts              # Jest configuration
├── jest.setup.ts               # Jest setup
├── tsconfig.json               # TypeScript config
├── eslint.config.mjs          # ESLint config
└── package.json                # NPM scripts and dependencies
```

## 🧪 Testing the AI Repair System

### Option 1: Wait for Autom trigger
1. Push this repo to GitHub
2. The CI will fail (due to intentional bugs)
3. `ai-repair.yml` workflow triggers automatically
4. Watch it create a PR with fixes

### Option 2: Manual Trigger
```bash
# Get a failed run ID from GitHub CLI or UI
gh run list --workflow ci.yml --status failure --limit 1

# Manually trigger repair
gh workflow run ai-repair.yml -f run_id=<PASTE_RUN_ID>

# Watch the repair
gh run watch
```

### Option 3: Local Test (Preview)
```bash
# Test what would be fixed
cd ai-repair
python -m src.main check-config

# (Will show provider, AI engine, token status)
```

## ✅ What AI Repair Handles

| Failure Type | Handler | Auto-Fix | Where |
|---|---|---|---|
| ESLint errors | LintHandler | ✅ | `eslint --fix` |
| Prettier formatting | LintHandler | ✅ | `prettier --write` |
| Jest failures | TestHandler | ✅ | Fix implementation |
| Coverage gaps | CoverageHandler | ✅ | Generate tests |
| TypeScript errors | LintHandler | ✅ | Type fixes |
| YAML/JSON schema | ValidationHandler | ✅ | Format fixes |

## 🛡️ Safety Guardrails

- ✅ Never modifies test files (only source code)
- ✅ Skips if AI confidence < 30%
- ✅ Limits diff to 500 lines (prevents oversized changes)
- ✅ Never auto-merges (requires human review)
- ✅ Prevents loops (skips `ai/fix/*` branches)

## 📚 Documentation

For detailed information:
- [AI Repair README](./ai-repair/README.md)
- [Architecture](./ai-repair/docs/ARCHITECTURE.md)
- [Log Parser Patterns](./ai-repair/src/parser/log_parser.py)

## 🔐 Requirements

### API Keys
- `ANTHROPIC_API_KEY`: Found at [console.anthropic.com](https://console.anthropic.com)

### Permissions
- `GITHUB_TOKEN`: Auto-provided by GitHub Actions
- Repository must allow AI Repair workflow to:
  - Read CI logs
  - Create branches
  - Create pull requests
  - Push commits

## 🚨 Known Issues

Current intentional failures for demo:
1. ❌ `Button.tsx` has lint errors (missing semicolon, spacing)
2. ❌ `Button.test.tsx` has a failing test case
3. ❌ `Counter` component has no test coverage
4. ❌ Coverage threshold not met

**Action**: Run `npm run ci` to see all failures

## 🎓 Learning Path

1. **See the failures**: `npm run ci`
2. **Understand the pipeline**: Review `.github/workflows/`
3. **Inspect the repair module**: Check `ai-repair/src/`
4. **Deploy to GitHub**: Push to your repo
5. **Watch AI fix it**: Observe `ai-repair.yml` in Actions tab
6. **Review the PR**: Check generated fix PR
7. **Merge and verify**: Tests pass on fixed code ✅

## 💡 Customization

### Change AI Model
Edit `ai-repair/config.yaml`:
```yaml
ai:
  model: claude-opus-4-1  # Change here
```

### Add More Failure Types
1. Create new handler in `ai-repair/src/handlers/`
2. Implement `can_handle()` and `fix()` methods
3. Add to factory in `ai-repair/src/handlers/factory.py`
4. Add test patterns to `ai-repair/src/parser/log_parser.py`

### Customize CI Jobs
Edit `.github/workflows/ci.yml` to add:
- Sonarqube scanning
- Security audits (npm audit, Snyk)
- Performance tests
- E2E tests

## 📞 Support

For issues or questions:
1. Check AI Repair logs: `.github/workflows/ai-repair.yml`
2. Review test output: Review generated PR
3. Inspect Claude API response in workflow artifacts
4. Check configuration: `ai-repair/config.yaml`

---

**Next Step**: Push this to GitHub and watch the magic happen! 🪄✨
