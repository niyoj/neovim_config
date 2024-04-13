return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      event_handlers = {
        {
          event = "neo_tree_buffer_leave",
          handler = function()
            local shown_buffers = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              shown_buffers[vim.api.nvim_win_get_buf(win)] = true
            end
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if
                  not shown_buffers[buf]
                  and vim.api.nvim_buf_get_option(buf, "buftype") == "nofile"
                  and vim.api.nvim_buf_get_option(buf, "filetype") == "neo-tree"
              then
                vim.api.nvim_buf_delete(buf, {})
              end
            end
          end,
        },
      },
      close_if_last_window = true,
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = "A", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "✖", -- this can only be used in the git_status source
            renamed = "R", -- this can only be used in the git_status source
            -- Status type
            untracked = "U",
            ignored = "I",
            unstaged = "",
            staged = "A",
            conflict = "",
          },
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          never_show = {
            ".git",
            ".node_modules",
          },
        },
      },
    })
  end,
}
