---------------------------------------------
-- Install packer
---------------------------------------------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.api.nvim_exec(
  [[
    augroup Packer
      autocmd!
      autocmd BufWritePost init.lua PackerCompile
    augroup end
  ]],
  false
)


---------------------------------------------
-- Plugins installation
---------------------------------------------
require('packer').startup(function(use)
  use 'nvim-lua/plenary.nvim'
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({})
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        }
      })
    end
  }

  use 'itchyny/lightline.vim'

  use 'christoomey/vim-tmux-navigator'
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use {
    'ojroques/nvim-lspfuzzy',
    requires = {
      { 'junegunn/fzf' },
      { 'junegunn/fzf.vim' },
    }
  }
  use { 'gfanto/fzf-lsp.nvim' }
  use 'mbbill/undotree'
  use 'norcalli/nvim-colorizer.lua'

  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'nvim-tree/nvim-tree.lua'
  use 'windwp/nvim-autopairs'

  use 'kdheepak/lazygit.nvim'
  use 'tpope/vim-fugitive'

  use 'tpope/vim-surround'
  use 'vim-scripts/LargeFile'

  use 'alehatsman/vim-monokai'
  --use 'cocopon/colorswatch.vim'
  --use 'tjdevries/colorbuddy.nvim'

  use {
    'simrat39/rust-tools.nvim',
    ft = { 'rust' },
    config = function()
      require('rust-tools').setup({
        hover_actions = {
          border = 'none',
        }
      })
    end
  }

  use { 'fatih/vim-go', ft = { 'go' } }
  use { 'Olical/conjure', branch = 'develop', ft = { 'clj', 'cljs', 'clojure' } }

  use 'neovim/nvim-lspconfig'
  use 'tjdevries/lsp_extensions.nvim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use "rafamadriz/friendly-snippets"

  use 'ray-x/lsp_signature.nvim'

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-context'

  use 'zeertzjq/nvim-paste-fix'

  use 'github/copilot.vim'

  -- debugging
  use 'mfussenegger/nvim-dap'
  use { "mxsdev/nvim-dap-vscode-js" }
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'leoluz/nvim-dap-go'
  use 'mfussenegger/nvim-dap-python'
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile"
  }

  use 'wfxr/minimap.vim'
  use 'wbthomason/packer.nvim'

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })

  use "jose-elias-alvarez/null-ls.nvim"
  use "lukas-reineke/lsp-format.nvim"

  use({
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end,
    ft = { "lua" },
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)


---------------------------------------------
-- General configuration
---------------------------------------------
vim.o.syntax      = 'on' -- enable sytax highlight
vim.o.fileformat  = 'unix' -- always use unix <EOL>
vim.o.langmenu    = 'en_US' -- use en as language menu
vim.o.hidden      = true -- be able to switch buffers without file save
vim.o.showcmd     = true -- shows command in the last line
vim.o.startofline = false -- some command move to the first non-blank line
vim.wo.number     = true -- line number on
vim.o.clipboard   = 'unnamedplus' -- allow copy paste system <-> nvim
vim.o.exrc        = true -- enable project specific .nvimrc files
vim.o.secure      = true -- disable write/shell commands in those files
vim.o.splitbelow  = true -- put the new window below the current one
vim.o.splitright  = true -- put the new window right of the current one
vim.o.incsearch   = true -- search as you type
vim.o.cursorline  = true -- highlight current line
vim.o.shortmess   = vim.o.shortmess .. 'c' -- don't give completion messages
vim.o.updatetime  = 50
vim.o.swapfile    = false -- don't create swap files
vim.o.backup      = false -- don't create backup files
vim.o.writebackup = false -- for more info see backup table
-- vim.go.signcolumn   = 'auto'          -- always show sign column
vim.o.scrolloff   = 8
vim.o.showmode    = false -- hide --INSERT--
vim.o.undodir     = '~/.config/nvim/undodir'
vim.o.completeopt = 'menu,menuone,noinsert'

-- Color
vim.o.termguicolors = true -- use gui 24-bit colors, gui attrs instead of cterm
vim.go.t_Co = '256'
vim.o.background = 'dark'

-- Identation
vim.o.autoindent = true -- copy indent from current line when starting a new line
vim.o.smarttab = true -- <Tab> in front of a line inserts blanks according to 'shiftwidth'
vim.o.expandtab = true -- spaces instead of tabs
vim.o.softtabstop = 2 -- the number of spaces to use when expanding tabs
vim.o.shiftwidth = 2 -- the number of spaces to use when indenting -- or de-indenting -- a line
vim.o.tabstop = 2 -- the number of spaces that a tab equates to

-- Folding
vim.o.foldmethod = 'expr' -- fold is defined by treesiter expressions
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldcolumn = '0' -- width of fold column
vim.o.foldlevelstart = 99 -- don't close folds
vim.o.colorcolumn = '80' -- visualize max line width

vim.o.laststatus = 3

vim.g.AutoPairsFlyMode = 1

vim.g.mapleader = ' '
vim.g.maplocalleader = vim.api.nvim_replace_termcodes('<tab>', true, true, true) -- wtf is this

vim.g.colors_name = 'monokai'
vim.cmd [[
  silent! colorscheme monokai
]]

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-autopairs').setup {
  enable_check_bracket_line = false
}

