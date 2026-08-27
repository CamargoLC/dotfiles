require('config.options')
vim.opt.guicursor = "a:ver25"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "xero/miasma.nvim", lazy = false, priority = 1000 },

  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },

  {
    "dense-analysis/ale",
    config = function()
      vim.g.ale_sign_error = '❌'
      vim.g.ale_sign_warning = '⚠️'
      vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
      vim.g.ale_sign_column_always = 1
    end
  }
})

vim.cmd("colorscheme miasma")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
