-- lua/plugins/ai/ai_keys_fix.lua
return {
    -- why so tragic end?
    "folke/sidekick.nvim",
    init = function()
        pcall(vim.keymap.del, "i", "<Space>ai")  -- 清理旧映射
        pcall(vim.keymap.del, "i", "<leader>ai") -- 以防有插件按 <leader> 记录
        pcall(vim.keymap.del, "t", "<leader>ai")
    end,
    keys = {
        { "<leader>aa", false, mode = { "n", "x" } }, -- 不让 sidekick 抢占 aa
        { "<leader>ad", false, mode = { "n", "x" } },
        {
            -- aad 已用于禁用 NES，使用 aax 分离 CLI 会话。
            "<leader>aax",
            function()
                require("sidekick.cli").close()
            end,
            desc = "Detach a CLI Session",
            mode = { "n", "x" },
        },
        {
            "<leader>aai",
            function()
                require("sidekick.cli").toggle()
            end,
            desc = "Sidekick Toggle CLI",
            mode = { "n", "x" },
        },
        {
            "<leader>aaf",
            function()
                require("sidekick.cli").focus()
            end,
            desc = "Sidekick Focus CLI",
            mode = { "n", "x" },
        },
        {
            "<leader>aah",
            function()
                require("sidekick.cli").hide()
            end,
            desc = "Sidekick Hide CLI",
            mode = { "n", "x" },
        },
        {
            -- we use this to trigger the prompt panel in the normal mode
            "<leader>aao",
            function()
                require("sidekick.cli").prompt()
            end,
            desc = "Sidekick Open Prompt Panel",
            mode = { "n", "x" },
        },
        {
            "<leader>aas",
            function()
                vim.cmd("Sidekick nes enable")
                vim.notify("Sidekick NES enabled", vim.log.levels.INFO, {
                    title = "Sidekick",
                    icon = "🤖",
                })
            end,
            desc = "Sidekick NES Enable",
            mode = { "n", "x" },
        },
        {
            "<leader>aad",
            function()
                vim.cmd("Sidekick nes disable")
                vim.notify("Sidekick NES disabled", vim.log.levels.INFO, {
                    title = "Sidekick",
                    icon = "🛑",
                })
            end,
            desc = "Sidekick NES Disable",
            mode = { "n", "x" },
        },
        {
            "<leader>aac",
            function()
                vim.cmd("Sidekick cli close")
                vim.notify(
                    "Sidekick NES disabled", vim.log.levels.INFO, {
                        title = "Sidekick",
                        icon = "🛑",
                    })
            end,
            desc = "Sidekick NES Disable",
            mode = { "n", "x" },
        },
        {
            "<leader>aap",
            function()
                require("sidekick.cli").prompt()
                vim.notify(
                    "Sidekick Cli Prompt", vim.log.levels.INFO, {
                        title = "Sidekick",
                        icon = "",
                    })
            end
        },
        {
            "<leader>aag",
            function() require("sidekick.cli").send({ msg = "{file}" }) end,
            desc = "Send File",
        },
    },

    opts = {
        nes = { enabled = false },
        cli = {
            prompts = require("prompt.sidekick_prompt").load(),
            tools = {
                -- fix the proxying failed issue under niri with clash-rev / flclash's system proxy mode
                -- using injecting the proxy env vars to the codex cli process
                proxy_codex_flclash = {
                    cmd = { "codex" },
                    url = "https://github.com/openai/codex",
                    resume = { "resume" },
                    continue = { "resume", "--last" },
                    env = {
                        HTTP_PROXY = "http://127.0.0.1:7890",
                        HTTPS_PROXY = "http://127.0.0.1:7890",
                        NO_PROXY = "localhost,127.0.0.1,::1",

                        http_proxy = "http://127.0.0.1:7890",
                        https_proxy = "http://127.0.0.1:7890",
                        no_proxy = "localhost,127.0.0.1,::1",
                    },
                },
                proxy_codex_clash_rev = {
                    cmd = { "codex" },
                    url = "https://github.com/openai/codex",
                    resume = { "resume" },
                    continue = { "resume", "--last" },
                    env = {
                        HTTP_PROXY = "http://127.0.0.1:7897",
                        HTTPS_PROXY = "http://127.0.0.1:7897",
                        NO_PROXY = "localhost,127.0.0.1,::1",

                        http_proxy = "http://127.0.0.1:7897",
                        https_proxy = "http://127.0.0.1:7897",
                        no_proxy = "localhost,127.0.0.1,::1",
                    },
                },
                reusme_codex = {
                    cmd = { "codex resume" },
                    url = "https://github.com/openai/codex",
                    resume = { "resume" },
                    continue = { "resume", "--last" },
                    env = {
                        HTTP_PROXY = "http://127.0.0.1:7890",
                        HTTPS_PROXY = "http://127.0.0.1:7890",
                        NO_PROXY = "localhost,127.0.0.1,::1",

                        http_proxy = "http://127.0.0.1:7890",
                        https_proxy = "http://127.0.0.1:7890",
                        no_proxy = "localhost,127.0.0.1,::1",
                    },
                }
            },
        },
    },
    -- TODO: multiple codex sessions
    -- config = function(_, opts)
    --     require("sidekick").setup(opts)
    --
    --     -- clean the tab and session mapping that already exited.
    --     -- default: kill background codex
    --     vim.api.nvim_create_autocmd("TabClosed", {
    --         callback = function()
    --             vim.schedule(function()
    --                 local alive = {}
    --                 for _, tab in ipairs(vim.api.nvim_list_tabpages()) do alive[tab] = true end
    --                 for tab, _ in pairs(alive) do
    --                     if not alive[tab] then tab_sessions[tab] = nil end
    --                 end
    --             end)
    --         end
    --     })
    -- end
}
