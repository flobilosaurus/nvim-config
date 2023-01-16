require("flobilosaurus.plugins-setup")
require("flobilosaurus.core.options")
require("flobilosaurus.core.keymaps")
require("flobilosaurus.core.colorscheme")

-- require all plugin configurations
vim.cmd("runtime! lua/flobilosaurus/plugins/**/*.lua")
