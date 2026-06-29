-- ================================================================================================
-- TITLE : vim-tmux-navigator
-- ABOUT : Seamless navigation between Vim splits and tmux panes using the same shortcuts.
-- LINKS :
--   > github : https://github.com/christoomey/vim-tmux-navigator
-- ================================================================================================

return {
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
    },
    keys = {
        { "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
        { "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
        { "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
        { "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
        { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
}
