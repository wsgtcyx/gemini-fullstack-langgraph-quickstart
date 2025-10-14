#!/bin/bash

# Script to set up a new isolated Python environment for the project using uv
# This project requires Python >= 3.11

set -e  # Exit on error

echo "🚀 Setting up Python environment with uv..."

# Check if uv is installed
if ! command -v uv &> /dev/null; then
    echo "❌ uv is not installed. Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    echo "✅ uv installed successfully"
fi

# Navigate to backend directory
cd backend

echo ""
echo "📦 Creating a new Python 3.11+ virtual environment..."

# Create a new virtual environment with Python 3.11+
# uv will automatically download and use the correct Python version
uv venv --python 3.11

echo "✅ Virtual environment created at: backend/.venv"

echo ""
echo "📥 Installing project dependencies..."

# Activate the virtual environment and install dependencies
source .venv/bin/activate
uv pip install -e .

echo ""
echo "✅ Setup complete!"
echo ""
echo "📝 Next steps:"
echo "1. Set up environment variables:"
echo "   cp backend/.env.example backend/.env"
echo "   # Edit backend/.env and add your GEMINI_API_KEY"
echo ""
echo "2. Activate the virtual environment:"
echo "   source backend/.venv/bin/activate"
echo ""
echo "3. Run the backend:"
echo "   cd backend && langgraph dev"
echo ""
echo "4. Or use uv to run commands directly:"
echo "   cd backend && uv run langgraph dev"
echo ""
echo "🎉 Happy coding!"
