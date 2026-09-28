vim.g.tokyonight_transparent = true

function vim.g.toggle_tokyonight_transparent()
    vim.g.tokyonight_transparent = not vim.g.tokyonight_transparent

    require("tokyonight").setup({
        transparent = vim.g.tokyonight_transparent,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    })

    -- 关键：必须重新加载 colorscheme
    vim.cmd("colorscheme tokyonight")

    return vim.g.tokyonight_transparent
end

return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- 很重要，主题必须立即加载
        priority = 1000,
        opts = function()
            return {
                transparent = vim.g.tokyonight_transparent,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            }
        end,
    },
    -- {
    --     -- "arturgoms/moonbow.nvim",
    --     dir = "/home/inubashiri/proj/neovim-plugin/moonbow.nvim/",
    --     lazy = false,
    --     priority = 1200,
    --     config = function()
    --         require("moonbow").setup({ transparent_mode = true })
    --     end
    -- },

    -- {
    --     "rebelot/kanagawa.nvim",
    --     lazy = false,
    --     theme = "wave",
    --     background = {
    --         dark = "wave",
    --         light = "wave",
    --     }
    -- }
}
