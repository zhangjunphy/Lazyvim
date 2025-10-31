-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local readOnlyPaths = {"$HOME/.local", "$HOME/.elan", "$HOME/.rustup", "$HOME/.npm", "$HOME/.cargo"};
local readOnlyAbsPath = {}
for _, p in ipairs(readOnlyPaths) do
  local path = vim.fn.expand(p)
  if vim.fn.isdirectory(p) then
    path = path .. "/*"
  end
  readOnlyAbsPath[#readOnlyAbsPath+1] = path
end
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = readOnlyAbsPath,
  callback = function ()
    vim.bo.readonly = true
    vim.bo.modifiable = false
  end,
})
