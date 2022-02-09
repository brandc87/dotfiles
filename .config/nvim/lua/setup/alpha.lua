local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

local function footer()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
  return datetime
    .. "   "
    .. total_plugins
    .. " plugins"
    .. "   v"
    .. vim.version().major
    .. "."
    .. vim.version().minor
    .. "."
    .. vim.version().patch
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
