return {
  -- nu (nushell)
  {
    "LhKipp/nvim-nu",
    config = function()
      require("nu").setup({
        use_lsp_features = false,
      })
    end,
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  -- },
}
