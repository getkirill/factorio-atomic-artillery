local artillery_atomic_rocket = table.deepcopy(data.raw["projectile"]["atomic-rocket"])
artillery_atomic_rocket.type = "artillery-projectile"
artillery_atomic_rocket.name = "atomic-artillery-projectile"
artillery_atomic_rocket.reveal_map = true
artillery_atomic_rocket.map_color = {
    r = 0,
    g = 1,
    b = 0
}
artillery_atomic_rocket.picture = {
    filename = "__base__/graphics/entity/artillery-projectile/hr-shell.png",
    draw_as_glow = true,
    width = 64,
    height = 64,
    scale = 0.5,
    tint = {
        r = 0,
        g = 1,
        b = 0,
        a = 1
    }
}
artillery_atomic_rocket.shadow = {
    filename = "__base__/graphics/entity/artillery-projectile/hr-shell-shadow.png",
    width = 64,
    height = 64,
    scale = 0.5
}
artillery_atomic_rocket.chart_picture = {
    filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
    flags = {"icon"},
    frame_count = 1,
    width = 64,
    height = 64,
    priority = "high",
    scale = 0.25
}

local atomic_artillery_shell = table.deepcopy(data.raw["ammo"]["artillery-shell"])
atomic_artillery_shell.name = "atomic-artillery-shell"
atomic_artillery_shell.icon = nil
atomic_artillery_shell.icons = {{
    icon = "__base__/graphics/icons/artillery-shell.png",
    tint = {
        r = 0.5,
        g = 1,
        b = 0.5,
        a = 1
    }
}}
atomic_artillery_shell.ammo_type.action.action_delivery.projectile = "atomic-artillery-projectile"
local atomic_artillery_shell_recipe = {
    type = 'recipe',
    name = 'atomic-artillery-shell',
    enabled = false,
    ingredients = {{"adhesive-tape", 1}, {"artillery-shell", 1}, {"atomic-bomb", 1}},
    result = "atomic-artillery-shell"
}
local adhesive_tape = {
    type = 'item',
    name = 'adhesive-tape',
    icon = "__kraskaska-atomic-artillery__/adhesive-tape.png",
    icon_size = 64,
    icon_mipmaps = 4,
    stack_size = 50,
    subgroup = "intermediate-product"
}
local adhesive_tape_recipe = {
    type = 'recipe',
    name = 'adhesive-tape',
    enabled = false,
    subgroup = "intermediate-product",
    ingredients = {{"plastic-bar", 1}},
    results = {{"adhesive-tape", 10}}
}
local adhesive_tape_tech = {
    type = "technology",
    name = "adhesive-tape",
    icon_size = 64,
    icon_mipmaps = 4,
    icon = "__kraskaska-atomic-artillery__/adhesive-tape.png",
    prerequisites = {"plastics"},
    effects = {{
        type = "unlock-recipe",
        recipe = "adhesive-tape"
    }},
    unit =
    {
      count = 100,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      time = 10
    }
}
local atomic_artillery_tech = {
    type = "technology",
    name = "atomic-artillery",
    icon_size = 64,
    icon_mipmaps = 4,
    icons = {{
        icon = "__base__/graphics/icons/artillery-shell.png",
        tint = {
            r = 0.5,
            g = 1,
            b = 0.5,
            a = 1
        }
    }},
    prerequisites = {"adhesive-tape", "atomic-bomb", "artillery"},
    effects = {{
        type = "unlock-recipe",
        recipe = "atomic-artillery-shell"
    }},
    unit =
    {
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"military-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1}
        },
        time = 45,
        count = 3000
    }
}
data:extend({atomic_artillery_shell, artillery_atomic_rocket, adhesive_tape, adhesive_tape_recipe,
             atomic_artillery_shell_recipe, adhesive_tape_tech, atomic_artillery_tech})
--[[
    {
        type = "ammo",
        name = "atomic-artillery-shell",
        icons = {{
            icon = "__base__/graphics/icons/artillery-shell.png",
            tint = {
                r = 0.5,
                g = 1,
                b = 0.5,
                a = 1
            }
        }},
        icon_size = 64,
        icon_mipmaps = 4,
        stack_size = 1,
        ammo_type = {
            category = "artillery-shell",
            target_type = "position",
            action = {
                type = "direct",
                action_delivery = {
                    type = "artillery",
                    projectile = "atomic-artillery-projectile",
                    starting_speed = 1,
                    direction_deviation = 0,
                    range_deviation = 0,
                    source_effects = {
                        type = "create-explosion",
                        entity_name = "artillery-cannon-muzzle-flash"
                    }
                }
            }
        }
    }
]]