-- autocomplete
vim.g.completion_enable_auto_popup = 0 -- disable automatic autocomplete popup
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

vim.g.vim_json_syntax_conceal = 0

vim.g.mouse = nil


---------------------------------------------
-- Autocomplete
---------------------------------------------
local cmp = require 'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
  completion = {
    autocomplete = false,
    completeopt = 'menu,menuone,noinsert'
  },
  experimental = {
    native_menu = false,
    ghost_text = false
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        cmp.complete()
      end
    end, { 'i', 's' }),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        cmp.complete()
      end
    end, { 'i', 's' }),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true, }),
  },
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
    },
    {
      name = 'path',
    },
    { name = 'vsnip' },
    {
      name = 'buffer',
      keyword_length = 5,
      max_item_count = 10,
    },
  }),
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,

      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

})

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
local capabilities = require('cmp_nvim_lsp').default_capabilities()


---------------------------------------------
-- Language Server Protocol
---------------------------------------------
local lspconfig = require 'lspconfig'

local api = vim.api

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  virtual_text = true, --{ spacing = 4 },
  signs = true,
  update_in_insert = false,
}
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
  -- Use a sharp border with `FloatBorder` highlights
  border = 'none'
}
)

local lsp_signature = require 'lsp_signature'
lsp_signature.setup({
  hint_prefix = '',
  hint_enable = false,
  handler_opts = {
    border = 'none'
  },
  hi_parameter = "Visual",
  trigger_on_newline = false,
  toggle_key = '<M-x>'
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    vim.lsp.buf.format({ async = true })
  end
})

local lsp_format = require("lsp-format")
lsp_format.setup {}

function on_attach(client, bufnr)
  --require'completion'.on_attach(client, bufnr)
  --api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  lsp_signature.on_attach(client, bufnr)
  lsp_format.on_attach(client, bufnr)
end

local setup_config = { on_attach = on_attach, capabilities = capabilities }

lspconfig.terraformls.setup(setup_config)
lspconfig.gopls.setup(setup_config)
lspconfig.tsserver.setup(setup_config)
lspconfig.clojure_lsp.setup(setup_config)
lspconfig.rust_analyzer.setup(setup_config)
lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.pylsp.setup({
  cmd = { "./.venv/bin/pylsp" },
  on_attach = on_attach,
  capabilities = capabilities,
})

---------------------------------------------
-- Linters / Fixers / Formatters
---------------------------------------------
local function has_eslint_config()
  local eslintrc = vim.fn.glob(".eslintrc*")
  return eslintrc ~= ""
end

local function is_prettier_executable()
  return vim.fn.executable("prettier") == 1 or vim.fn.executable("./node_modules/.bin/prettier") == 1
end

local null_ls = require("null-ls")
local null_ls_sources = {
  null_ls.builtins.diagnostics.tsc,
  null_ls.builtins.formatting.jq,
}

if is_prettier_executable() then
  table.insert(null_ls_sources, null_ls.builtins.formatting.prettier.with({
    extra_filetypes = { "liquid" },
  }))
end

local eslint_config = {
  command = "./node_modules/.bin/eslint",
}

if has_eslint_config() then
  table.insert(null_ls_sources, null_ls.builtins.diagnostics.eslint.with(eslint_config))
  table.insert(null_ls_sources, null_ls.builtins.formatting.eslint.with(eslint_config))
end

null_ls.setup({
  sources = null_ls_sources,
})

-- diagnostics
vim.call('sign_define', 'DiagnosticSignError', { text = "•", texthl = "DiagnosticSignError" })
vim.call('sign_define', 'DiagnosticSignWarn', { text = "•", texthl = "DiagnosticSignWarn" })
vim.call('sign_define', 'DiagnosticSignInfo', { text = "•", texthl = "DiagnosticSignInfo" })
vim.call('sign_define', 'DiagnosticSignHint', { text = "•", texthl = "DiagnosticSignHint" })

-- lsp
--vim.keymap.set('n', 'gd',        '<cmd>lua vim.lsp.buf.declaration()<CR>')
--vim.keymap.set('n', 'gi',        '<cmd>lua vim.lsp.buf.implementation()<CR>')
--vim.keymap.set('n', 'gR',        '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>ds', '<cmd>:Diagnostics<CR>')
vim.keymap.set('n', '<c-space>', '<cmd>:CodeActions<CR>')
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>')


