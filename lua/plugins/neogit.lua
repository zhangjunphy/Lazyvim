return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
  },
  keys = {
    {
      "<leader>gg",
      function ()
        require('neogit').open({cwd = LazyVim.root.get()})
      end,
      desc = "neogit"
    },
    {
      "<leader>gG",
      function ()
        require('neogit').open()
      end,
      desc = "neogit (cwd)"
    },
    {
      "<leader>gl",
      function ()
        require('neogit').action("log", "log_current", {cwd = LazyVim.root.get()})()
      end,
      desc = "Git Log (cwd)"
    },
    {
      "<leader>gL",
      function ()
        require('neogit').action("log", "log_current", {})()
      end,
      desc = "Git Log (cwd)"
    },
    {
      "<leader>gf",
      function ()
        require('neogit').action("log", "log_current", {"--", "%"})()
      end,
      desc = "Git Log (cwd)"
    },
  },
  init = function ()
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimKeymaps",
      once = true,
      callback = function ()
        pcall(vim.keymap.del, "n", "<leader>gs")
        pcall(vim.keymap.del, "n", "<leader>gc")
      end
    })
  end,
  config = true
}
