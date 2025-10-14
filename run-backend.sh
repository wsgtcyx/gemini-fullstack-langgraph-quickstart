#!/bin/bash

# Script to run the backend development server
# This script handles virtual environment activation and starts the LangGraph dev server

set -e  # Exit on error

echo "🚀 Starting backend development server..."

# Navigate to backend directory
cd backend

# Check if virtual environment exists
if [ ! -d ".venv" ]; then
    echo "❌ Virtual environment not found at backend/.venv"
    echo ""
    echo "Please run the setup script first:"
    echo "  ./setup-uv-env.sh"
    echo ""
    echo "Or create the environment manually:"
    echo "  cd backend && uv venv --python 3.11 && uv pip install -e ."
    exit 1
fi

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "⚠️  Warning: .env file not found"
    echo ""
    if [ -f ".env.example" ]; then
        echo "Creating .env from .env.example..."
        cp .env.example .env
        echo "✅ .env file created"
        echo ""
        echo "⚠️  IMPORTANT: Please edit backend/.env and add your GEMINI_API_KEY"
        echo ""
        read -p "Press Enter to continue after you've added your API key, or Ctrl+C to exit..."
    else
        echo "❌ .env.example not found. Please create a .env file with your GEMINI_API_KEY"
        exit 1
    fi
fi

echo ""
echo "🔧 Using Python environment: backend/.venv"
echo "🌐 Backend will be available at: http://localhost:2024"
echo "🎨 LangGraph UI will be available at the backend URL"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Run the backend using uv (no manual activation needed)
uv run langgraph dev
