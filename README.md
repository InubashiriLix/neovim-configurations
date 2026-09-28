# InubashiriLix's Neovim Configuration

> A personal [LazyVim](https://github.com/LazyVim/LazyVim) setup for coding, writing, and daily work inside Neovim.

This configuration is tailored to my Linux environment. It is shared as a reference, not as a portable distribution that will work unchanged on every machine.

## Features

- **Coding:** LazyVim language extras, LSP support, completion, formatting, debugging, testing, Git tools, and refactoring. Custom configuration includes C/C++, Kotlin, Lua, Teal, Typst, and Xmake workflows.
- **Writing and notes:** Markdown, Neorg, Org mode, Typst, and LaTeX support, including Markdown math, image rendering in supported terminals, and PDF viewing or preview tools.
- **Personal tools:** [Ambient.nvim](https://github.com/InubashiriLix/Ambient.nvim) for local music, [TodoAnxiety.nvim](https://github.com/InubashiriLix/TodoAnxiety.nvim) for tasks, and [ration.nvim](https://github.com/InubashiriLix/ration.nvim) for finances.
- **AI:** Avante and Sidekick integrations, including Codex CLI profiles.
- **Interface:** Tokyonight, buffer tabs, and custom key mappings. The configuration uses four-space indentation, line wrapping, and the system clipboard.

### Markdown diagnostics

Opening a Markdown buffer disables Neovim's diagnostic display for that buffer. This keeps diagnostic signs and underlines out of the way while writing; diagnostics in other file types remain enabled. The Markdown LSP and other editing features are not disabled by this setting.

To show diagnostics again in the current Markdown buffer, run:

```vim
:lua vim.diagnostic.enable(true, { bufnr = 0 })
```

The setting is applied again when a Markdown buffer's `FileType` event runs, including after reopening the file.

## Getting started

Place this configuration at `~/.config/nvim` and start `nvim`. The configuration bootstraps `lazy.nvim` with Git and uses LazyVim as its base. Check `lazyvim.json` for the enabled LazyVim extras and `lua/plugins/` for the personal additions.

Some features need their own programs or environment setup. For example, Xmake commands need Xmake, Typst language features use `tinymist`, LaTeX compilation uses `latexmk`, and building `ration.nvim` uses Cargo. The Sidekick Codex profiles need the `codex` CLI and a working proxy if you select a proxy profile.

## Environment notes

- `lua/config/options.lua` sets Neovim's shell to `/usr/bin/fish`. Change this path if fish is installed elsewhere or you use another shell.
- `lua/plugins/music.lua` loads Ambient.nvim from a local absolute path and lists music directories under `~/Music`. Change those paths before using that feature on another machine.
- The Codex profiles in `lua/plugins/ai/sidekick.lua` use local proxy ports `7890` and `7897`. Adjust them to match your network setup.
- `image.nvim` is configured for the Kitty graphics backend and ImageMagick CLI in terminal Neovim; this configuration does not load it in Neovide.
- The configuration is maintained on Linux. macOS, Windows, and WSL may require changes to paths, external tools, and terminal integrations.
