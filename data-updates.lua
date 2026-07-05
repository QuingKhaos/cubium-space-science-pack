local khaoslib_list = require("__khaoslib__.list")
local khaoslib_recipe = require("__khaoslib__.recipe")
local util = require("util")

local cubic_ingredients = util.table.deepcopy(data.raw["recipe"]["space-science-pack"].ingredients)
khaoslib_list.add(cubic_ingredients, {type = "item", name = "energized-microcube", amount = 1}, function(ingredient)
    return ingredient.name == "energized-microcube"
  end)
khaoslib_list.add(cubic_ingredients, {type = "fluid", name = "dream-concentrate", amount = 200}, function(ingredient)
    return ingredient.name == "dream-concentrate"
  end)

local cubic_space_science_pack = {
  category = "advanced-crafting",
  subgroup = mods["cubium-science-pack-reorder"] and (mods["science-tab"] and "cubic-basic-science-pack" or "cubic-science") or "cubic",
  icons = {
    {icon = "__cubium__/graphics/icons/matter-cube.png", scale = 0.9},
    {icon = "__base__/graphics/icons/space-science-pack.png", scale = 0.6},
  },
  localised_name = {"item-name.space-science-pack"},
  enabled = false,
  allow_productivity = true,
  auto_recycle = false,
  result_is_always_fresh = true,
  order = mods["cubium-science-pack-reorder"] and data.raw["recipe"]["space-science-pack"].order or "aa",
  ingredients = cubic_ingredients,
  results = {
    -- Merges with the original space science pack results and overwrites the amount of space science packs to 10, adds a dormant microcube, while adding the dorman microcubes as additional result.
    {type = "item", name = "space-science-pack", amount = 10},
    {type = "item", name = "dormant-microcube", amount = 1, percent_spoiled = 0, ignored_by_productivity = 9999, show_details_in_recipe_tooltip = false},
  },
}

khaoslib_recipe:load("space-science-pack")
  :copy("space-science-pack-cubic")
  :set(cubic_space_science_pack)
  :add_unlock("cube-mastery-4")
  :commit()

if mods["planet-muluna"] then
  khaoslib_recipe:load("space-science-pack-cubic")
    :remove_unlock("cube-mastery-4")
    :add_unlock("advanced-space-science-pack-cubic")
    :commit()

  khaoslib_recipe:load("space-science-pack-muluna")
    :copy("space-science-pack-muluna-cubic")
    :set(cubic_space_science_pack)
    :add_unlock("cube-mastery-4")
    :commit()
end
