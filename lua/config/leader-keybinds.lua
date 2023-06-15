--[[
resolution v0.1.0
this file defines the keybinds for rsltn's main operations
these use the <leader> key
--]]

return {

--------------------------- top-level ---------------------------

    ['a'] = {
        desc = 'toggle [a]utosnippets',
        cmd = ''
    },
    ['d'] = {
        desc = '[d]elete buffer',
        cmd = '<cmd> bd <cr>'
    },
    ['e'] = {
        desc = 'file explorer',
        cmd = ''
    },
    ['h'] = {
        desc = '[h]help and documentation',
        cmd = ''
    },
    ['j'] = {
        desc = '[j]ump list',
        cmd = require("nvim-navbuddy").open()
    },
    ['J'] = {
        desc = 'flat [J]ump list',
        cmd = ''
    },
    ['l'] = {
        desc = '[l]atex compilation',
        cmd = '<cmd> VimtexCompile <cr>'
    },
    ['m'] = {
        desc = 'open [m]ath project',
        cmd = ''
    },
    ['n'] = {
        desc = 'the [n]apkin',
        cmd = ''
    },
    ['N'] = {
        desc = 'the [N]otebook',
        cmd = ''
    },
    ['q'] = {
        desc = '[q]uit/save all',
        cmd = '<cmd> wqa <cr>'
    },
    ['T'] = {
        desc = '[t]erminal',
        cmd = '<cmd> ToggleTerm <cr>'
    },
    ['v'] = {
        desc = '[v]iew file in project',
        cmd = ''
    },

-------------------------- windows (w) --------------------------

    ['w+'] = {
        desc = 'increase win. height',
        cmd = ''
    },
    ['w-'] = {
        desc = 'decrease win. height',
        cmd = ''
    },
    ['w>'] = {
        desc = 'increase win. width',
        cmd = ''
    },
    ['w<'] = {
        desc = 'decrease win. height',
        cmd = ''
    },
    ['w_'] = {
        desc = 'maximize win. height',
        cmd = ''
    },
    ['w|'] = {
        desc = 'maximize win. width',
        cmd = ''
    },
    ['w='] = {
        desc = 'equalize windows',
        cmd = ''
    },
    ['wq'] = {
        desc = 'close window',
        cmd = ''
    },
    ['wo'] = {
        desc = 'close other windows',
        cmd = ''
    },
    ['wh'] = {
        desc = 'horizontal split',
        cmd = ''
    },
    ['wv'] = {
        desc = 'vertical split',
        cmd = ''
    },
    ['ws'] = {
        desc = 'swap windows',
        cmd = ''
    },

-------------------------- buffers (b) --------------------------

    ['bp'] = {
        desc = 'pin buffer',
        cmd = ''
    },
    ['bs'] = {
        desc = 'pick buffer',
        cmd = ''
    },
    ['bd'] = {
        desc = 'pick and delete buffer',
        cmd = ''
    },
    ['br'] = {
        desc = 'remember session',
        cmd = ''
    },
    ['bS'] = {
        desc = 'search sessions',,
        cmd = ''
    },

------------------------ preferences (p) ------------------------


    ['pc'] = {
        desc = 'choose colorscheme',
        cmd = ''
    },
    ['pd'] = {
        desc = 'toggle dark mode',
        cmd = ''
    },
    ['pw'] = {
        desc = 'toggle word wrap',
        cmd = ''
    },
    ['pn'] = {
        desc = 'toggle numbering',
        cmd = ''
    },
    ['pr'] = {
        desc = 'toggle relative numbering',
        cmd = ''
    },
    ['pv'] = {
        desc = 'toggle virtual editing',
        cmd = ''
    },
    ['ps'] = {
        desc = 'toggle autosnippets',
        cmd = ''
    },
    ['pm'] = {
        desc = 'toggle autocomplete',
        cmd = ''
    },
    ['pi'] = {
        desc = 'toggle autoindent',
        cmd = ''
    },
    ['pl'] = {
        desc = 'toggle conceal',
        cmd = ''
    },
    ['pz'] = {
        desc = 'toggle spell-checker',
        cmd = ''
    },

-------------------------- search (s) ---------------------------

    ['se'] = {
        desc = 'system file [e]xplorer',
        cmd = ''
    },
    ['sf'] = {
        desc = 'search [f]iles (root)',
        cmd = ''
    },
    ['sh'] = {
        desc = 'search [h]idden files (root)',
        cmd = ''
    },
    ['sc'] = {
        desc = 'search [c]ommand history',
        cmd = ''
    },
    ['ss'] = {
        desc = 'search [s]earch history',
        cmd = ''
    },
    ['sm'] = {
        desc = 'search/replace [m]ultiple files',
        cmd = ''
    },
    ['sg'] = {
        desc = '[g]rep in file',
        cmd = ''
    },
    ['sG'] = {
        desc = '[G]rep in project',
        cmd = ''
    },
    ['sr'] = {
        desc = '[r]esume search',
        cmd = ''
    },
    ['sb'] = {
        desc = 'search [b]ookmarks',
        cmd = ''
    },
    ['sy'] = {
        desc = 'search [y]anks',
        cmd = ''
    },
    ['su'] = {
        desc = 'search [u]ndo',
        cmd = ''
    },

---------------------- file management (f) ----------------------



---------------------- tex operations (t) -----------------------



---------------------- code operations (c) ----------------------



---------------------- tex extensions (x) -----------------------



}

