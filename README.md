# cmp_luasnip

[nvim-snippets](https://github.com/rljhaines/nvim-snippets) completion source for [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

```lua
-- Installation
use { 'rljhaines/nvim-snippets' }
use {
  'hrsh7th/nvim-cmp',
  config = function ()
    require'cmp'.setup {
    snippet = {
      expand = function(args)
        require('nvim-snippets').lsp_expand(args.body)
      end
    },

    sources = {
      { name = 'nvim-snippets' },
      -- more sources
    },
  }
  end
}
use { 'rljhaines/nvim-cmp-snippets' }
```

To disable filtering completion candidates by snippet's `show_condition`
use the following options in `sources`:

```lua
sources = {
  { name = 'nvim-snippets', option = { use_show_condition = false } },
  -- more sources
},
```

This can also be configured on per-buffer basis as described in cmp's README
[here](https://github.com/hrsh7th/nvim-cmp#how-to-disable-nvim-cmp-on-the-specific-buffer)
and [here](https://github.com/hrsh7th/nvim-cmp#sources-type-tablecmpsourceconfig).

The same way you can de-/activate whether autosnippets should be included in the
completion list or not (including them can be a bit problematic since when you
select the entry, the text gets inserted and the snippet automatically
triggers). This option defaults to `false` to be backwards compatible. Example:

```lua
sources = {
  { name = 'nvim-snippets', option = { show_autosnippets = true } },
  -- more sources
},
```

Hint: If you want to just hide some autosnippets consider the `hidden` option of
nvim-snippets
