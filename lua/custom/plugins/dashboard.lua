-- Start screen shown when nvim is launched without a file
-- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md

-- Only show git panes when nvim was started inside a git repository
local function in_git_repo()
  return Snacks.git.get_root() ~= nil
end

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        -- Splash art: replace with your own ASCII art
        header = [[
███╗   ██╗██╗   ██╗██╗███╗   ███╗
████╗  ██║██║   ██║██║████╗ ████║
██╔██╗ ██║██║   ██║██║██╔████╔██║
██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        -- stylua: ignore
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'e', desc = 'File Explorer', action = ':Neotree reveal' },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy' },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = 1 },
        -- Git repos of recently opened files; selecting one cds there and opens the file finder
        { icon = ' ', title = 'Recent Projects', section = 'projects', indent = 2, padding = 1 },
        {
          icon = ' ',
          title = 'Git Status',
          section = 'terminal',
          enabled = in_git_repo,
          cmd = 'git --no-pager status --short --branch --renames',
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        {
          icon = ' ',
          title = 'Recent Commits',
          section = 'terminal',
          enabled = in_git_repo,
          cmd = 'git --no-pager log --oneline --no-decorate -5',
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = 'startup' },
      },
    },
  },
}
