-- ================================================================================================
-- TITLE : telescope.nvim
-- LINKS :
--   > github : https://github.com/nvim-telescope/telescope.nvim
-- ABOUT : highly extandable fuzzy finder over lists
-- ================================================================================================

return {
    "nvim-telescope/telescope.nvim",
    enabled = false,
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    ".git/",
                    "dist/",
                    "build/",
                    ".cache",
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        -- Load the C-based fzf extension
        telescope.load_extension("fzf")

        -- Set keymaps
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope Live Grep" })
    end,
}
