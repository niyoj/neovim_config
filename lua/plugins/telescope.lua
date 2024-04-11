return {
    { "nvim-telescope/telescope.nvim", name = "telescope", dependencies = "tsakirist/telescope-lazy.nvim" },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        "fdschmidt93/telescope-egrepify.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
}
