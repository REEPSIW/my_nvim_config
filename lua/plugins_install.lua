return require('packer').startup(function(use)
--                         2 Plugins
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Optimiser (should be on the top)
    use 'lewis6991/impatient.nvim'



-- ======================== Nvim LSP ======================== 
--                         16 Plugins
    -- LSP installer manager
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
        -- Autocomplete
            -- Nvim-cmp
            use 'hrsh7th/nvim-cmp'
            use 'hrsh7th/cmp-nvim-lsp'
            use 'hrsh7th/cmp-buffer'
            use 'hrsh7th/cmp-path'
            -- use 'hrsh7th/cmp-cmdline'
            use 'saadparwaiz1/cmp_luasnip'
            use 'hrsh7th/cmp-nvim-lua'
            use 'petertriho/cmp-git'
                -- Better sorting
                use 'lukas-reineke/cmp-under-comparator'
            -- CMD autocomplete
            use 'gelguy/wilder.nvim'
                -- Required 
                use 'romgrk/fzy-lua-native'
        -- Snippets
        use({
            'L3MON4D3/LuaSnip',
            -- follow latest release.
            tag = 'v<CurrentMajor>.*',
            -- install jsregexp (optional!:).
            -- run = 'make install_jsregexp'
        })
            -- Snippet collection
             use 'rafamadriz/friendly-snippets'
             use 'honza/vim-snippets'
        -- Watch LSP tags and symbols
        use 'liuchengxu/vista.vim'



-- ======================== Utility ========================
--                          16 Plugins
        -- Code runner
        use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }
        -- Formatting
        use 'jose-elias-alvarez/null-ls.nvim'
        -- Automatically creates missing dirs when saving a file
        use 'jghauser/mkdir.nvim'
        -- Git integration
        use 'lewis6991/gitsigns.nvim'
        -- Start page
        use 'glepnir/dashboard-nvim'
        -- Convert vim map to lua
        use 'thugcee/nvim-map-to-lua' -- :ConvertMapToLua
        -- Auto pairs
        use 'windwp/nvim-autopairs'
        -- Get startup time
        use 'dstein64/vim-startuptime'
        -- Fast comments
        use {
            'numToStr/Comment.nvim',
        }
        -- Float terminal
        use 'jiajiawang/fterm.nvim'
        -- Move lines
        use 'fedepujol/move.nvim'
        -- Brackets edit
        use({
            'kylechui/nvim-surround',
            tag = '*', -- Use for stability; omit to use `main` branch for the latest features
        })
        -- Searcher
        use {
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        -- File explorer
        use 'kyazdani42/nvim-tree.lua'
        -- Markdown preview
        use({
            'iamcco/markdown-preview.nvim',
            run = function() vim.fn['mkdp#util#install']() end,
        })



-- ======================== Appearance ========================
--                          21 Plugins
        -- Highlight TODO FIXME HACK WARN PERF NOTE TEST comments
        use {
            'folke/todo-comments.nvim',
            requires = 'nvim-lua/plenary.nvim'
        }
        -- Show css colors, colorpicker
        use 'uga-rosa/ccc.nvim'
        -- Highlight entered ranges
        use 'winston0410/range-highlight.nvim'
            -- Required
             use 'winston0410/cmd-parser.nvim'
        -- Awesome highlighting
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                -- To ignore error at first time
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }
        -- Highlight arguments' definitions and usages
        use {
            'm-demare/hlargs.nvim',
            requires = { 'nvim-treesitter/nvim-treesitter' }
        }
        -- Rainbow brackets
        -- use 'p00f/nvim-ts-rainbow'
        -- p00f/nvim-ts-rainbow is no longer maintained, I decided to use fork above:
        -- You may stay on p00f/nvim-ts-rainbow if you want
        use 'mrjones2014/nvim-ts-rainbow'
        -- Awesome statusline
        use 'nvim-lualine/lualine.nvim'
        -- Awesome bufferline
        use 'akinsho/bufferline.nvim'
        -- Icons
        use 'nvim-tree/nvim-web-devicons'
        -- Themes
        use 'navarasu/onedark.nvim'
        use 'folke/tokyonight.nvim'
        use 'marko-cerovac/material.nvim'
        use 'rafamadriz/neon'
        use 'tjdevries/colorbuddy.vim'
        use 'Th3Whit3Wolf/onebuddy'
        use 'projekt0n/github-nvim-theme'
        use 'Mofiqul/vscode.nvim'
        use 'tanvirtin/monokai.nvim'
        use 'shaunsingh/nord.nvim'
        use 'Mofiqul/dracula.nvim'



-- ======================== Other stuff ======================== 
--                          5 Plugins
        -- Cheat sheet
        use 'sudormrfbin/cheatsheet.nvim'
            -- Required
            use 'nvim-lua/popup.nvim'
        -- LOL
            use 'seandewar/nvimesweeper' -- :Nvimesweeper, :lua math.randomseed(os.time())
            use 'alec-gibson/nvim-tetris' -- :Tetris
            use 'ThePrimeagen/vim-be-good'

end)
