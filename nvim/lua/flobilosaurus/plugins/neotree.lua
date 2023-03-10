return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    keys = {
      { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
      require("neo-tree").setup {
        close_if_last_window = true,  -- Close Neo-tree if it is the last window left in the tab

        filesystem = {
          follow_current_file = true, -- This will find and focus the file in the active buffer every
        },
        buffers = {

          follow_current_file = true, -- This will find and focus the file in the active buffer every
        }
      }
    end
  }
}
