-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- set 'jk', 'jj', 'kk', 'kj' to exit insert mode
vim.keymap.set("i", "<Esc>", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("i", "kk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

-- Prevent accidental macro recording with `q`. Use <leader>qr to start/stop it.
vim.keymap.set("n", "q", "<Nop>", { desc = "Disable accidental macro recording" })
vim.keymap.set("n", "<leader>qr", "q", { noremap = true, desc = "Start/Stop Macro Recording" })


-- enable and disable theme (I use tokyonight now) transparent
vim.keymap.set("n", "<leader>uu", function()
    local current_state = vim.g.toggle_tokyonight_transparent()
    vim.cmd("colorscheme tokyonight") -- update the colorscheme to apply the change
    vim.notify("Tokyonight transparent mode" .. (current_state and " enabled" or " disabled"), vim.log.levels.INFO, {
        title = "Tokyonight Theme",
        icon = "🎨",
    })
end, { desc = "Toggle Tokyonight Theme" })

-- Leave terminal-mode so the terminal buffer can be navigated like a normal buffer.
vim.keymap.set("t", "<C-q>", "<cmd>stopinsert<cr>", { desc = "Terminal Normal Mode" })

-- kill all the marks
vim.keymap.set("n", "<leader>md", function()
    vim.cmd("delmarks!")
    vim.cmd("delmarks A-Z0-9")
    vim.cmd("wshada!")
end, { desc = "Delete all marks" })

-- FUCK F1
vim.keymap.set({ "n", "i", "v" }, "<F1>", "<Nop>", { silent = true })

vim.keymap.set("n", "<leader>cb",
    function()
        require("blink.cmp").reload()
        vim.notify('blink.cmp reloaded')
    end,
    { desc = "Reload blink.nvim cmp" }
)

-- https://github.com/neovim/neovim/issues/21936
-- Open the URL under the cursor in the system browser.
vim.keymap.set("n", "<leader>gF", function()
    local url = vim.fn.expand("<cfile>")
    if not url:match("^https?://") then
        vim.notify("No HTTP(S) URL under cursor", vim.log.levels.WARN)
        return
    end

    local _, err = vim.ui.open(url)
    if err then
        vim.notify("Failed to open URL: " .. err, vim.log.levels.ERROR)
    end
end, { desc = "Open URL under cursor" })
