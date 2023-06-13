return {
    {
        'startup-nvim/startup.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local vertical_content = function(text, proportion)
                local height = math.floor(vim.o.lines * proportion) - #text - 1
                local finished_text = {}
                for i = 1, height, 1 do
                    finished_text[i] = ''
                end
                for i, v in ipairs(text) do
                    finished_text[height + i] = v
                end
                return finished_text
            end

            local header = {
                'ｒｅｓｏｌｕｔｉｏｎ',
                'ｖ０.１.０'
            }
            local center = {
                'ｂｙ ｒｏｂｉｎ'
            }

            require('startup').setup({
                header = {
                    type = 'text',
                    align = 'center',
                    margin = 0,
                    content = vertical_content(header, 0.25),
                    highlight = 'StartupHeader'
                },
                center = {
                    type = 'text',
                    align = 'center',
                    margin = 0,
                    content = vertical_content(center, 0.1),
                    highlight = 'StartupCenter'
                },
                footer = {
                    type = 'text',
                    align = 'center',
                    margin = 0,
                    content = vertical_content({ '.' }, 0.9),
                    highlight = 'StartupCenter'
                },
                options = {
                    cursor_column = 0.5,
                    disable_statuslines = true,
                },
                parts = { 'header', 'center', 'footer' },
            })
        end
    },

    -- lualine.nvim: status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local section_separators = {}
            if require('config.aesthetics').ui_sharp == true then
                section_separators = { left = '', right = '' }
            else
                section_separators = { left = '', right = '' }
            end

            require('lualine').setup({
                options = {
                    icons_enabled = true,
                    section_separators = section_separators,
                    component_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = { 'startup', 'TelescopePrompt', 'toggleterm' },
                        winbar = { 'startup', 'TelescopePrompt', 'toggleterm' },
                    },
                    always_divide_middle = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                    },
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'os.date("%d %b")' },
                    lualine_y = { 'os.date("%H:%M")' },
                    lualine_z = { 'searchcount', 'location' },
                },
                -- winbar = {
                -- lualine_c = {
                --     "navic",
                --     color_correction = nil,
                --     navic_opts = nil
                -- }
                -- },
            })
        end
    },

    -- bufferline.nvim: buffer line
    {
        'akinsho/bufferline.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require('bufferline').setup({
                options = {
                    always_show_bufferline = false,
                    offsets = {
                        {
                            filetype = "neo-tree",
                            highlight = "Directory",
                            separator = true
                        }
                    }
                },
            })
        end
    },
}
