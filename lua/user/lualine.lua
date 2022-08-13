local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = auto,
    section_separators = {
      left = "",
      right = "",
    },
    component_separators = {
      left = "",
      right = "",
    },
    global_status = true,
    disabled_filetypes = { "alpha", "dashboard", "Outline", "Lexplore" },
    always_divide_middle = true,
  },
  sections = {
    lualine_x = {
      {
        'fileformat',
        symbols = {
          unix = '', -- e712
        }
      },
      'filetype',
      'copilot',
    }
  },
  tabline = {}
})

-- TODO: create a function for determining if copilot is available

