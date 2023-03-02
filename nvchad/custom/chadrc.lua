local M = {}

M.plugins = require "custom.plugins"

M.ui = {
  -- theme stuff
  theme = "rxyhn",
  theme_toggle = { "gruvchad", "ayu-light" },

  -- highlight groups!
  hl_add = require("custom.highlights").new_hlgroups,
  hl_override = require("custom.highlights").overriden_hlgroups,
}

M.mappings = require "custom.mappings"

return M
