local header = [[
        ███╗   ███╗██╗   ██╗██╗  ████████╗██╗██╗   ██╗██╗███╗   ███╗         Z
        ████╗ ████║██║   ██║██║  ╚══██╔══╝██║██║   ██║██║████╗ ████║      z
        ██╔████╔██║██║   ██║██║     ██║   ██║██║   ██║██║██╔████╔██║   z
        ██║╚██╔╝██║██║   ██║██║     ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ z
        ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

]]

-- Snacks centers each row; equal widths preserve the banner geometry.
local lines = vim.split(header, "\n", { plain = true, trimempty = true })
local width = 0
for _, line in ipairs(lines) do
    width = math.max(width, vim.fn.strdisplaywidth(line))
end
for i, line in ipairs(lines) do
    lines[i] = line .. string.rep(" ", width - vim.fn.strdisplaywidth(line))
end

return {
    "snacks.nvim",
    opts = {
        dashboard = {
            preset = {
                pick = function(cmd, opts)
                    return LazyVim.pick(cmd, opts)()
                end,
                header = table.concat(lines, "\n"),
                -- stylua: ignore
                ---@type snacks.dashboard.Item[]
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    -- Todo plugins
                    { icon = " ", key = "t", desc = "Todo", action = ":Todo" },
                },
            },
        },
    },
}
