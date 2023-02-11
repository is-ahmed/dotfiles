return require('packer').startup(function()
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- colorscheme
	use 'folke/tokyonight.nvim'
	
	-- LSP config
	use 'neovim/nvim-lspconfig'

	-- Status Line
	use {
	    'nvim-lualine/lualine.nvim',
	    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Treesitter; used for generating a concrete syntax tree for a file
	use {
	    'nvim-treesitter/nvim-treesitter',
	    run = ':TSUpdate'
    	}

	-- org-mode
	use {'nvim-orgmode/orgmode', config = function()
	  require('orgmode').setup{}
	  end
	}


	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} },
	  config = function() 
		  require('telescope').setup {
			pickers = {
				find_files = {
					find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
				}
			}	
		  }
	  end
	}

	-- Terminal Wrapper
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}

	-- Use Mason as a package manager for LSPs, DAP, Linter and formatter
	-- mason-lspconfig facilitates better communication between mason and lsp-config
	use { 
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}	


	-- Autocompletion
	use {
	 'hrsh7th/cmp-nvim-lsp',
	 'hrsh7th/cmp-buffer',
	 'hrsh7th/cmp-path',
	 'hrsh7th/cmp-cmdline',
	 'hrsh7th/nvim-cmp',
	 'hrsh7th/vim-vsnip',
	}

	-- Autopairs
	use {
	    "windwp/nvim-autopairs",
	    config = function() require("nvim-autopairs").setup {} end
	}

	-- trouble.nvim - get pretty list of all errors and messages
	use {
	  "folke/trouble.nvim",
	  config = function()
	    require("trouble").setup {
	      -- your configuration comes here
	      -- or leave it empty to use the default settings
	      -- refer to the configuration section below
	    }
	  end
	}

	-- vimtex
	use {
	    'lervag/vimtex',
	}

	use({
	  "utilyre/barbecue.nvim",
	  tag = "*",
	  requires = {
	    "SmiteshP/nvim-navic",
	  },
	  config = function()
	    require("barbecue").setup()
	  end,
	})

	use 'nvim-tree/nvim-web-devicons'
	use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

	-- Lua
	use({
	  "olimorris/persisted.nvim",
	  --module = "persisted", -- For lazy loading
	  config = function()
	    require("persisted").setup()
	  end,
	})

	use {'akinsho/org-bullets.nvim', config = function()
	  require('org-bullets').setup {
		concealcursor = true
	  }
	end}

	-- Packer
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

	use {
	  'lewis6991/gitsigns.nvim',
	  -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
		    config = function()
	    require('gitsigns').setup()
	  end
	}

	use { "anuvyklack/windows.nvim",
	   requires = {
	      "anuvyklack/middleclass",
	      "anuvyklack/animation.nvim"
	   },
	   config = function()
	      vim.o.winwidth = 10
	      vim.o.winminwidth = 10
	      vim.o.equalalways = false
	      require('windows').setup()
	   end
	}
end)
