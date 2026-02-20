require("core")
require(".lazy")

function Source_colors()
  local path = os.getenv("HOME") .. "/.config/nvim/lua/generated.lua"

  local file, err = io.open(path, "r")

  if err ~= nil then
    vim.cmd("colorscheme habamax")
  else
    dofile(path)
    io.close(file)
  end
end

Source_colors()
