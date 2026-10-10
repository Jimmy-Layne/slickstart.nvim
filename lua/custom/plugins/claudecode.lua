-- Claude Code IDE integration: runs Claude in a split and shows its edits as diffs
-- https://github.com/coder/claudecode.nvim

return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  config = true,
  -- Command stubs so `:ClaudeCode` etc. work before any keymap has loaded the plugin
  cmd = {
    'ClaudeCode',
    'ClaudeCodeFocus',
    'ClaudeCodeSelectModel',
    'ClaudeCodeAdd',
    'ClaudeCodeSend',
    'ClaudeCodeTreeAdd',
    'ClaudeCodeStatus',
    'ClaudeCodeStart',
    'ClaudeCodeStop',
    'ClaudeCodeOpen',
    'ClaudeCodeClose',
    'ClaudeCodeDiffAccept',
    'ClaudeCodeDiffDeny',
    'ClaudeCodeCloseAllDiffs',
  },
  keys = {
    { '<leader>a', nil, desc = '[A]I / Claude Code' },
    { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle [C]laude' },
    { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = '[F]ocus Claude' },
    { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = '[R]esume Claude session' },
    { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = '[C]ontinue last Claude session' },
    { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude [M]odel' },
    { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current [B]uffer' },
    { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = '[S]end selection to Claude' },
    { '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>', desc = 'Add file from tree', ft = { 'neo-tree' } },
    -- Reviewing Claude's proposed edits
    { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = '[A]ccept diff' },
    { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = '[D]eny diff' },
  },
}
