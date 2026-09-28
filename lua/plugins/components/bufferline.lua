return {
    -- because of the bufferline will show all the buffers no matter what tab it belongs to, so we need to use scope.nvim
    {
        "tiagovla/scope.nvim",
        config = true,
    },

    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "tiagovla/scope.nvim",
        },
    },
}
