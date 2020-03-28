local gtable = require('gears.table')
local default_theme = require('themes.material-CTT.default-theme')
-- PICK THEME HERE
local theme = require('themes.material-CTT.PapyElGringo-theme')

local final_theme = {}
gtable.crush(final_theme, default_theme.theme)
gtable.crush(final_theme, theme.theme)
default_theme.awesome_overrides(final_theme)
theme.awesome_overrides(final_theme)

return final_theme
