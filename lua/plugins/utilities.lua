--[[------------------- resolution v0.1.0 -----------------------

utilities plugins

-------------------------------------------------------------]]--

return {

------------ vim-startuptime: startup time measurer -------------
    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
}

-----------------------------------------------------------------
