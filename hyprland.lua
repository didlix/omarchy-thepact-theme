-- Silo: thin mint frame on the focused window, dim teal elsewhere, and the
-- CRT screen shader (shipped with this theme as silo-crt.frag). Square
-- corners live in ~/.config/hypr/looknfeel.lua, which loads after this file
-- and checks for this theme's shader to detect Silo is active.

local active_border_color = "rgba(9fd6c6ee)"
local inactive_border_color = "rgba(28453c99)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    -- The show's terminals have square corners.
    rounding = 0,

    -- Optional CRT effect (scanlines/phosphor/vignette, static so damage
    -- tracking stays on). Off by default — it adds constant per-pixel GPU
    -- work. Enable by uncommenting:
    -- screen_shader = (os.getenv("HOME") or "") .. "/.local/state/omarchy/current/theme/silo-crt.frag",
  },
})
