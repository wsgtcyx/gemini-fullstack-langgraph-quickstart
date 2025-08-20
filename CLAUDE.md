# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A fullstack research agent application with React frontend and LangGraph-powered Python backend. The agent performs comprehensive web research using Google Gemini models and Google Search API, featuring reflective reasoning and iterative query refinement.

## Architecture

- **Frontend**: React + TypeScript + Vite + Tailwind CSS + Shadcn UI
- **Backend**: Python FastAPI + LangGraph + Google Gemini API
- **Agent Flow**: Query generation → Web research → Reflection → Iterative refinement → Final answer synthesis

## Key Directories

- `/frontend` - React application
- `/backend` - LangGraph agent and FastAPI server
- `/backend/src/agent` - Core agent logic (graph.py, prompts.py, tools_and_schemas.py)

## Development Commands

### Setup
```bash
# Backend
pip install .
cp backend/.env.example backend/.env  # Add GEMINI_API_KEY

# Frontend
cd frontend && npm install
```

### Development
```bash
make dev              # Start both frontend and backend
make dev-backend      # Start backend only (langgraph dev)
make dev-frontend     # Start frontend only (npm run dev)
```

### Backend Commands
```bash
cd backend
make test             # Run unit tests
make lint             # Run ruff + mypy
make format           # Format code
python examples/cli_research.py "query"  # CLI testing
```

### Frontend Commands
```bash
cd frontend
npm run dev          # Development server
npm run build        # Build for production
npm run lint         # ESLint
```

## Environment Variables

- `GEMINI_API_KEY` - Required for backend
- `LANGSMITH_API_KEY` - Optional for production deployment

## API Endpoints

- Development: Backend at `http://localhost:2024`, Frontend at `http://localhost:5173`
- Production: Combined server at `http://localhost:8123`

## Docker Deployment

```bash
docker build -t gemini-fullstack-langgraph -f Dockerfile .
GEMINI_API_KEY=<key> LANGSMITH_API_KEY=<key> docker-compose up
```