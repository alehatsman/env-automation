local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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
  use 'Yggdroot/indentLine'
  use 'airblade/vim-gitgutter'
  use 'itchyny/lightline.vim'
  use 'christoomey/vim-tmux-navigator'
  use 'dense-analysis/ale'
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use {
    'ojroques/nvim-lspfuzzy',
    requires = {
      {'junegunn/fzf'},
      {'junegunn/fzf.vim'},
    }
  }
  use 'mbbill/undotree'
  use 'norcalli/nvim-colorizer.lua'
  use 'preservim/nerdcommenter'
  use 'scrooloose/nerdtree'
  use 'windwp/nvim-autopairs'

  use 'kdheepak/lazygit.nvim'
  use 'tpope/vim-fugitive'

  use 'tpope/vim-surround'
  use 'vim-scripts/LargeFile'
  --use 'cocopon/colorswatch.vim'
  use 'crusoexia/vim-monokai'
  --use '~/.config/nvim/plugged/vim-runo'
  --use 'tjdevries/colorbuddy.nvim'

  use 'simrat39/rust-tools.nvim'
  use {'fatih/vim-go', ft = {'go'} }
  use {'Olical/conjure', branch = 'develop', ft = { 'clj', 'cljs', 'clojure' }}

  use 'neovim/nvim-lspconfig'
  use 'tjdevries/lsp_extensions.nvim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'ray-x/lsp_signature.nvim'

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'romgrk/nvim-treesitter-context'

  use 'zeertzjq/nvim-paste-fix'

  use 'github/copilot.vim'

  -- debugging
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'

  -- rust
  use 'nvim-lua/plenary.nvim'

  use 'leoluz/nvim-dap-go'
  use 'mfussenegger/nvim-dap-python'

  use 'wfxr/minimap.vim'
  use 'wbthomason/packer.nvim'
  if packer_bootstrap then
    require('packer').sync()
  end
end)


---------------------------------------------
-- General configuration
---------------------------------------------
vim.o.syntax        = 'on'          -- enable sytax highlight
vim.o.fileformat    = 'unix'        -- always use unix <EOL>
vim.o.langmenu      = 'en_US'       -- use en as language menu
vim.o.hidden        = true          -- be able to switch buffers without file save
vim.o.showcmd       = true          -- shows command in the last line
vim.o.startofline   = false         -- some command move to the first non-blank line
vim.wo.number       = true          -- line number on
vim.o.clipboard     = 'unnamedplus' -- allow copy paste system <-> nvim
vim.o.exrc          = true          -- enable project specific .nvimrc files
vim.o.secure        = true          -- disable write/shell commands in those files
vim.o.splitbelow    = true          -- put the new window below the current one
vim.o.splitright    = true          -- put the new window right of the current one
vim.o.incsearch     = true              -- search as you type
vim.o.cursorline    = true             -- highlight current line
vim.o.shortmess     = vim.o.shortmess .. 'c'                -- don't give completion messages
vim.o.updatetime    = 50
vim.o.swapfile      = false              -- don't create swap files
vim.o.backup        = false               -- don't create backup files
vim.o.writebackup   = false          -- for more info see backup table
vim.go.signcolumn   = 'yes'          -- always show sign column
vim.o.scrolloff = 8
vim.o.showmode      = false             -- hide --INSERT--
vim.o.undodir       = '~/.config/nvim/undodir'
vim.o.completeopt   ='menu,menuone,noinsert'

-- Color
vim.o.termguicolors = true          -- use gui 24-bit colors, gui attrs instead of cterm
vim.go.t_Co='256'
vim.o.background='dark'

-- Identation
vim.o.autoindent = true             -- copy indent from current line when starting a new line
vim.o.smarttab = true               -- <Tab> in front of a line inserts blanks according to 'shiftwidth'
vim.o.expandtab = true              -- spaces instead of tabs
vim.o.softtabstop=2          -- the number of spaces to use when expanding tabs
vim.o.shiftwidth=2           -- the number of spaces to use when indenting -- or de-indenting -- a line
vim.o.tabstop=2              -- the number of spaces that a tab equates to

-- Folding
vim.o.foldmethod='expr'        -- fold is defined by treesiter expressions
vim.o.foldexpr='nvim_treesitter#foldexpr()'
vim.o.foldcolumn='0'           -- width of fold column
vim.o.foldlevelstart=99        -- don't close folds
vim.o.colorcolumn='80'         -- visualize max line width

vim.o.laststatus = 3

