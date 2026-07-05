local khaoslib_technology = require("__khaoslib__.technology")

if mods["planet-muluna"] then
  khaoslib_technology:load("cubic-science-pack-productivity-infinite")
    :add_effect {
      type = "change-recipe-productivity",
      recipe = "space-science-pack-muluna-cubic",
      change = 0.03
    }:commit()
end
