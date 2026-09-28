return {
    -- "why the breaking soul?"
    "yetone/avante.nvim",
    keys = {
        { "<leader>aa",  false,                           mode = { "n", "x" } },
        { "<leader>acc", "<cmd>AvanteAsk<CR>",            desc = "Ask Avante",             mode = { "n", "x" } },

        { "<leader>ac",  false,                           mode = { "n", "x" } },
        { "<leader>aca", "<cmd>AvanteChat<CR>",           desc = "Chat with Avante",       mode = { "n", "x" } },

        { "<leader>ae",  false,                           mode = { "n", "x" } },
        { "<leader>ace", "<cmd>AvanteEdit<CR>",           desc = "Edit Avante",            mode = { "n", "x" } },

        { "<leader>af",  false,                           mode = { "n", "x" } },
        { "<leader>acf", "<cmd>AvanteFocus<CR>",          desc = "Focus Avante",           mode = { "n", "x" } },

        { "<leader>ah",  false,                           mode = { "n", "x" } },
        { "<leader>ach", "<cmd>AvanteHistory<CR>",        desc = "Avante History",         mode = { "n", "x" } },

        { "<leader>am",  false,                           mode = { "n", "x" } },
        { "<leader>acm", "<cmd>AvanteModels<CR>",         desc = "Select Avante Model",    mode = { "n", "x" } },

        { "<leader>an",  false,                           mode = { "n", "x" } },
        { "<leader>acn", "<cmd>AvanteChatNew<CR>",        desc = "New Avante Chat",        mode = { "n", "x" } },

        { "<leader>ap",  false,                           mode = { "n", "x" } },
        { "<leader>acp", "<cmd>AvanteSwitchProvider<CR>", desc = "Switch Avante Provider", mode = { "n", "x" } },

        { "<leader>ar",  false,                           mode = { "n", "x" } },
        { "<leader>acr", "<cmd>AvanteRefresh<CR>",        desc = "Refresh Avante",         mode = { "n", "x" } },

        { "<leader>as",  false,                           mode = { "n", "x" } },
        { "<leader>acs", "<cmd>AvanteStop<CR>",           desc = "Stop Avante",            mode = { "n", "x" } },

        { "<leader>at",  false,                           mode = { "n", "x" } },
        { "<leader>act", "<cmd>AvanteToggle<CR>",         desc = "Toggle Avante",          mode = { "n", "x" } },
    },
}
