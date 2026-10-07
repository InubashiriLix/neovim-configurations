local enable_log = true

if vim.g.neovide then
    -- set the scale and fonts
    vim.g.neovide_scale_factor = 0.8
    local function change_scale(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    -- scale modifiers
    vim.keymap.set({ "n", "v" }, "<C-+>", function() change_scale(1.1) end, { desc = "Increase Neovide scale factor" })
    vim.keymap.set({ "n", "v" }, "<C-->", function() change_scale(0.9) end, { desc = "Decrease Neovide scale factor" })
    vim.keymap.set({ "n", "v" }, "<C-0>", function() vim.g.neovide_scale_factor = 1 end,
        { desc = "Reset Neovide scale factor" })

    vim.g.neovide_remember_window_size = true
    vim.g.neovide_opacity = 0.80
    vim.g.neovide_normal_opacity = 0.80
    vim.o.guifont = "JetBrains Maple Mono,Noto Sans CJK SC:h14"

    -- set the cursor color
    vim.api.nvim_set_hl(0, "CursorNormal", {
        fg = "#1e1e2e",
        bg = "#FF0000",
    })
    vim.api.nvim_set_hl(0, "CursorInsert", {
        fg = "#1e1e2e",
        bg = "#00FF00",
    })
    vim.api.nvim_set_hl(0, "CursorReplace", {
        fg = "#1e1e2e",
        bg = "#f38ba8",
    })
    vim.opt.guicursor = {
        "n-v-c:block-CursorNormal",
        "i-ci-ve:ver25-CursorInsert",
        "r-cr-o:hor20-CursorReplace",
    }

    if enable_log then
        vim.notify("Launch in Neovide, modify scale configuration enabled.", vim.log.levels.DEBUG)
    end
else
    if enable_log then
        vim.notify("Launch in Terminal, modify scale configuration disabled.", vim.log.levels.DEBUG)
    end
end

return {}
