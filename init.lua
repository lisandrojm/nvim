require "user.keymaps"
require "user.plugins"
require "user.autocommands"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.quickscope"
require "user.hop"
require "user.matchup"
require "user.numb"
require "user.dial"
require "user.colorizer"
require "user.spectre"
-- require "user.zen-mode"
require "user.neoscroll"
require "user.todo-comments"
require "user.bookmark"
require "user.renamer"
require "user.symbol-outline"
require "user.git-blame"
require "user.gist"
require "user.gitlinker"
require "user.surround"
require "user.notify"
require "user.ts-context"
require "user.registers"
require "user.telescope-file-browser"
require "user.sniprun"
require "user.functions"
require "user.copilot"
require "user.gps"
require "user.illuminate"
require "user.dap"
require "user.lir"
require "user.jabs"
require "user.cybu"
require "user.winbar"
require "user.options"
require "user.nvim-webdev-icons"


if vim.fn.has "wsl" == 1 then
  vim.g.clipboard = {
    copy = {
      ["+"] = "win32yank.exe -i --crlf", 
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
  }
end
