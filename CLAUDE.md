# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A fullstack research agent application with React frontend and LangGraph-powered Python backend. The agent performs comprehensive web research using Google Gemini models and Google Search API, featuring reflective reasoning and iterative query refinement.

## Architecture

- **Frontend**: React + TypeScript + Vite + Tailwind CSS + Shadcn UI
- **Backend**: Python FastAPI + LangGraph + Google Gemini API
- **Agent Flow**: Query generation → Web research → Reflection → Iterative refinement → Final answer synthesis

### Core Agent Components
- `backend/src/agent/graph.py`: Main LangGraph state machine with nodes for query generation, web research, reflection, and answer synthesis
- `backend/src/agent/state.py`: TypedDict state definitions for the research workflow
- `backend/src/agent/prompts.py`: LLM prompt templates for each agent node
- `backend/src/agent/tools_and_schemas.py`: Structured output schemas for LLM responses
- `backend/src/agent/utils.py`: Utility functions for URL resolution and citation handling

## Key Directories

- `/frontend` - React application with Shadcn UI components
- `/backend` - LangGraph agent and FastAPI server
- `/backend/src/agent` - Core agent logic
- `/backend/examples` - CLI testing utilities

## Development Commands

### Setup
```bash
# Backend (uses uv for dependency management)
cd backend && pip install .
cp backend/.env.example backend/.env  # Add GEMINI_API_KEY

# Frontend
cd frontend && npm install
```

### Development
```bash
make dev              # Start both frontend and backend concurrently
make dev-backend      # Start backend only (langgraph dev)
make dev-frontend     # Start frontend only (npm run dev)
```

### Backend Commands
```bash
cd backend
make test             # Run unit tests (uses pytest)
make test_watch       # Run tests in watch mode
make lint             # Run ruff + mypy linting
make format           # Format code with ruff
python examples/cli_research.py "query"  # CLI testing
```

### Frontend Commands
```bash
cd frontend
npm run dev          # Development server (Vite)
npm run build        # Build for production
npm run lint         # ESLint checking
npm run preview      # Preview production build
```

## Testing Approach

- **Backend**: Uses pytest with test files in `tests/unit_tests/` directory
- **Frontend**: Uses ESLint for code quality, no test framework configured
- **Interactive Testing**: `test-agent.ipynb` notebook for agent experimentation
- **CLI Testing**: `examples/cli_research.py` for command-line agent execution

## Environment Variables

- `GEMINI_API_KEY` - Required for Google Gemini API access
- `LANGSMITH_API_KEY` - Optional for production deployment and observability
- `REDIS_URI` - Redis connection for pub/sub (production)
- `POSTGRES_URI` - PostgreSQL connection for state persistence (production)

## API Endpoints

- **Development**: Backend at `http://localhost:2024`, Frontend at `http://localhost:5173`
- **Production**: Combined server at `http://localhost:8123`
- **LangGraph UI**: Available at backend development server URL

## Docker Deployment

```bash
# Build the Docker image
docker build -t gemini-fullstack-langgraph -f Dockerfile .

# Run with docker-compose (requires Redis and PostgreSQL)
GEMINI_API_KEY=<key> LANGSMITH_API_KEY=<key> docker-compose up
```

## Development Workflow

1. Set up environment variables in `backend/.env`
2. Install dependencies with `pip install .` and `npm install`
3. Run development servers with `make dev`
4. Test agent logic with CLI: `python examples/cli_research.py "your query"`
5. Use `make lint` and `make format` for code quality
6. For production, build frontend and use Docker deployment