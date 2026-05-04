return {
  { "teatek/gdscript-extended-lsp.nvim", opts = { view_type = "floating", picker = "snacks" } },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "gdscript" })
      end
    end,
  },
}
