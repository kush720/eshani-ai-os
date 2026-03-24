#!/bin/bash

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
echo -e "${BLUE}🚀 Eshani AI-OS Setup Script${NC}"
echo -e "${BLUE}================================${NC}\n"

# Step 1: Check if Git is installed
echo -e "${YELLOW}[1/6] Checking Git installation...${NC}"
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is not installed. Please install from https://git-scm.com/downloads${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Git is installed${NC}\n"

# Step 2: Initialize Git Repository
echo -e "${YELLOW}[2/6] Initializing Git repository...${NC}"
if [ -d ".git" ]; then
    echo -e "${GREEN}✅ Git repository already initialized${NC}"
else
    git init
    echo -e "${GREEN}✅ Git repository initialized${NC}"
fi
echo ""

# Step 3: Configure Git (optional)
echo -e "${YELLOW}[3/6] Configuring Git user...${NC}"
read -p "Enter your Git username (or press Enter to skip): " git_user
read -p "Enter your Git email (or press Enter to skip): " git_email

if [ ! -z "$git_user" ] && [ ! -z "$git_email" ]; then
    git config user.name "$git_user"
    git config user.email "$git_email"
    echo -e "${GREEN}✅ Git user configured${NC}"
else
    echo -e "${YELLOW}⚠️  Skipped Git configuration${NC}"
fi
echo ""

# Step 4: Add files and commit
echo -e "${YELLOW}[4/6] Staging and committing files...${NC}"
git add .
git commit -m "Initial Eshani AI-OS commit" || true
echo -e "${GREEN}✅ Files committed${NC}\n"

# Step 5: Set main branch
echo -e "${YELLOW}[5/6] Setting up main branch...${NC}"
git branch -M main
echo -e "${GREEN}✅ Branch set to main${NC}\n"

# Step 6: Connect to GitHub
echo -e "${YELLOW}[6/6] Connecting to GitHub repository...${NC}"
read -p "Enter your GitHub repository URL (e.g., https://github.com/username/eshani-ai-os.git): " repo_url

if [ -z "$repo_url" ]; then
    echo -e "${RED}❌ Repository URL is required${NC}"
    exit 1
fi
git remote add origin "$repo_url" 2>/dev/null || git remote set-url origin "$repo_url"
git push -u origin main
echo -e "${GREEN}✅ Repository connected and pushed to GitHub${NC}\n"

# Final message
echo -e "${BLUE}================================${NC}"
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo -e "${BLUE}================================${NC}"
echo ""
echo -e "Your repository is now available at:"
echo -e "${GREEN}$repo_url${NC}"
echo ""
echo -e "Download as ZIP:"
echo -e "${GREEN}$repo_url/archive/refs/heads/main.zip${NC}"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo -e "1. Set up GitHub Actions secrets (RAILWAY_TOKEN, RENDER_API_KEY)"
echo -e "2. Connect your deployment service (Railway/Render/Vercel)"
echo -e "3. Push changes to trigger automatic deployments"
echo ""
echo -e "${BLUE}For more info, see README.md${NC}"