---------------------------------------------
-- Treesitter
---------------------------------------------
require 'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "markdown" },
  ident = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}


---
-- Comment
---

require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}


---
-- FileTree
---
require('nvim-tree').setup({
  git = {
    ignore = false
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "<C-o>", action = "dir_up" },
      },
    },
  },
})

vim.keymap.set('n', '<leader>fe', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>ff', ':NvimTreeFindFile<cr>')


---------------------------------------------
-- Lightline
---------------------------------------------
vim.g.lightline = {
  tabline = {
    left = { { 'tabs' } },
    right = { {} }
  }
}


---------------------------------------------
-- FZF
---------------------------------------------

vim.api.nvim_exec(
  [[
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=never --smart-case '.shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
]] ,
  true
)

vim.keymap.set('n', '<c-p>', ':Files<cr>')
vim.keymap.set('n', '<c-f>', ':Rg<cr>')
vim.keymap.set('n', '<c-h>', ':Help<cr>')


require('lspfuzzy').setup()
--require('fzf_lsp').setup()

require 'colorizer'.setup()

-- Splits
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')
vim.keymap.set('n', '<c-w>o', '<c-w><c-o>')

-- Splits resizing
vim.keymap.set('', '<A-h>', '<C-w>>')
vim.keymap.set('', '<A-j>', '<C-W>+')
vim.keymap.set('', '<A-k>', '<C-W>-')
vim.keymap.set('', '<A-l>', '<C-w><')

-- Tabs mappings
vim.keymap.set('n', '<leader>tt', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tp', ':tabprev<CR>')
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>')
vim.keymap.set('n', '<leader>to', ':tabonly<CR>')
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>')

vim.keymap.set('n', '<leader>tl', ':tabm +1<CR>')
vim.keymap.set('n', '<leader>th', ':tabm -1<CR>')

-- Tab focus
vim.keymap.set('n', '<leader>0', ':tablast')

for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, i .. 'gt')
end

-- Git mappings
vim.keymap.set('n', '<leader>gs', ':Git<CR>')
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>')
vim.keymap.set('n', '<leader>gp', ':Git push<CR>')
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>')
vim.keymap.set('n', '<leader>gpr', ':Git pull -r<CR>')
vim.keymap.set('n', '<leader>gl', ':Gclog %<CR>')
vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<CR>')
vim.keymap.set('n', '<leader>gm', ':Gvdiffsplit!<CR>')

vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>')

vim.api.nvim_exec(
  [[
autocmd BufRead,BufNewFile *.mdx set filetype=markdown
]] ,
  true
)

vim.keymap.set('n', '<leader>sx', ':TSHighlightCapturesUnderCursor<CR>')

---------------------------------------------
-- Copilot
---------------------------------------------
vim.api.nvim_set_keymap('i', '<C-j>', 'copilot#Accept()', { silent = true, script = true, expr = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_node_command = '~/.nvm/versions/node/v17.9.1/bin/node'

---------------------------------------------
-- Minimap
---------------------------------------------
vim.g.minimap_width = 10
vim.g.minimap_auto_start = 0
vim.g.minimap_auto_start_win_enter = 0
vim.g.minimap_git_colors = 1
vim.g.minimap_block_filetypes = { 'fugitive', 'nerdtree', 'tagbar', 'fzf', '' }
vim.keymap.set('n', '<leader>mm', ':MinimapToggle<CR>')

---------------------------------------------
-- DAP, DEBUG
---------------------------------------------

require("nvim-dap-virtual-text").setup {
  commented = true,
}

local dap, dapui = require('dap'), require('dapui')
local dap = require('dap')

vim.keymap.set('n', '<leader>dc', dap.continue)
--vim.keymap.set('n', '<F29>', dap.run_last)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dj', dap.step_over)
vim.keymap.set('n', '<leader>di', dap.step_into)
vim.keymap.set('n', '<leader>do', dap.step_out)


dapui.setup({
  layouts = {
    {
      elements = {
        'stacks',
        { id = 'scopes', size = 0.75 },
      },
      size = 40, -- 40 columns
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 0.25, -- 25% of total lines
      position = 'bottom',
    },
  },
  controls = {
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
})
dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_exited['dapui_config'] = dapui.close

vim.keymap.set('n', '<Leader>dq', function()
  dap.disconnect()
  dap.close()
  dapui.close({})

  for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buffer)
    if name:match('.*%[dap%-repl%]') then
      vim.api.nvim_buf_delete(buffer, { force = true })
    end
  end
end)

require("dap-vscode-js").setup({
  --node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  --debugger_path = "/Users/alehatsman/.local/share/nvim/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  --debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

require('dap-go').setup()

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/.bin/jest",
        "--runInBand",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    }
  }
end
