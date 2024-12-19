local cmp = require "cmp"

local options = require "nvchad.configs.cmp"

options.mapping["<Tab>"] = cmp.mapping.confirm {
  behavior = cmp.ConfirmBehavior.Insert,
  select = true,
}
options.mapping["<CR>"] = nil

return options
