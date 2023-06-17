--[[------------------- resolution v0.1.0 -----------------------

all 'small tweak' plugins

-------------------------------------------------------------]]--

return {

----------- todo-comments: highlighted todo comments ------------
    {
        'folke/todo-comments.nvim',

        event = { 'BufReadPost', 'BufNewFile' },

        dependencies = {
            'nvim-lua/plenary.nvim'
        },

        opts = {
            keywords = {
                -- rsltn codebase
                FIX = {
                    icon = ' ',
                    color = 'error'
                },
                TODO = {
                    icon = ' ',
                    color = 'info'
                },
                WARN = {
                    icon = ' ',
                    color = 'warning'
                },
                NOTE = {
                    icon = ' ',
                    color = 'hint'
                },
                FIGURES = {
                    icon = ' ',
                    color = 'info',
                },
                COMP = {
                    icon = ' ',
                    color = 'info',
                },

                -- TeX
                FIGURE = {
                    icon = ' ',
                    color = 'info'
                },
                CITE = {
                    icon = ' ',
                    color = 'hint'
                },
                PROVE = {
                    icon = ' ',
                    color = 'error'
                },
            },
            gui_style = {
                fg = 'NONE',
                bg = 'BOLD',
            },
            colors = {
                error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
                warning = { 'DiagnosticWarn', 'WarningMsg', '#FBBF24' },
                info = { 'DiagnosticInfo', '#2563EB' },
                hint = { 'DiagnosticHint', '#10B981' },
                default = { 'Identifier', '#7C3AED' },
                test = { 'Identifier', '#FF00FF' }
            },
        }
    },

-------------- nvim-colorizer: coloring hex codes ---------------
    {
        'NvChad/nvim-colorizer.lua',

        event = { 'BufReadPost', 'BufNewFile' },

        config = function()
            require('colorizer').setup({
                user_default_options = {
                    RGB = true,
                    RRGGBB = true,
                    names = false,
                    RRGGBBAA = false,
                    AARRGGBB = false,
                    rgb_fn = false,
                    hsl_fn = false,
                    css = false,
                    css_fn = false,
                    mode = 'background',
                    tailwind = false,
                    sass = { enable = false, parsers = { 'css' }, },
                    always_update = false
                }
            })
        end
    },

-------- range-highlight.nvim: highlight cmdline ranges ---------
    {
        'winston0410/range-highlight.nvim',

        event = { 'BufReadPost', 'BufNewFile' },

        dependencies = {
            'winston0410/cmd-parser.nvim',
        },

        config = true
    },

---------- modicator.nvim: color changing line number -----------
    {
        'mawkler/modicator.nvim',

        event = { 'BufReadPost', 'BufNewFile' },

        config = true
    }
}

-----------------------------------------------------------------
