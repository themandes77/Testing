local Cooldowns = {}
local coolingdown = {}

local function StartCooldown(t, cooldown)
    task.delay(t, function()
        cooldown = false
    end)
end

function Cooldowns.new(player, ability, skill, t)
    if coolingdown[player] ~= nil then
        coolingdown[player][ability][skill] = true
        StartCooldown(t, coolingdown[player][ability][skill])
    else
        coolingdown[player] = {}
        coolingdown[player][ability][skill] = true
        StartCooldown(t, coolingdown[player][ability][skill])
    end
end

function Cooldowns.RemoveCooldowns(player)
    if coolingdown[player] ~= nil then
        coolingdown[player] = {}
    end
end

function Cooldowns.IsCoolingDown(player, ability, skill)
    local IsCooling = false
    if coolingdown[player] ~= nil then
        IsCooling = not coolingdown[player][ability][skill]
    end
    return IsCooling
end

return Cooldowns