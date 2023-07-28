--[[--------------------------- resolution v0.1.0 ------------------------------

resolution is a Neovim config for writing TeX and doing computational math.

This file implements a menu for choosing a project.

Copyright (C) 2023 Roshan Truax

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) at any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

------------------------------------------------------------------------------]]

--------------------------------- dependencies ---------------------------------

local core_utils = require('core.utilities')
local project_picker = require('filesys.project_picker')
local project_previewer = require('filesys.project_previewer')

------------------------------- action function --------------------------------

local action_function = function(selection, opts)
    -- check for exit
    if selection ~= nil then
        -- enter directory
        vim.cmd('cd ' .. core_utils.trim_path_dir(selection['value']['filepath']))
        if opts.pick_files_after == true then
            -- pick file if required
            require('filesys.menus.choose_files')()
        elseif opts.callback_function ~= nil then
            -- callback function if required
            opts.callback_function({ filepath = core_utils.trim_path_dir(selection['value']['filepath']) })
        end
    end
end

-------------------------------- create picker ---------------------------------

local choose_project = project_picker('Open Project', project_previewer, action_function)

--------------------------------------------------------------------------------

return choose_project

--------------------------------------------------------------------------------