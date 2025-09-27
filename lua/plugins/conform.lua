local function format_hunks(bufnr)
  local format = require("conform").format

  local hunks = require("gitsigns").get_hunks(bufnr)
  if hunks == nil then
    return
  end
  for _, hunk in ipairs(hunks) do
    if hunk.type == "delete" then
      goto continue
    end

    local start = hunk.added.start
    local last = start + hunk.added.count
    -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
    local last_hunk_line = vim.api.nvim_buf_get_lines(bufnr, last - 2, last - 1, true)[1]
    local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
    format({ range = range, async = false, lsp_fallback = true, bufnr = bufnr })
    ::continue::
  end

  vim.notify("done formatting git hunks", vim.log.levels.TRACE, { title = "formatting" })
end

return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  init = function()
    -- Install the conform formatter on VeryLazy
    LazyVim.on_very_lazy(function()
      LazyVim.format.register({
        name = "conform.nvim",
        priority = 100,
        primary = true,
        format = function(buf)
          format_hunks(buf)
        end,
        sources = function(buf)
          local ret = require("conform").list_formatters(buf)
          ---@param v conform.FormatterInfo
          return vim.tbl_map(function(v)
            return v.name
          end, ret)
        end,
      })
    end)
  end,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      cpp = { "clang-format" },
    },
  },
}
