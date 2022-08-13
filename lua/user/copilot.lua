vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.cmd[[highlight CopilotSuggestion guifg=#555555]]
vim.cmd[[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]
