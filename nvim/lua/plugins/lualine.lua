local function get_mode()
  local mode = require("noice").api.statusline.mode.get()
  mode = string.gsub(mode, '%-%-', '')
  if string.sub(mode, 1, 1) == ' ' then
    mode = string.sub(mode, 2, -1)
  end if string.sub(mode, -1, -1) == ' ' then
    mode = string.sub(mode, 1, -2)
  end
  return mode
end

require("lualine").setup({
  sections = {
    lualine_a = {
      {
        get_mode,
        cond = require("noice").api.statusline.mode.has,
      }
    },
  },
})

