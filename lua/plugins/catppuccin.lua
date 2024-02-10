return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  function()
    vim.cmd.colorscheme "catppuccin"
  end
}
