return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim" ,
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config Release'
    }
  },
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("fzf")
  end,
  keys = {
    { "<leader>/", function () require("telescope").extensions.live_grep_args.live_grep_args({cwd = LazyVim.root.get()}) end, desc = "Grep (Root Dir)" },
    { "<leader>sg", function () require("telescope").extensions.live_grep_args.live_grep_args({cwd = LazyVim.root.get()}) end, desc = "Grep (Root Dir)" },
    { "<leader>sG", function () require("telescope").extensions.live_grep_args.live_grep_args() end,  desc = "Grep (cwd)" },
  }
}
