-- After applying dotfiles:
-- nvim --headless -u ~/.config/nvim/init.lua -l tests/check_nvim_tools.lua
local ok, err = pcall(function()
  for _, command in ipairs({ "node", "neovim-node-host", "prettierd", "ruff", "pynvim-python", "fzf" }) do
    assert(vim.fn.executable(command) == 1, "Missing " .. command)
  end
  assert(vim.fn.has("python3") == 1, "Python provider unavailable")
  assert(vim.fn.py3eval("1 + 1") == 2)
  -- Checking PATH alone misses shell shims that the Node provider cannot execute.
  assert(vim.fn["remote#host#Require"]("node") > 0, "Node provider unavailable")
  assert(vim.fn.system({ "ruff", "format", "-" }, "x=1") == "x = 1\n")
  local formatted = vim.fn.system({ "prettierd", vim.fn.tempname() .. ".js" }, "const x={a:1}")
  assert(vim.v.shell_error == 0, formatted)
  assert(formatted:find("const x = { a: 1 };", 1, true), formatted)
end)
if not ok then
  print(err)
  vim.cmd("cquit")
end
print("OK: Neovim providers and formatters")