vim.g.AutoPairsFlyMode = 1
vim.g.indentLine_color_gui = '#abaa98' -- set color of identation symbols |
vim.g.indentLine_fileTypeExclude = { 'json', 'markdown' }

vim.g.mapleader = ' '
vim.g.maplocalleader = vim.api.nvim_replace_termcodes('<tab>', true, true, true) -- wtf is this

vim.g.colors_name = 'monokai'
vim.cmd [[
  silent! colorscheme monokai
]]

require('nvim-autopairs').setup{
  enable_check_bracket_line=false
}

-- autocomplete
vim.g.completion_enable_auto_popup = 0 -- disable automatic autocomplete popup
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }


vim.g.vim_json_syntax_conceal = 0

vim.g.mouse=nil


---------------------------------------------
-- Autocomplete
---------------------------------------------

local cmp = require'cmp'
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

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


---------------------------------------------
-- Language Server Protocol
---------------------------------------------
local lspconfig = require'lspconfig'
local api = vim.api

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = false, --{ spacing = 4 },
    signs = true,
    update_in_insert = false,
  }
)
--vim.lsp.handlers['textDocument/publishDiagnostics'] = function() end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
 vim.lsp.handlers.hover, {
   -- Use a sharp border with `FloatBorder` highlights
   border = 'none'
 }
)

local lsp_signature = require'lsp_signature'
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

function on_attach(client, bufnr)
  --require'completion'.on_attach(client, bufnr)
  --api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  lsp_signature.on_attach()
end

local setup_config = {on_attach=on_attach, capabilities=capabilities}

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
        globals = {'vim'},
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

-- remap ctrl-x ctrl-o to ctrl space
--vim.api.nvim_set_keymap('i', '<C-Space>', '<C-x><C-o>', { noremap = true })
--vim.api.nvim_set_keymap('i', '<C-@>', '<C-Space>', { noremap = true })
--vim.api.nvim_set_keymap('i', '<expr> <C-space>', 'completion#trigger_completion()', { noremap = true, silent = true })
--vim.api.nvim_exec('autocmd CompleteDone * pclose', true)

-- diagnostics
vim.call('sign_define', 'DiagnosticSignError', {text = "•", texthl = "DiagnosticSignError"})
vim.call('sign_define', 'DiagnosticSignWarn', {text = "•", texthl = "DiagnosticSignWarn"})
vim.call('sign_define', 'DiagnosticSignInfo', {text = "•", texthl = "DiagnosticSignInfo"})
vim.call('sign_define', 'DiagnosticSignHint', {text = "•", texthl = "DiagnosticSignHint"})

-- lsp
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<space>ds', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<space>dl', '<cmd>lua vim.diagnostic.setloclist()<CR>')


---------------------------------------------
-- Treesitter
---------------------------------------------
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "markdown" },
  ident = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
}


---------------------------------------------
-- Ale linter
---------------------------------------------
vim.g.ale_enabled = 1
vim.g.ale_linters = {
  typescript = { 'eslint', 'tsserver' },
  typescriptreact = { 'eslint', 'tsserver' },
  python = { 'pyls', 'black', 'mypy' },
  yaml = { 'yamllint' },
  clojure = { 'clj-kondo' }
}
vim.g.ale_fixers = {
  ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
  javascript = { 'prettier', 'eslint' },
  typescript = { 'prettier', 'eslint' },
  typescriptreact = { 'prettier', 'eslint' },
  json = { 'jq' }
}

vim.g.ale_fix_on_save = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_delay = 0
vim.g.ale_lint_on_enter = 0
vim.g.ale_lint_on_filetype_changed = 0
vim.g.ale_lint_on_insert_leave = 0
vim.g.ale_lint_on_text_changed = 0
vim.g.ale_linters_explicit = 1
vim.g.ale_open_list = 0
vim.g.ale_set_highlights = 0
vim.g.ale_set_loclist = 1
vim.g.ale_set_quickfix = 0
vim.g.ale_set_signs = 1
vim.g.ale_sign_column_always = 1
vim.g.ale_sign_error = '•'
vim.g.ale_sign_offset = 1000000
vim.g.ale_sign_warning = '•'
vim.g.ale_python_auto_pipenv = 1
vim.g.ale_completion_tsserver_autoimport = 1

---------------------------------------------
-- Nerd tree
---------------------------------------------
vim.g.NERDTreeShowHidden = 1 -- show hidden files
vim.g.NERDTreeAutoDeleteBuffer = 1 -- delete buffer when delete file
vim.g.NERDTreeMinimalUI = 1

