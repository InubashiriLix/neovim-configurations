vim.keymap.set("n", "<leader><Tab>j", function() vim.cmd("tabnext") end, { silent = true })
vim.keymap.set("n", "<leader><Tab>k", function() vim.cmd("tabprevious") end, { silent = true })

return {}
