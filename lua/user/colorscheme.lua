-- local colorscheme = "onedarker"
-- local colorscheme = "darkplus"
-- local colorscheme = "tokyonight"
-- local colorscheme = "onedarkest"
-- local colorscheme = "codemonkey"
-- local colorscheme = "lunar"
-- local colorscheme = "spacedark"
-- local colorscheme = "rose-pine"
local colorscheme = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
