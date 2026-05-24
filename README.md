# The Data Engineer's Workbench 🛠️

This is my personal "mission control"—a consolidated development environment built for speed, data visibility, and zero-friction context switching. 

I built this because I was tired of two things:
1. Hunting for virtual environments across different AI and data projects.
2. Having to write a Python script just to "see" what an agent just saved into a local database.

## 🧠 The Philosophy
Data engineering is often about the transition between **code** and **state**. This toolkit ensures that transition is instantaneous. It relies on a modern stack: **Ghostty** for terminal performance, **uv** for lightning-fast Python management, and **DuckDB** for the heavy lifting.

---

## 🚀 Key Workflows

### ⚡️ The "Jump" (`tovy`)
I use a central "Tovy" hub for rapid prototyping. One command puts me in the directory and activates the environment. No `cd`, no `source .venv/bin/activate`. Just flow.

### 🔍 The "Inspector" (`inspect`)
When an agent or a pipeline drops a `.db` file, I don't guess. I run:
```bash
inspect data/raw/my_data.db
```
This triggers a custom script (`quick-db`) that spins up a **Datasette** instance in the browser. I get a full GUI to filter, sort, and SQL-query my local data immediately.

### 🔄 The "Hot Reload" (`reload-dots`)
My environment evolves as I do. When I add a new alias or utility, `reload-dots` syncs everything and refreshes my shell instantly.

---

## 🏗 What's Inside?

- **`bin/`**: Specialized shell scripts (like `quick-db`).
- **`zsh/`**: My brain's shortcuts. Modular `.zshrc` and `aliases.zsh`.
- **`ghostty/`**: Configs for the fastest terminal on macOS.
- **`install.sh`**: A one-click symlink engine to deploy this entire setup on a new machine.

## 🛠 My Stack
*   **Package Manager**: [uv](https://github.com/astral-sh/uv) (The only way to manage Python in 2024).
*   **Database**: [DuckDB](https://duckdb.org/) (Local analytical powerhouse).
*   **Terminal**: [Ghostty](https://ghostty.org/) (Performance & Aesthetics).
*   **Exploration**: [Datasette](https://datasette.io/) (Visualizing the data).

---

## ⚙️ Quick Start

If you want to adopt this workflow:

```bash
git clone https://github.com/[YOUR_USERNAME]/tool-kit.git ~/repos/dotfiles
cd ~/repos/dotfiles
./install.sh
```

*Note: This setup assumes you have `uv` and `ghostty` installed.*

---
**"The goal isn't just to write code, but to reduce the distance between an idea and a result."**
