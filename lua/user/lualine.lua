local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

-- Custom colors
local gray = "#455574"
local dark_gray = "#282C34"
local bg1 = "#283347"
local red = "#f65866"
local blue = "#41a7fc"
local green = "#8bcd5b"
local cyan = "#34bfd0"
local orange = "#dd9046"
local indent = "#CE9178"
local yellow = "#efbd5d"
local yellow_orange = "#D7BA7D"
local purple = "#c75ae8"

-- Mode Map --
mode_map = {
  ['n']      = 'NORMAL',
  ['no']     = 'O-PENDING',
  ['nov']    = 'O-PENDING',
  ['noV']    = 'O-PENDING',
  ['no\22'] = 'O-PENDING',
  ['niI']    = 'NORMAL',
  ['niR']    = 'NORMAL',
  ['niV']    = 'NORMAL',
  ['nt']     = 'NORMAL',
  ['ntT']    = 'NORMAL',
  ['v']      = 'VISUAL',
  ['vs']     = 'VISUAL',
  ['V']      = 'V-LINE',
  ['Vs']     = 'V-LINE',
  ['\22']   = 'V-BLOCK',
  ['\22s']  = 'V-BLOCK',
  ['s']      = 'SELECT',
  ['S']      = 'S-LINE',
  ['\19']   = 'S-BLOCK',
  ['i']      = 'INSERT',
  ['ic']     = 'INSERT',
  ['ix']     = 'INSERT',
  ['R']      = 'REPLACE',
  ['Rc']     = 'REPLACE',
  ['Rx']     = 'REPLACE',
  ['Rv']     = 'V-REPLACE',
  ['Rvc']    = 'V-REPLACE',
  ['Rvx']    = 'V-REPLACE',
  ['c']      = 'COMMAND',
  ['cv']     = 'EX',
  ['ce']     = 'EX',
  ['r']      = 'REPLACE',
  ['rm']     = 'MORE',
  ['r?']     = 'CONFIRM',
  ['!']      = 'SHELL',
  ['t']      = 'TERMINAL',
}


-- Mode --
local mode_color = {
  n = green,
  i = blue,
  v = purple,
  [""] = purple,
  V = purple,
  -- c = '#B5CEA8',
  -- c = '#D7BA7D',
  c = orange,
  no = "#D16D9E",
  s = green,
  S = orange,
  [""] = orange,
  ic = red,
  R = "#D16D9E",
  Rv = red,
  cv = blue,
  ce = blue,
  r = red,
  rm = "#46a6b2",
  ["r?"] = "#46a6b2",
  ["!"] = "#46a6b2",
  t = red,
}

vim.api.nvim_set_hl(0, "SLDebIcon", { fg = "#D70A53", bg = "#FFFFFF" })

local left_padding = {
  function()
    return ""
  end,
  color = function()
    return { fg = gray, bg = "NONE" }
  end,
  padding = 0
}

local left_padding_alt = {
  function()
    return ""
  end,
  color = function()
    return { fg = bg1, bg = "NONE" }
  end,
  padding = 0
}

local right_padding = {
  function()
    return " "
  end,
  color = function()
    return { fg = gray, bg = "NONE" }
  end,
  padding = 0
}

local hl_str = function(str, hl)
    return "%#" .. hl .. "#" .. str .. "%*"
end

local right_padding_deb = {
  function()
    return " "
  end,
  color = function()
    return { fg = "#FFFFFF", bg = "NONE" }
  end,
  padding = 0
}

local left_padding_deb = {
  function()
    return ""
  end,
  color = function()
    return { fg = "#FFFFFF", bg = "NONE" }
  end,
  padding = 0
}

local mode = {
  -- mode component
  function()
    return mode_map[vim.fn.mode()]
  end,
  color = function()
    -- auto change color according to neovims mode
    return { fg = mode_color[vim.fn.mode()], bg = gray }
  end,
  padding = 2,
}

local fileformat = {
  -- fileformat component
  function()
    return ""
  end,
  color = function()
    return { fg = "#D70A53", bg = "#FFFFFF" }
  end,
  padding = 1,
}

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
    lualine_a = {
      left_padding_deb,
      fileformat,
      right_padding_deb,
      left_padding,
      mode,
      right_padding,
    },
    lualine_b = {
      left_padding_alt,
      {
        'branch',
        color = { bg = bg1 }
      },
      'diff',
      'diagnostics',
    },
    lualine_x = {
      'filetype',
      {
        'copilot',
        color = { fg = "#8bcd5b" }
      },
    }
  },
  tabline = {}
})

-- TODO: create a function for determining if copilot is available

