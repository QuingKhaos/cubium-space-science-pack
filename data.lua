local khaoslib_technology = require("__khaoslib__.technology")
local util = require("util")

if mods["planet-muluna"] then
  local pack_icons = util.table.deepcopy(data.raw["technology"]["advanced-space-science-pack"].icons)

  --- @cast pack_icons data.IconData[]
  table.insert(pack_icons, 1, {icon = "__cubium__/graphics/technology/ultradense-technology.png", icon_size = 256})
  pack_icons[2].scale = 0.4
  pack_icons[2].shift = {3, -10}

  khaoslib_technology:load("advanced-space-science-pack")
    :copy("advanced-space-science-pack-cubic")
    :set {icons = pack_icons}
    :set {localised_description = {"technology-description.advanced-space-science-pack"}}
    :clear_prerequisites()
    :add_prerequisite("cube-mastery-4")
    :add_prerequisite("advanced-space-science-pack")
    :set {unit = {time = 15, count = 1}}
    :clear_effects()
    :commit()
end
