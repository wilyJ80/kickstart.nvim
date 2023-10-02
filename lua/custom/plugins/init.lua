-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		-- amongst your other plugins
		--{'akinsho/toggleterm.nvim', version = "*", config = true}
		-- or
		{
			'akinsho/toggleterm.nvim',
			version = "*",
			opts = {
				size = 10,
				open_mapping = [[<F12>]],
				shading_factor = 2,
				direction = "float",
				float_opts = {
					border = "curved",
					highlights = { border = "Normal", background = "Normal" },
				},
			}
		},

		{
			'windwp/nvim-autopairs',
			event = "InsertEnter",
			opts = {} -- this is equalent to setup({}) function
		},

		{
			'karb94/neoscroll.nvim',
			mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
				'<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
			hide_cursor = true,
			stop_eof = true,
			respect_scrollof = false,
			cursos_scrolls_alone = true,
			easing_function = nil,
			pre_hook = nil,
			post_hook = nil,
			performance_mode = false,
			opts = {}
		},

		{
			'mfussenegger/nvim-jdtls'
		}
	}
}
