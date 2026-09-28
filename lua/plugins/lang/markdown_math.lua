if vim.g.neovide then
    return {} -- the neovide does not support the formula rendering through iamge
else
    return {
        "Thiago4532/mdmath.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = { ... },
    }
end
