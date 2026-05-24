# Data Engineering Toolkit

Personal development environment optimized for speed, data visibility, and low-friction context switching.

I built this to solve two specific pain points:
1. Fragmented virtual environments across AI and data projects.
2. The overhead of writing Python scripts just to inspect local database state.

## Core Concepts

Data engineering is the bridge between code and state. This environment makes that bridge invisible. It relies on a high-performance stack: Ghostty for terminal performance, uv for Python management, and DuckDB for local analytics.

---

## Workflows

### The "Jump" (lab)
A dedicated "Data Lab" for prototyping. One command handles directory navigation and environment activation.

### The "Inspector" (inspect)
Quick visualization for .db files.
```bash
inspect data/raw/my_data.db
```
This triggers a script that spins up a Datasette instance in the browser, providing a full GUI for filtering and SQL queries.

### The "Hot Reload" (reload-dots)
Sync configuration changes across the system and refresh the shell session instantly.

---

## Components

- **bin/**: Custom shell utilities.
- **zsh/**: Modular shell configuration and aliases.
- **ghostty/**: High-performance terminal configuration.
- **install.sh**: Symlink engine for environment deployment.

## Stack
*   **Package Manager**: [uv](https://github.com/astral-sh/uv)
*   **Database**: [DuckDB](https://duckdb.org/)
*   **Terminal**: [Ghostty](https://ghostty.org/)
*   **Aesthetics**: Minimalist Zsh prompt based on the Tovy color palette.

---

## Customization

Adjust these variables to match your local setup:

1.  **zsh/.zshrc**: Set `DOTFILES_PATH` to your clone location.
2.  **zsh/aliases.zsh**: Set `MAIN_PROJECT_PATH` to your primary workspace.

Run `reload-dots` after modifying.

### Local Overrides
Use `zsh/aliases.local.zsh` for personal aliases or machine-specific paths. This file is git-ignored to keep your local environment private.

```bash
# Example aliases.local.zsh
alias myproj="lab"
export MAIN_PROJECT_PATH="$HOME/work/my-cool-project"
```

## Setup

```bash
git clone https://github.com/GielNijkamp/tool-kit.git ~/repos/dotfiles
cd ~/repos/dotfiles
./install.sh
```

*Prerequisites: uv and ghostty.*

---
**"The goal isn't just to write code, but to reduce the distance between an idea and a result."**
