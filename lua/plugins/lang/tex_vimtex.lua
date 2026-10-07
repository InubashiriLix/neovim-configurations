-- ~/.config/nvim/lua/plugins/latex.lua
return {
    "lervag/vimtex",
    ft = { "tex" },
    config = function()
        local viewers = vim.fn.has("macunix") == 1 and { "open" } or { "firefox", "xdg-open" }
        local pdf_viewer
        for _, viewer in ipairs(viewers) do
            if vim.fn.executable(viewer) == 1 then
                pdf_viewer = viewer
                break
            end
        end

        -- 编译器设置
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
            build_dir = "",
            callback = 1,
            continuous = 1,
            executable = "latexmk",
            options = {
                "-pdf",
                "-interaction=nonstopmode",
                "-synctex=1",
            },
        }

        -- PDF 查看器设置
        vim.g.vimtex_view_method = "general"
        vim.g.vimtex_view_general_viewer = pdf_viewer or ""
        vim.g.vimtex_view_general_options = "@pdf"

        -- 不自动弹出 quickfix
        vim.g.vimtex_quickfix_mode = 0

        -- 快捷键
        local opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>VimtexCompile<CR>", opts)
        vim.keymap.set("n", "<leader>lv", function()
            if not pdf_viewer then
                vim.notify("找不到 PDF 查看器：macOS 需要 open，Linux 需要 firefox 或 xdg-open", vim.log.levels.WARN)
                return
            end
            vim.cmd("VimtexView")
        end, opts)
        vim.api.nvim_set_keymap("n", "<leader>lc", "<cmd>VimtexCompileStop<CR>", opts)

        -- 自动折叠章节
        vim.g.vimtex_fold_enabled = true
    end,
}
