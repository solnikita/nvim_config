local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  return
end
local keymap = vim.keymap.set

saga.setup({
  symbol_in_winbar = {
    enable = false,
  }
})

-- Only jump to error
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

