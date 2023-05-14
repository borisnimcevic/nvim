function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Nomal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NomalFloat", {bg = "none"})

end

ColorMyPencils()


-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_transparent = true
--
-- vim.opt.background = "dark"
--
-- vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd('colorscheme rose-pine')


