return {
  "stevearc/conform.nvim",
  -- event = { "BufWritePre" },
  -- cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      css = { "stylelint" },
      go = { "gofmt" },
      lua = { "stylua" },
      qml = { "qmlformat" },
      rust = { "rustfmt" },
    }
  },
  keys = {
    { "<C-f>", function() require("conform").format() end, desc = "Format code" },
  }
}
