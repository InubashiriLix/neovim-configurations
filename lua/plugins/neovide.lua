if vim.g.neovide then
    vim.g.neovide_scale_factor = 0.8
    local function change_scale(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end

    vim.keymap.set({ "n", "v" }, "<C-+>", function() change_scale(1.1) end, { desc = "Increase Neovide scale factor" })
    vim.keymap.set({ "n", "v" }, "<C-->", function() change_scale(0.9) end, { desc = "Decrease Neovide scale factor" })
    vim.keymap.set({ "n", "v" }, "<C-0>", function() vim.g.neovide_scale_factor = 1 end,
        { desc = "Reset Neovide scale factor" })

    vim.g.neovide_remember_window_size = true
    vim.g.neovide_opacity = 0.80
    vim.g.neovide_normal_opacioty = 0.80
    vim.o.guifont = "JetBrains Maple Mono,Noto Sans CJK SC:h14"

    vim.notify("Launch in Neovide, modify scale configuration enabled.")
else
    vim.notify("Launch in Neovide, modify scale configuration disabled.")
end

return {}
