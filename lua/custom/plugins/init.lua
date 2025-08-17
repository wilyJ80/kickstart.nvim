-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'nvim-java/nvim-java',
  { 'akinsho/toggleterm.nvim', opts = {
    open_mapping = [[<F12>]],
    direction = 'float',
  } },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        '*', -- highlight all filetypes, or pick specific ones
      }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Blue", "red", etc.
        RRGGBBAA = true, -- #RRGGBBAA
        rgb_fn = true, -- rgb() and rgba() functions
        hsl_fn = true, -- hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, etc.
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn, etc.
      })
    end,
  },
}