vim.api.nvim_set_keymap('n', '<leader>fe', ':NERDTreeToggle<cr>', { noremap = false })
vim.api.nvim_set_keymap('n', '<leader>ff', ':NERDTreeFind<cr>', { noremap = true })

vim.api.nvim_exec('autocmd FileType nerdtree setlocal colorcolumn&', true) -- fixes colorcolumn with open nerdtree

---------------------------------------------
-- Lightline
---------------------------------------------
vim.g.lightline = {
  tabline = {
    left = { { 'tabs' } },
    right = { {  } }
  }
}


---------------------------------------------
-- FZF
---------------------------------------------

vim.api.nvim_exec(
[[
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=never --smart-case '.shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
]],
true
)

vim.api.nvim_set_keymap('n', '<c-p>', ':Files<cr>', { noremap = false })
vim.api.nvim_set_keymap('n', '<c-b>', ':Buffers<cr>', { noremap = false })
vim.api.nvim_set_keymap('n', '<c-f>', ':Rg<cr>', { noremap = false })
vim.api.nvim_set_keymap('n', '<c-h>', ':Help<cr>', { noremap = false })

require('lspfuzzy').setup {}

-- Nvim colorizer
require'colorizer'.setup()

-- Splits
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', { noremap = false })
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', { noremap = false })
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', { noremap = false })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', { noremap = false })
vim.api.nvim_set_keymap('n', '<c-w>o', '<c-w><c-o>', { noremap = false })

-- Splits resizing
vim.api.nvim_set_keymap('', '<A-h>', '<C-w>>', { silent = true })
vim.api.nvim_set_keymap('', '<A-j>', '<C-W>+', { silent = true })
vim.api.nvim_set_keymap('', '<A-k>', '<C-W>-', { silent = true })
vim.api.nvim_set_keymap('', '<A-l>', '<C-w><', { silent = true })

-- Tabs mappings
vim.api.nvim_set_keymap('n', '<leader>tt', ':tabnew<CR>', { noremap = false })
vim.api.nvim_set_keymap('n', '<leader>tp', ':tabprev<CR>', { noremap = false })
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnext<CR>', { noremap = false })
vim.api.nvim_set_keymap('n', '<leader>to', ':tabonly<CR>', { noremap = false })
vim.api.nvim_set_keymap('n', '<leader>tc', ':tabclose<CR>', { noremap = false })

vim.api.nvim_set_keymap('n', '<leader>tl', ':tabm +1<CR>', { noremap = false })
vim.api.nvim_set_keymap('n', '<leader>th', ':tabm -1<CR>', { noremap = false })

-- Tab focus
vim.api.nvim_set_keymap('n', '<leader>0', ':tablast', { noremap = true })

for i=1,9 do
  vim.api.nvim_set_keymap('n', '<leader>' .. i, i .. 'gt', { noremap = true })
end

-- Git mappings
vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':Gcommit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gp', ':Gpush<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gpr', ':Gpull -r<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gl', ':Gclog %<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gvdiffsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gm', ':Gvdiffsplit!<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true })

vim.api.nvim_exec(
[[
autocmd BufRead,BufNewFile *.mdx set filetype=markdown
]],
true
)

vim.api.nvim_set_keymap('n', '<leader>sx', ':TSHighlightCapturesUnderCursor<CR>', { noremap = true })

---------------------------------------------
-- Copilot
---------------------------------------------
vim.api.nvim_set_keymap('i', '<C-j>', 'copilot#Accept()', { silent = true, script = true, expr  = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_node_command = '~/.nvm/versions/node/v17.9.1/bin/node'

require('rust-tools').setup({
  hover_actions = {
    border = 'none',
  }
})


---------------------------------------------
-- Minimap
---------------------------------------------

vim.g.minimap_width = 10
vim.g.minimap_auto_start = 0
vim.g.minimap_auto_start_win_enter = 0
vim.g.minimap_git_colors = 1
vim.g.minimap_block_filetypes = { 'fugitive', 'nerdtree', 'tagbar', 'fzf', '' }

vim.api.nvim_set_keymap('n', '<leader>mm', ':MinimapToggle<CR>', { noremap = true })
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*"},
  callback = function ()
    local line_count = vim.api.nvim_buf_line_count(0)
    local win_height = vim.api.nvim_win_get_height(0)

    if line_count > win_height then
      vim.api.nvim_command('Minimap')
    else
      vim.api.nvim_command('MinimapClose')
    end
  end,
})
