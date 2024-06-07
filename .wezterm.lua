-- Pull in the wezterm API
local wezterm = require 'wezterm'


-- This will hold the configuration.

local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- 	Run Powershell 7 by default 
config.default_prog = {"pwsh"}

-- font
config.font =
  wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true }) 

-- For example, changing the color scheme:
config.color_scheme = 'Github Dark (Gogh)'
config.window_background_opacity = 0.85
-- config.win32_system_backdrop = 'Acrylic'

-- keymaps
config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'm',
    mods = 'CMD',
    action = wezterm.action.DisableDefaultAssignment,
  },

  -- disable ctrl+shift+2 default assignment 
  {
	key = '@',
	mods = 'SHIFT|CTRL',
	action = wezterm.action.DisableDefaultAssignment
  },


  -- open wsl tab with ctrl+shift+1
  {
    key = "!",
    mods = "SHIFT|CTRL",
    action = wezterm.action.SpawnCommandInNewTab {
	    label = 'Linux',
	    args = {'wsl'},
    },
  },

  -- open pwsh tab with ctrl+shift+2
  {
    key = "@",
    mods = "SHIFT|CTRL",
    action = wezterm.action.SpawnCommandInNewTab {
	    label = 'PWSH',
	    args  = {'pwsh'}
    },
  }, 

  -- close tab with ctrl + shift + q
  {
	  key = "Q",
	  mods = "CTRL|SHIFT",
	  action = wezterm.action.CloseCurrentPane { confirm = false },
  }

}


-- and finally, return the configuration to wezterm

return config
