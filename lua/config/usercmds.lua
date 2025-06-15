vim.api.nvim_create_user_command("CopyBreakPoint",
  function()
    local root = LazyVim.root.get()
    local relative = vim.fn.expand("%:" .. root .. ":.")
    local line = vim.fn.getcurpos()[2]
    local bp_str = relative .. ":" .. line
    vim.fn.getreginfo("+");
    vim.fn.setreg("+", bp_str)
  end, {})

vim.api.nvim_create_user_command("CopyGitBranch",
  function()
    local branch = vim.fn.system("git --no-pager --no-optional-locks --literal-pathspecs -c gc.auto=0 branch --show-current")
    vim.fn.setreg("+", branch)
  end, {})
