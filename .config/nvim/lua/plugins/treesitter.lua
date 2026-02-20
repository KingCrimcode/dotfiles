return {
  -- Comments based on treesitter (for multilanguage files)
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = { enable_autocmd = false },
  },
  -- Advanced comments and comment blocks
  {
    "numToStr/Comment.nvim",
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        ignore = "^$",
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    init = function()
      local ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "html",
        "hyprlang",
        "java",
        "json",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "regex",
        "rust",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
      }
      local already_installed = require("nvim-treesitter.config").get_installed()
      local parsers_to_install = vim.iter(ensure_installed)
        :filter(function(parser) return not vim.tbl_contains(already_installed, parser) end)
        :totable()

      -- Ensure installed
      require("nvim-treesitter").install(parsers_to_install)
      -- Syntax hightlight
      vim.api.nvim_create_autocmd('FileType', {
        pattern = already_installed,
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
}
