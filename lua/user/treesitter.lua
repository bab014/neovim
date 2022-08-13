local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local status_ok1, highlight = pcall(require, "nvim-treesitter.highlight")
if not status_ok1 then
  return
end

configs.setup {
  ensure_install = "all",
  sync_install = false,
  ignore_install = { "" },
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = {"python", "css"} },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
