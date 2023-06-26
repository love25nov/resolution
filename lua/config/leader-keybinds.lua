--[[------------------- resolution v0.1.0 -----------------------

defines keybinds for rsltn's main operations; these use the
<leader> key set in config.preferences

---------------------------------------------------------------]]

local prefs = require('config.preferences')

return {
    [''] = {
        desc = 'resolution',
        cmd = false,
    },

    --------------------------- top-level ---------------------------

    ['b'] = {
        desc = 'search [b]uffers',
        cmd = '<cmd> Telescope buffers <cr>'
    },
    -- ['c'] = {
    --     desc = '[c]omputational pop-up',
    --     mode = { 'n', 'v' },
    --     cmd = {
    --         require('computation.popup').mount,
    --         require('computation.popup').mount_from_visual
    --     },
    -- },
    ['c'] = {
        desc = '',
        mode = { 'n', 'v' },
        cmd = {
            require('computation.popup').mount,
            require('computation.popup').mount_from_visual
        },
    },
    ['d'] = {
        desc = '[d]elete buffer',
        cmd = require('core.ui').buf_del_wrapper
    },
    ['D'] = {
        desc = '[D]elete all buffers',
        cmd = function()
            vim.cmd('bufdo :Bdelete')
            require('mini.starter').open()
        end
    },
    ['e'] = {
        desc = '[e]xplore document',
        cmd = require('nvim-navbuddy').open
    },
    ['E'] = {
        desc = '[E]xplore files',
        cmd = '<cmd> NvimTreeFindFileToggle <cr>'
    },
    ['F'] = {
        desc = '[F]ormat code',
        cmd = function()
            if vim.bo.filetype == 'tex' then
                vim.cmd('write')
                print('Prettying with latexindent.')
                local filename = vim.fn.expand('%:p')
                local format_style_file = prefs.format_style_file
                vim.fn.system('latexindent -l '..format_style_file..' -m '..filename..' > '..filename..'-prettied')
                vim.fn.system('mv '..filename..'-prettied '..filename)
                vim.cmd('edit')
            else
                vim.lsp.buf.format()
            end
        end
    },
    ['h'] = {
        desc = '[h]elp and doc.',
        cmd = '<cmd> e ' .. vim.fn.stdpath('config') .. '/documentation.md <cr>'
    },
    ['j'] = {
        desc = '[j]ump in document',
        cmd = '<cmd> Telescope lsp_document_symbols <cr>'
    },
    ['J'] = {
        desc = '[J]ump in project',
        cmd = '<cmd> Telescope lsp_workspace_symbols <cr>'
    },
    ['L'] = {
        desc = '[L]atex compilation',
        cmd = '<cmd> VimtexCompile <cr>'
    },
    ['p'] = {
        desc = '[p]eek at reference',
        cmd = '<cmd> Lspsaga peek_definition <cr>',
    },
    ['q'] = {
        desc = '[q]uit/save',
        cmd = '<cmd> wq <cr>'
    },
    ['Q'] = {
        desc = '[q]uit/save all',
        cmd = '<cmd> wqa <cr>'
    },
    ['S'] = {
        desc = '[S]tart screen',
        cmd = require('mini.starter').open
    },
    ['t'] = {
        desc = '[t]erminal',
        cmd = '<cmd> ToggleTerm <cr>'
    },
    ['v'] = {
        desc = '[v]iew file in project',
        cmd = require('filesys.project_menu').file_menu_wrapper
    },
    ['V'] = {
        desc = '[V]iew project',
        cmd = require('filesys.project_menu').project_menu
    },

    ------------------------ preferences (p) ------------------------

    ['o'] = {
        desc = '[o]ptions',
        cmd = false,
    },
    ['oc'] = {
        desc = '[c]olorscheme',
        cmd = ''
    },
    ['od'] = {
        desc = 'Toggle dark mode',
        cmd = ''
    },
    ['ow'] = {
        desc = 'Toggle word wrap',
        cmd = ''
    },
    ['on'] = {
        desc = 'Toggle numbering',
        cmd = ''
    },
    ['or'] = {
        desc = 'Toggle relative numbering',
        cmd = ''
    },
    ['ov'] = {
        desc = 'Toggle virtual editing',
        cmd = ''
    },
    ['os'] = {
        desc = 'Toggle autosnippets',
        cmd = ''
    },
    ['om'] = {
        desc = 'Toggle autocomplete',
        cmd = ''
    },
    ['oi'] = {
        desc = 'Toggle autoindent',
        cmd = ''
    },
    ['ol'] = {
        desc = 'Toggle conceal',
        cmd = ''
    },
    ['oz'] = {
        desc = 'Toggle spell-checker',
        cmd = ''
    },

    -------------------------- search (s) ---------------------------

    ['s'] = {
        desc = '[s]earch',
        cmd = false,
    },
    ['se'] = {
        desc = 'System file [e]xplorer',
        cmd = '<cmd> call system("xdg-open "..expand("%:p:h"))<cr>'
    },
    ['sf'] = {
        desc = '[s]earch [f]iles (root)',
        cmd = '<cmd> Telescope find_files cwd=~ <cr>'
    },
    ['sh'] = {
        desc = '[s]earch [h]idden files (root)',
        cmd = '<cmd> Telescope find_files cwd=~ hidden=true <cr>'
    },
    ['sc'] = {
        desc = '[s]earch [c]ommand history',
        cmd = '<cmd> Telescope command_history <cr>'
    },
    ['ss'] = {
        desc = '[s]earch [s]earch history',
        cmd = '<cmd> Telescope search_history <cr>'
    },
    ['sm'] = {
        desc = '[s]earch/rep. [m]ulti. files',
        cmd = '<cmd> Spectre <cr>'
    },
    ['sg'] = {
        desc = '[g]rep in file',
        cmd = function()
            require('telescope.builtin').live_grep({ search_dirs = { vim.fn.expand('%:p') } })
        end,
    },
    ['sG'] = {
        desc = '[G]rep in project',
        cmd = function()
            require('telescope.builtin').live_grep({
                entry_maker = require('plugins.telescope.grep_entry_maker')({ path_hidden = false }) })
        end,
    },
    ['sw'] = {
        desc = 'grep [w]ord project',
        cmd = require('telescope.builtin').grep_string
    },
    ['sy'] = {
        desc = '[s]earch [y]anks',
        cmd = '<cmd> Telescope neoclip <cr>'
    },
    ['su'] = {
        desc = '[s]earch [u]ndo tree',
        cmd = '<cmd> Telescope undo <cr>'
    },

    ---------------------- file management (f) ----------------------

    ['f'] = {
        desc = '[f]ile management',
        cmd = false,
    },
    ['fc'] = {
        desc = '[c]reate project',
        cmd = false,
    },
    ['fa'] = {
        desc = '[a]rchive project',
        cmd = false,
    },
    ['fu'] = {
        desc = '[u]narchive project',
        cmd = false,
    },
    ['fe'] = {
        desc = '[e]dit project',
        cmd = false,
    },
    ['fn'] = {
        desc = '[n]ew file from template',
        cmd = false,
    },

    ----------------------- git and github (g) ----------------------

    ['g'] = {
        desc = '[g]it and github',
        cmd = false,
    },
    ['gl'] = {
        desc = '[l]azy[g]it',
        cmd = '<cmd> LazyGitCurrentFile <cr>',
    },
    ['ga'] = {
        desc = 'Update [a]ll reg. repos',
        cmd = false,
    },
    ['gb'] = {
        desc = 'Update [b]uilt-in repos',
        cmd = false,
    },
    ['gu'] = {
        desc = 'Update [u]ser repos',
        cmd = false,
    },
    ['gr'] = {
        desc = 'Create [r]epo from project',
        cmd = false,
    },
    ['gc'] = {
        desc = '[c]reate project from repo',
        cmd = false,
    },
    ['gp'] = {
        desc = 'Toggle file [p]ublicity',
        cmd = false,
    },
    ['gP'] = {
        desc = 'Toggle project [p]ublicity',
        cmd = false,
    },
    ['gh'] = {
        desc = 'Configure [g]it[h]ub user',
        cmd = false,
    },

    ---------------------- tex operations (t) -----------------------

    ['l'] = {
        desc = '[t]ex operations',
        cmd = false,
    },
    ['lc'] = {
        desc = '[l]atex [c]ite',
        cmd = false,
    },
    ['lm'] = {
        desc = '[l]atex [m]atrices',
        cmd = false,
    },
    ['lt'] = {
        desc = '[l]atex [t]tables',
        cmd = false,
    },
    ['lr'] = {
        desc = '[l]atex [r]eferences',
        cmd = false,
    },
    ['le'] = {
        desc = '[l]atex [e]rrors',
        cmd = false,
    },
    ['ls'] = {
        desc = '[l]atex sync[t]ex',
        cmd = false,
    },
    ['lx'] = {
        desc = '[l]atex clean au[x]',
        cmd = false,
    },

    ---------------------- tex extensions (x) -----------------------

    ['x'] = {
        desc = 'tex e[x]tensions',
        cmd = false,
    },
    ['xo'] = {
        desc = 'e[x]tension: [o]verleaf',
        cmd = false
    },
    ['xc'] = {
        desc = 'e[x]tension: [c]ommutative diagrams',
        cmd = false
    },
    ['xq'] = {
        desc = 'e[x]tension: [q]uantum circuits',
        cmd = false
    },
    ['xk'] = {
        desc = 'e[x]tension: [k]nots',
        cmd = false
    },
    ['xg'] = {
        desc = 'e[x]tension: [g]raphs',
        cmd = false
    },
    ['xt'] = {
        desc = 'e[x]tension: [t]ikz editor',
        cmd = false
    },
    ['xi'] = {
        desc = 'e[x]tension: [i]nkscape',
        cmd = false
    },

}

-----------------------------------------------------------------
