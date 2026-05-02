# Development Guide

This guide provides step-by-step instructions for setting up the local development environment, running the application, and verifying quality gates for this project.

## 🚀 Setup Instructions

### Prerequisites

List the tools, runtimes, package managers, databases, and infrastructure dependencies required to work on this project.

Example structure:
- **Primary runtime**: [version and installation source]
- **Package manager**: [tool and minimum version]
- **Container tooling**: [Docker, Podman, or not required]
- **Database / external services**: [what must run locally]
- **Git**: [version guidance if relevant]

### 1. Clone the Repository

```bash
git clone <repository-url>
cd <repository-folder>
```

### 2. Environment Configuration

Document the required environment files and variables for every local service.

Example structure:

**Backend Environment** (`<backend-path>/.env`):
```env
# Example only - replace with actual variables
PORT=<port>
APP_ENV=development
DATABASE_URL=<connection-string>
```

**Frontend Environment** (`<frontend-path>/.env`):
```env
# Example only - replace with actual variables
APP_API_URL=http://localhost:<backend-port>
```

### 3. Local Infrastructure Setup

Describe how to start any required infrastructure such as databases, queues, caches, storage emulators, or third-party dependencies.

```bash
# Replace with the real commands for this project
<infrastructure-start-command>
<infrastructure-status-command>
```

Document connection details only as placeholders or safe local defaults. Never hardcode real credentials in the template.

### 4. Backend Setup

```bash
cd <backend-path>

# Install dependencies
<backend-install-command>

# Generate code or clients if applicable
<backend-generate-command>

# Run migrations if applicable
<backend-migrate-command>

# Seed local data if applicable
<backend-seed-command>

# Start the development server
<backend-dev-command>
```

Document the expected local backend URL and any required health checks.

### 5. Frontend Setup

```bash
cd <frontend-path>

# Install dependencies
<frontend-install-command>

# Start the development server
<frontend-dev-command>
```

Document the expected local frontend URL and any proxy or API base URL expectations.

### 6. End-to-End or Integration Test Setup

If the project has E2E, browser, or contract tests, describe their local prerequisites here.

```bash
cd <test-runner-path>

# Install test dependencies if needed
<test-install-command>

# Open or run the test suite
<test-open-command>
<test-run-command>
```

If the project has no such suite, replace this section with the actual highest-level verification workflow used by the team.

## 🧪 Testing

### Backend Testing

```bash
cd <backend-path>

# Run all tests
<backend-test-command>

# Run tests in watch mode if supported
<backend-test-watch-command>

# Run tests with coverage if supported
<backend-test-coverage-command>
```

### Frontend Testing

```bash
cd <frontend-path>

# Run unit or component tests
<frontend-test-command>

# Run browser, E2E, or integration tests if applicable
<frontend-e2e-command>
```
