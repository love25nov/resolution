--[[------------------- resolution v0.1.0 ---------------------

a menu for choosing a project

-------------------------------------------------------------]]

------------------------- dependencies --------------------------

local config_filesys = require('config.advanced.filesys')
local utilities = require('filesys.menus.utilities')
local previewer = require('filesys.menus.project_previewer')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

--------------------------- main menu ---------------------------

local choose_project = function(opts)
    opts = opts or {}
    if opts.pick_files_after == nil then
        opts.pick_files_after = true
    end
    pickers.new(opts, {
        prompt_title = "Open Project",
        finder = finders.new_table {
            results = utilities.compile_project_infos(),
            entry_maker = function(entry)
                local icon = ' '
                for _, v in ipairs(config_filesys.project_icons) do
                    if v[1] == entry['type'] then
                        icon = v[2]
                    end
                end
                return {
                    value = entry,
                    display = icon .. '   ' .. entry['title'],
                    ordinal = entry['title'],
                }
            end
        },
        sorter = conf.generic_sorter(opts),
        previewer = previewer.new(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection ~= nil then
                    vim.cmd('cd ' .. utilities.trim_path_dir(selection['value']['filepath']))
                    if opts.pick_files_after == true then
                        require('filesys.menus.choose_files')()
                    elseif opts.callback_function ~= nil then
                        opts.callback_function({filepath = utilities.trim_path_dir(selection['value']['filepath'])})
                    end
                end
            end)
            return true
        end,
    }):find()
end

-----------------------------------------------------------------

return choose_project

-----------------------------------------------------------------
