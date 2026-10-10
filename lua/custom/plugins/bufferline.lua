-- VS Code style tab bar showing open buffers
-- https://github.com/akinsho/bufferline.nvim

-- <leader>1..9 jump to the tab at that position
local goto_keys = {}
for index = 1, 9 do
  table.insert(goto_keys, {
    '<leader>' .. index,
    '<cmd>BufferLineGoToBuffer ' .. index .. '<cr>',
    desc = 'which_key_ignore',
  })
end

-- Close a buffer without collapsing the window layout around it
local function close_buffer(bufnr)
  Snacks.bufdelete(bufnr)
end

return {
  'akinsho/bufferline.nvim',
  version = '*',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/snacks.nvim',
  },
  keys = vim.list_extend({
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous tab' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next tab' },
    { '<leader>b', nil, desc = '[B]uffer tabs' },
    { '<leader>bd', close_buffer, desc = '[D]elete (close) tab' },
    {
      '<leader>bo',
      function()
        Snacks.bufdelete.other()
      end,
      desc = 'Close [O]ther tabs',
    },
    { '<leader>bp', '<cmd>BufferLineTogglePin<cr>', desc = 'Toggle [P]in' },
    { '<leader>b]', '<cmd>BufferLineMoveNext<cr>', desc = 'Move tab right' },
    { '<leader>b[', '<cmd>BufferLineMovePrev<cr>', desc = 'Move tab left' },
    { '<leader>bb', '<cmd>BufferLinePick<cr>', desc = 'Pick tab by letter' },
  }, goto_keys),
  opts = {
    options = {
      close_command = close_buffer,
      right_mouse_command = close_buffer,
      middle_mouse_command = close_buffer,
      diagnostics = 'nvim_lsp',
      always_show_bufferline = true,
      -- Leave room for neo-tree so tabs start beside it, like the VS Code explorer
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Explorer',
          highlight = 'Directory',
          text_align = 'left',
          separator = true,
        },
      },
    },
  },
}
