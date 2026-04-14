# 🚀 Neovim Configuration

A high-performance, modular Neovim setup focused on speed, modern developer experience (DX), and a clean aesthetic. This config leverages the latest Neovim features and the fastest plugins available.

## ✨ Key Features

- **Blazing Fast Startup:** Aggressively disables unnecessary built-in Vim plugins (`netrw`, `tutor`, `zip`, etc.) for near-instant boot times.
- **Modern Completion:** Powered by `blink.cmp`, a high-performance completion engine written in Rust.
- **Full LSP Suite:** Complete integration with `mason`, `lspconfig`, and `conform.nvim` for top-tier IDE-like features.
- **Enhanced UI:** Features `base46` for beautiful theming, `modeline.nvim` for a minimalist status line, and `markview.nvim` for superior Markdown rendering.
- **Modular Architecture:** Clean separation of concerns between core options, keymaps, and plugin-specific configurations.

---

## 📦 Plugin Overview

### 🛠️ Development & LSP

- **`blink.cmp`**: Next-generation autocompletion (compiled for speed).
- **`nvim-lspconfig`**: Quick-start configurations for the Nvim LSP client.
- **`mason.nvim`**: Portable package manager for LSP servers, DAP servers, linters, and formatters.
- **`conform.nvim`**: Lightweight formatter runner for maintaining code style.
- **`SchemaStore.nvim`**: Comprehensive JSON and YAML schema support.

### 🔍 Navigation & Search

- **`telescope.nvim`**: Highly extendable fuzzy finder.
- **`neo-tree.nvim`**: Modern file explorer UI.
- **`flash.nvim`**: Navigate your code with search labels.
- **`gitsigns.nvim`**: Git integration for buffers (signs, hunks, and blame).

### 🎨 UI & Syntax

- **`nvim-treesitter`**: Advanced syntax highlighting and code parsing.
- **`base46`**: Advanced color system for Neovim.
- **`markview.nvim`**: Beautiful Markdown previews within the buffer.
- **`todo-comments.nvim`**: Highlighting and searching for `TODO`, `FIXME`, and `BUG` notes.

### ⌨️ Utilities

- **`Comment.nvim`**: Smart and powerful commenting tool.
- **`nvim-autopairs`** & **`nvim-ts-autotag`**: Automatic closing of brackets and HTML/XML tags.
- **`floaterm`**: Integrated floating terminal management.
- **`hydra.nvim`**: Create custom sub-modes for complex keybinding sequences.

---

## 📂 File Structure

```bash
~/.config/nvim
├── init.lua          # Main entry point (disables built-ins & loads modules)
├── lua/
│   ├── options.lua   # Global Neovim settings
│   ├── keymaps.lua   # Custom keybindings
│   ├── lib/
│   │   └── pack.lua  # Custom package management logic
│   └── plugins/      # Individual plugin configurations
│       ├── lspconfig.lua
│       ├── telescope.lua
│       └── ...
└── ...
```

## 🚀 Installation

- Prerequisites

1. Neovim v.13.0-dev
2. Cargo (Rust): Required to compile blink.cmp.
3. Nerd Fonts: A Nerd Font must be installed and active in your terminal for icons to display correctly.

### setup

```bash
# Clone the repository
git clone https://github.com/maxmx03/nvim ~/.config/nvim

# Open Neovim
nvim
```
