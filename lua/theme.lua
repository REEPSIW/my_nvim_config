local g = vim.g
-- One dark theme
require('onedark').setup {
    style = 'darker',
    transparent = false,
    code_style = {
        comments = 'none',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
    highlights = {
    String = {fg = '#de9623', fmt = 'none'},
    Comment = {fg = '#48b84d', fmt = 'none'},
    PunctBracket = {fg = '#000000', bg = '#Ac3146'}
    },
    -- toggle_style_key = '<leader>ts', -- Default keybinding to toggle
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},

}

-- Tokyo night
g.tokyonight_style = 'night'

-- Github-nvim-theme (light)
require('github-theme').setup({
  theme_style = 'light', -- dark/dimmed/dark_default/dark_colorblind/light/light_default/light_colorblind
  function_style = 'NONE',
  keyword_style = 'NONE',
  sidebars = {'qf', 'vista_kind', 'terminal', 'packer'},
})


-- ========== Setup ==========
-- Better background color
if vim.cmd[[ :silent colorscheme ]]=='nvcode' then
    vim.cmd [[ hi Normal guifg=#abb2bf ctermfg=249 guibg=#121212 ctermbg=234 gui=NONE cterm=NONE ]]
    vim.cmd [[ hi SignColumn guifg=NONE ctermfg=NONE guibg=#121212 ctermbg=234 gui=NONE cterm=NONE ]]
end
vim.cmd [[ colorscheme nvcode ]]
