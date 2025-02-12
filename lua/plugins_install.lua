-- Auto install packer.nvim if it's not istalled, then run PackerSync (look at the end of file)
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

-- On Android 12+, only 32 shadow processes are allowed, so I had to limit them.
if string.match(os.getenv('HOME'), '.*com%.termux.*') then
    require('packer').init({ max_jobs = 25 })
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')
    -- Optimiser (should be on the top)
    use('lewis6991/impatient.nvim')

    -- ======================== Nvim LSP ========================
    -- LSP installer manager
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')
    use('neovim/nvim-lspconfig')
    -- Autocomplete
    -- Nvim-cmp
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('saadparwaiz1/cmp_luasnip')
    use('hrsh7th/cmp-nvim-lua')
    use('petertriho/cmp-git')
    -- Show function signature
    use('ray-x/lsp_signature.nvim')
    use('hrsh7th/cmp-nvim-lsp-signature-help')
    -- Better sorting
    use('lukas-reineke/cmp-under-comparator')
    -- Snippets
    use({
        'L3MON4D3/LuaSnip',
        -- follow latest release.
        tag = 'v<CurrentMajor>.*',
        -- install jsregexp (optional!:).
        -- run = 'make install_jsregexp'
    })
    -- Snippet collection
    use('rafamadriz/friendly-snippets')
    use('honza/vim-snippets')
    -- Watch LSP tags and symbols
    use('simrat39/symbols-outline.nvim')

    -- ======================== Utility ========================
    -- Code runner
    use({ 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' })
    -- Formatting
    use('jose-elias-alvarez/null-ls.nvim')
    -- Automatically creates missing dirs when saving a file
    use('jghauser/mkdir.nvim')
    -- Better folding
    use({ 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' })
    -- Git integration
    use('lewis6991/gitsigns.nvim')
    -- Start page
    use('nvimdev/dashboard-nvim')
    -- Better undo history
    use({
        'kevinhwang91/nvim-fundo',
        requires = 'kevinhwang91/promise-async',
        run = function()
            require('fundo').install()
        end,
    })
    -- Convert vim map to lua
    use({ 'thugcee/nvim-map-to-lua', opt = true, cmd = { 'ConvertMapToLua' } })
    -- Auto pairs
    use('windwp/nvim-autopairs')
    -- Paste digraphs
    use('protex/better-digraphs.nvim')
    -- Get startup time
    use('dstein64/vim-startuptime')
    -- Fast comments
    use('numToStr/Comment.nvim')
    -- Float terminal
    use('jiajiawang/fterm.nvim')
    -- Move lines
    use('fedepujol/move.nvim')
    -- use('willothy/moveline', { run = 'make' })
    -- Brackets edit
    use({
        'kylechui/nvim-surround',
        tag = '*', -- Use for stability; omit to use `main` branch for the latest features
    })
    -- Searcher
    use({
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
    })
    -- Pick symbols and insert them
    use('nvim-telescope/telescope-symbols.nvim')
    -- File explorer
    use('nvim-tree/nvim-tree.lua')
    -- Markdown preview
    use({
        'iamcco/markdown-preview.nvim',
        run = function()
            vim.fn['mkdp#util#install']()
        end,
    })

    -- ======================== Appearance ========================
    -- Highlight TODO FIXME HACK WARN PERF NOTE TEST comments
    use({
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
    })
    -- Show css colors, colorpicker
    use('uga-rosa/ccc.nvim')
    -- Highlight entered ranges
    use('winston0410/range-highlight.nvim')
    -- Required
    use('winston0410/cmd-parser.nvim')
    -- Highlight other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching
    use('RRethy/vim-illuminate')
    -- Awesome highlighting
    use({
        'nvim-treesitter/nvim-treesitter',
        run = function()
            -- To ignore error at first time
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    })
    -- Highlight arguments' definitions and usages
    use({
        'm-demare/hlargs.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter' },
    })
    -- Rainbow brackets
    use('hiphish/rainbow-delimiters.nvim')
    -- Awesome statusline
    use('nvim-lualine/lualine.nvim')
    -- Awesome bufferline
    use('akinsho/bufferline.nvim')
    -- Icons
    use({ 'nvim-tree/nvim-web-devicons', tag = 'nerd-v2-compat' })
    -- Themes
    use('navarasu/onedark.nvim')
    use('folke/tokyonight.nvim')
    use('marko-cerovac/material.nvim')
    use('rafamadriz/neon')
    use('projekt0n/github-nvim-theme')
    use('Mofiqul/vscode.nvim')
    use('tanvirtin/monokai.nvim')
    use('shaunsingh/nord.nvim')
    use('Mofiqul/dracula.nvim')
    use('kdheepak/monochrome.nvim')
    -- ======================== Other stuff ========================
    -- Cheat sheet
    use({
        'sudormrfbin/cheatsheet.nvim',
        requires = { 'nvim-lua/popup.nvim' },
        opt = true,
        cmd = { 'Cheatsheet', 'CheatsheetEdit' },
    })
    -- LOL
    use({ 'seandewar/nvimesweeper', opt = true, cmd = 'Nvimesweeper' }) -- :lua math.randomseed(os.time())
    use({ 'alec-gibson/nvim-tetris', opt = true, cmd = { 'Tetris' } })
    use({ 'ThePrimeagen/vim-be-good', opt = true, cmd = { 'VimBeGood' } })
    if packer_bootstrap then
        require('packer').sync()
    end
end)
