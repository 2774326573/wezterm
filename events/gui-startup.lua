local wezterm = require('wezterm')
local mux = wezterm.mux

local M = {}

M.setup = function()
   wezterm.on('gui-startup', function(cmd)
      local _, _, window = mux.spawn_window(cmd or {})
      local gui = window:gui_window()
      local screens = wezterm.gui and wezterm.gui.screens()
      local active_screen = screens and screens.active

      if gui and active_screen then
         local target_width = math.floor(active_screen.width * 0.8)
         local target_height = math.floor(active_screen.height * 0.8)

         gui:set_inner_size(target_width, target_height)

         local centered_x = active_screen.x + math.floor((active_screen.width - target_width) / 2)
         local centered_y = active_screen.y + math.floor((active_screen.height - target_height) / 2)
         gui:set_position(centered_x, centered_y)
      end
   end)
end

return M
