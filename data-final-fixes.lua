-- Re-copy crafting time, in case it got changed by another mod
local khaoslib_recipe = require("__khaoslib__.recipe")

khaoslib_recipe:load("space-science-pack-cubic")
  :set {energy_required = data.raw["recipe"]["space-science-pack"].energy_required}
  :commit()
