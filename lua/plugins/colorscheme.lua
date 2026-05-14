return {
  {
    "catppuccin/nvim",
    name="catppuccin",
    lazy=false,
  },
  {
    "cormacrelf/dark-notify",
    config = function()
      require("dark_notify").run({
        schemes = {
          light = { colorscheme = "catppuccin-latte" },
          dark = { colorscheme = "catppuccin-mocha" },
        },
      })
    end,
  }
}
