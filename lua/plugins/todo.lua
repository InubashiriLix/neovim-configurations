return {
    "InubashiriLix/TodoAnxiety.nvim",
    -- dir = "/home/inubashiri/proj/neovim-plugin/TodoAnxiety.nvim",
    dependencies = {
        "kkharji/sqlite.lua",
        "MunifTanjim/nui.nvim",
    },

    config = function()
        require("todo").setup({
            -- 多设备手动同步：先新建一个专用私有空 Git 仓库（不要初始化 README）。
            -- 在每台设备配置 Git SSH 密钥或 HTTPS 凭据，并填写相同的 remote 和 branch。
            -- 先在已有数据的设备执行 :Todo sync，再在 Mac 的空数据库中执行 :Todo sync。
            -- :Todo sync status 只查看本地同步状态；插件不会自动联网同步。
            sync = {
                enabled = true,                                             -- 填好下方仓库地址后，改为 true 开启同步。
                remote = "git@github.com:InubashiriLix/todo-sync-repo.git", -- 例如 "git@github.com:YOUR_NAME/private-todos.git"
                branch = "main",
            },
            reminders = {
                enabled = true,
                sound = {
                    path = vim.fn.expand("~/Music/Todo.nvim/mission.mp3"),
                    command = {
                        "mpv",
                        "--no-video",
                        "--really-quiet",
                    },
                },
            },
        })
    end,
}
