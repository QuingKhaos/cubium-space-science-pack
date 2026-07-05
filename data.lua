local khaoslib_recipe = require("__khaoslib__.recipe")

khaoslib_recipe:load("space-science-pack")
  :copy("space-science-pack-cubic")
  :set {
    category = "advanced-crafting",
    subgroup = "cubic",
    icons = {
      {icon = "__cubium__/graphics/icons/matter-cube.png", scale = 0.9},
      {icon = "__base__/graphics/icons/space-science-pack.png", scale = 0.6},
    },
    localised_name = {"item-name.space-science-pack"},
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    result_is_always_fresh = true,
    order = "aa"
  }
  :add_ingredient {type = "item", name = "energized-microcube", amount = 1}
  :add_ingredient {type = "fluid", name = "dream-concentrate", amount = 200}
  :replace_result("space-science-pack", function(result)
    result.amount = 10
    return result
  end)
  :add_result {type = "item", name = "dormant-microcube", amount = 1, percent_spoiled = 0, ignored_by_productivity = 9999, show_details_in_recipe_tooltip = false}
  :add_unlock("cube-mastery-4")
  :commit()
