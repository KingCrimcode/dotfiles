local function load_options()
  local options_list = {
    -- Line number
    number = true,
    numberwidth = 4,
    relativenumber = true,

    -- Indenting
    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,
    expandtab = true, -- spaces instead of tabs
    autoindent = true,
    smartindent = true,
    wrap = false, -- wrap lines at the end of the screen

    -- Extra files
    backup = false,
    swapfile = false,
    undofile = true,

    -- Search
    incsearch = true,
    inccommand = "split", -- preview window for substitutions outside the screen
    ignorecase = true,
    smartcase = true, -- override ignorecase if seach contains upper letters

    -- Others
    clipboard = "unnamedplus",
    cursorline = false,
    fillchars = "eob: ",
    mouse = "", -- mouse support
    ruler = false, -- show line and column of cursor position
    scrolloff = 8,
    showmode = false,
    signcolumn = "yes",
    splitbelow = true,
    splitright = true,
    termguicolors = true
  }

  for name, value in pairs(options_list) do
    vim.api.nvim_set_option_value(name, value, {})
  end
end

load_options()
