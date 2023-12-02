return {
  -- codeium
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      vim.keymap.set("i", "<a-right>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<a-]>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<a-[>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<a-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },
  -- oatmeal, llama
  {
    "dustinblackman/oatmeal.nvim",
    cmd = { "Oatmeal" },
    keys = {
      { "<leader>om", mode = "n", desc = "Start Oatmeal session" },
    },
    opts = {
      backend = "ollama",
      model = "codellama:latest",
    },
  },
}
