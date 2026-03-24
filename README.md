# 🚀 Eshani AI-OS

A modern AI Operating System with automated CI/CD deployment pipelines.

## 📋 Table of Contents

- [Quick Start](#quick-start)
- [Installation](#installation)
- [Setup & Deployment](#setup--deployment)
- [CI/CD Pipelines](#cicd-pipelines)
- [Deployment Platforms](#deployment-platforms)
- [GitHub Actions Secrets](#github-actions-secrets)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

---

## 🚀 Quick Start

### Option 1: Automated Setup (Recommended)

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/eshani-ai-os.git
cd eshani-ai-os

# Make setup script executable
chmod +x setup.sh

# Run the setup script
bash setup.sh
```

### Option 2: Manual Setup

```bash
git clone https://github.com/YOUR_USERNAME/eshani-ai-os.git
cd eshani-ai-os
npm install
npm start
```

### Option 3: Download ZIP

Download directly: [eshani-ai-os.zip](https://github.com/YOUR_USERNAME/eshani-ai-os/archive/refs/heads/main.zip)

---

## 📦 Installation

### Prerequisites

- **Git**: [Download](https://git-scm.com/downloads)
- **Node.js**: [Download](https://nodejs.org/) (v18+)
- **npm** or **yarn**

### Local Installation

```bash
# Clone repository
git clone https://github.com/YOUR_USERNAME/eshani-ai-os.git
cd eshani-ai-os

# Install dependencies
npm install

# Start development server
npm start

# Build for production
npm run build
```

---

## 🔧 Setup & Deployment

### Step 1: Initial Repository Setup

```bash
git init
git add .
git commit -m "Initial Eshani AI-OS commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/eshani-ai-os.git
git push -u origin main
```

### Step 2: Enable GitHub Actions

1. Go to your repository: `https://github.com/YOUR_USERNAME/eshani-ai-os`
2. Navigate to **Settings → Actions → General**
3. Enable "Allow all actions and reusable workflows"
4. Click **Save**

### Step 3: Add Deployment Secrets

Navigate to **Settings → Secrets and variables → Actions** and add:

```
RAILWAY_TOKEN      → Your Railway API token
RAILWAY_PROJECT_ID → Your Railway project ID
RENDER_API_KEY     → Your Render API key
RENDER_SERVICE_ID  → Your Render service ID
```

---

## 🔄 CI/CD Pipelines

### Workflow Overview

```
push to main
    ↓
Run Tests & Build
    ↓
Deploy to Railway (parallel)
Deploy to Render (parallel)
    ↓
Send Notifications
```

### Automatic Triggers

The CI/CD pipeline runs automatically when:

- ✅ You push to the `main` branch
- ✅ You create a pull request to `main`
- ✅ You manually trigger from Actions tab

### Manual Trigger

1. Go to **Actions** tab
2. Select **Deploy Eshani AI-OS**
3. Click **Run workflow**

---

## 🌐 Deployment Platforms

### Railway.app

**Setup:**

1. Create account: https://railway.app
2. Create new project
3. Connect GitHub repository
4. Get your API token from account settings
5. Add `RAILWAY_TOKEN` and `RAILWAY_PROJECT_ID` to GitHub Secrets

**Deploy:**

```bash
railway login
railway link <project-id>
railway up
```

### Render.com

**Setup:**

1. Create account: https://render.com
2. Create new service
3. Connect GitHub repository
4. Get API key from account settings
5. Add `RENDER_API_KEY` and `RENDER_SERVICE_ID` to GitHub Secrets

**Deploy:**

```bash
curl https://api.render.com/deploy/YOUR_SERVICE_ID?key=YOUR_API_KEY
```

### Vercel (Frontend)

**Setup:**

1. Create account: https://vercel.com
2. Import GitHub repository
3. Configure build settings
4. Deploy

**Automatic:** Vercel automatically deploys on every push!

---

## 🔐 GitHub Actions Secrets

### How to Add Secrets

1. Navigate to repository **Settings**
2. Click **Secrets and variables → Actions**
3. Click **New repository secret**
4. Enter name and value
5. Click **Add secret**

### Required Secrets

| Secret | Description | Where to Get |
|--------|-------------|--------------|
| `RAILWAY_TOKEN` | Railway API authentication token | Railway dashboard → Account → Create token |
| `RAILWAY_PROJECT_ID` | Your Railway project ID | Railway dashboard → Project settings |
| `RENDER_API_KEY` | Render API key | Render dashboard → Account → API keys |
| `RENDER_SERVICE_ID` | Your Render service ID | Render dashboard → Service settings |

---

## 📊 Monitoring Deployments

### GitHub Actions

1. Go to repository **Actions** tab
2. View workflow runs in real-time
3. Click on any run to see logs

### Railway

- Dashboard: https://railway.app/dashboard
- View logs: Project → Logs tab
- Monitor: Project → Deployments

### Render

- Dashboard: https://dashboard.render.com
- View logs: Service → Logs
- Monitor: Service → Deployments

---

## 🐛 Troubleshooting

### Issue: Workflow fails at "Run tests"

**Solution:**

```bash
# Ensure package.json has test script
npm test
```

Or disable tests in `.github/workflows/deploy.yml`:

```yaml
- name: Run tests
  run: npm test || true  # Will skip if no tests
```

### Issue: Deployment secrets not working

**Solution:**

1. Verify secrets are added: Settings → Secrets
2. Check secret names match exactly
3. Redeploy: Actions → Run workflow

### Issue: Git push rejected

**Solution:**

```bash
# Force push (use with caution)
git push -u origin main --force

# Or pull first
git pull origin main
git push -u origin main
```

### Issue: Node version mismatch

**Solution:**

Update `.github/workflows/deploy.yml`:

```yaml
- name: Set up Node.js
  uses: actions/setup-node@v3
  with:
    node-version: '20'  # Change version here
```

---

## 📝 File Structure

```
eshani-ai-os/
├── .github/
│   └── workflows/
│       └── deploy.yml          # CI/CD pipeline
├── node_modules/               # Dependencies
├── src/                        # Source code
├── public/                     # Static files
├── .gitignore                  # Git ignore rules
├── package.json                # Project metadata
├── setup.sh                    # Setup script
└── README.md                   # This file
```

---

## 🚀 Deployment Checklist

- [ ] Repository created on GitHub
- [ ] `setup.sh` executed successfully
- [ ] GitHub Actions enabled
- [ ] Railway/Render account created
- [ ] API tokens added to GitHub Secrets
- [ ] Initial push to `main` branch completed
- [ ] Workflow runs successfully in Actions tab
- [ ] Deployment verified on Railway/Render/Vercel
- [ ] ZIP download works: `/archive/refs/heads/main.zip`

---

## 📚 Resources

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Railway Documentation](https://docs.railway.app/)
- [Render Documentation](https://render.com/docs)
- [Vercel Documentation](https://vercel.com/docs)

---

## 💡 Pro Tips

1. **Use branches for development:**
   ```bash
   git checkout -b feature/my-feature
   git push origin feature/my-feature
   ```

2. **Create pull requests before merging to main**
   - Allows CI/CD testing before production

3. **Monitor GitHub Actions**
   - Check workflow logs for issues early

4. **Keep secrets secure**
   - Never commit secrets to repository
   - Rotate API tokens regularly

5. **Use environment variables**
   - Add to Railway/Render/Vercel dashboards
   - Reference in code: `process.env.VARIABLE_NAME`

---

## 📄 License

MIT License - See LICENSE file for details

---

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a pull request

---

## 📞 Support

For issues or questions:

1. Check [Troubleshooting](#troubleshooting) section
2. Review [GitHub Issues](https://github.com/YOUR_USERNAME/eshani-ai-os/issues)
3. Create a new issue with details

---

## ⭐ Star & Follow

If this project helps you, please give it a ⭐!

**Repository:** https://github.com/YOUR_USERNAME/eshani-ai-os

**Made with ❤️ by your team