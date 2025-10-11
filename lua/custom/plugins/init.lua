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
  {
    'anurag3301/nvim-platformio.lua',
    -- cmd = { 'Pioinit', 'Piorun', 'Piocmdh', 'Piocmdf', 'Piolib', 'Piomon', 'Piodebug', 'Piodb' },

    -- optional: cond used to enable/disable platformio
    -- based on existance of platformio.ini file and .pio folder in cwd.
    -- You can enable platformio plugin, using :Pioinit command
    cond = function()
      -- local platformioRootDir = vim.fs.root(vim.fn.getcwd(), { 'platformio.ini' }) -- cwd and parents
      local platformioRootDir = (vim.fn.filereadable 'platformio.ini' == 1) and vim.fn.getcwd() or nil
      if platformioRootDir and vim.fs.find('.pio', { path = platformioRootDir, type = 'directory' })[1] then
        -- if platformio.ini file and .pio folder exist in cwd, enable plugin to install plugin (if not istalled) and load it.
        vim.g.platformioRootDir = platformioRootDir
      elseif (vim.uv or vim.loop).fs_stat(vim.fn.stdpath 'data' .. '/lazy/nvim-platformio.lua') == nil then
        -- if nvim-platformio not installed, enable plugin to install it first time
        vim.g.platformioRootDir = vim.fn.getcwd()
      else -- if nvim-platformio.lua installed but disabled, create Pioinit command
        vim.api.nvim_create_user_command('Pioinit', function() --available only if no platformio.ini and .pio in cwd
          vim.api.nvim_create_autocmd('User', {
            pattern = { 'LazyRestore', 'LazyLoad' },
            once = true,
            callback = function(args)
              if args.match == 'LazyRestore' then
                require('lazy').load { plugins = { 'nvim-platformio.lua' } }
              elseif args.match == 'LazyLoad' then
                vim.notify('PlatformIO loaded', vim.log.levels.INFO, { title = 'PlatformIO' })
                vim.cmd 'Pioinit'
              end
            end,
          })
          vim.g.platformioRootDir = vim.fn.getcwd()
          require('lazy').restore { plguins = { 'nvim-platformio.lua' }, show = false }
        end, {})
      end
      return vim.g.platformioRootDir ~= nil
    end,

    -- Dependencies are lazy-loaded by default unless specified otherwise.
    dependencies = {
      { 'akinsho/toggleterm.nvim' },
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'folke/which-key.nvim' },
    },
    config = function()
      require('platformio').setup {
        lsp = 'clangd', --default: ccls, other option: clangd
        -- If you pick clangd, it also creates compile_commands.json
      }
    end,
  },
}
