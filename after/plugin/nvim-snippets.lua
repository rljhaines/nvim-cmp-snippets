require("cmp").register_source("nvim-snippets", require("nvim-cmp-snippets").new())

local nvim-cmp-snippets = vim.api.nvim_create_augroup("nvim-cmp-snippets", {})

vim.api.nvim_create_autocmd("User", {
  pattern = "LuasnipCleanup",
  callback = function ()
    require("nvim-cmp-snippets").clear_cache()
  end,
  group = nvim-cmp-snippets
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LuasnipSnippetsAdded",
  callback = function ()
    require("nvim-cmp-snippets").refresh()
  end,
  group = nvim-cmp-snippets
})
