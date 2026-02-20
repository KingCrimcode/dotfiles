return {
  cmd = { "clangd", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  capabilities = {
    offsetEncoding = { "utf-16", "utf-8" },
    textDocument = { completion = { editsNearCursor = true } },
  },
  root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git" },
  single_file_support = true,
}
