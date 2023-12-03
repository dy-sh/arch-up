if vim.g.vscode then
    -- VSCode extension
    require("vscode.config.init")
    -- require("config.lazy")
else
    -- ordinary Neovim
    -- bootstrap lazy.nvim, LazyVim and your plugins
    require("config.lazy")
end

