return {
  -- add theme
  {
    "AlexvZyl/nordic.nvim",
    config = function()
      require("nordic").setup {
          bold_keywords = true,
          -- bright_border = true,
          -- swap_backgrounds = true, -- darker background
          cursorline = { theme = "light"},
          override = {
              Visual = {
                  bg = "#4a5561", -- or B46950, 6F9AA7, BF616A, 5E81AC, 4a5561
                  bold = true, -- Or false.,
              },
              CursorLineNr = {
                  fg = "#fabd2f",
                  bold = true,
              },
          },
      }
  end,
  },

  -- Configure LazyVim to load theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordic",
    },
  },
}
