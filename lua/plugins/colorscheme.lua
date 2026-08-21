return {
  {
    "catppuccin/nvim",
    name="catppuccin",
    opts = {
      flavour="auto",
      background={
        light="latte",
        dark="mocha"
      },
    },
    lazy=false,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  }
}
