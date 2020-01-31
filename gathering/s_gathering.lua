local _ = function(k, ...) return ImportPackage("i18n").t(GetPackageName(), k, ...) end

gatherTable = {
    {-- LUMBERJACK STUFF
        gather_zone = {
            {x = -215796, y = -74619, z = 291}
        }, -- Zone of initial gathering
        gather_item = "tree_log", -- item that is given by initial gathering
        gather_time = 15, -- Time in seconds to gather one item,
        process_steps = {-- Describe the steps of processing
            {
                step_zone = {x = -70149, y = -59260, z = 1466}, -- zone of processing
                step_require = "tree_log", -- item that is required (take the one from previous step)
                step_require_number = 1, -- number of item required
                step_require_tool = "lumberjack_saw",
                step_processed_item = "wood_plank", -- item that will be given
                step_processed_item_number = 2, -- number of item that will be given
                step_process_time = 30, -- Time in seconds to process one item
                step_animation = "COMBINE", -- Animation for processing
                step_animation_attachement = nil
            }
        },
        require_job = false, -- Job required,
        require_tool = "lumberjack_axe", -- Tool required in inventory,
        require_knowledge = false, -- Require knowledge (for processing illegal stuff → drugdealer, cocaine)
        gather_animation = "PICKAXE_SWING", -- Animation that the player will act when doing stuff
        gather_animation_attachement = {modelid = 1047, bone = "hand_r"},
        gather_rp_props = nil,
        sell_zone = {
            {x = 203566, y = 171875, z = 1306, h = -90, item_to_sell = "wood_plank", price_per_unit = 36, sell_time = 5}
        }
    },
    {-- PEACH HARVESTION (FOR ALTIS LIFE FANS)
        gather_zone = {
            {x = -174432, y = 10837, z = 1831}
        },
        gather_item = "peach",
        gather_animation = "PICKUP_UPPER",
        gather_time = 4,
        gather_rp_props = {
            -- Peach trees
            {model = 145, x = -174006, y = 10457, z = 1773, rx = 0, ry = 10, rz = 0},
            {model = 145, x = -173829, y = 10894, z = 1743, rx = 0, ry = 30, rz = 0},
            {model = 145, x = -173980, y = 11396, z = 1698, rx = 0, ry = 45, rz = 0},
            {model = 145, x = -174691, y = 11532, z = 1709, rx = 0, ry = 0, rz = 0},
            {model = 145, x = -175204, y = 11094, z = 1755, rx = 0, ry = 145, rz = 0},
            {model = 145, x = -175449, y = 11528, z = 1757, rx = 0, ry = 80, rz = 0},
            {model = 145, x = -175171, y = 12038, z = 1719, rx = 0, ry = 50, rz = 0},
            {model = 145, x = -174581, y = 12021, z = 1686, rx = 0, ry = 40, rz = 0},
        }
    },
    {-- COCAINE
        gather_zone = {
            {x = -45600, y = -106988, z = 2574}
        },
        gather_item = "coca_leaf",
        gather_time = 7,
        process_steps = {
            {
                step_zone = {x = -215517, y = -51147, z = 200},
                step_require = "coca_leaf",
                step_require_number = 3,
                step_processed_item = "cocaine",
                step_processed_item_number = 1,
                step_process_time = 15,
            }
        },
        require_knowledge = true,
        gather_rp_props = {
            {model = 118, x = -45773, y = -106903, z = 2470},
            {model = 115, x = -45632, y = -106576, z = 2475},
            {model = 114, x = -45291, y = -106575, z = 2460},
            {model = 117, x = -45676, y = -107138, z = 2475},
            {model = 118, x = -45974, y = -106991, z = 2459},
            {model = 118, x = -46002, y = -106673, z = 2461},
            {model = 114, x = -45773, y = -106622, z = 2457},
            {model = 118, x = -45996, y = -106875, z = 2459},
            {model = 117, x = -45816, y = -106407, z = 2480},
            {model = 118, x = -45645, y = -106710, z = 2474},
            {model = 114, x = -45856, y = -106640, z = 2471},
            {model = 114, x = -46330, y = -106327, z = 2445},
            {model = 115, x = -46487, y = -106181, z = 2436},
            {model = 114, x = -46569, y = -106505, z = 2427},
            {model = 117, x = -46188, y = -106066, z = 2455},
            {model = 118, x = -46093, y = -106249, z = 2464},
            {model = 118, x = -46408, y = -106572, z = 2438},
            {model = 118, x = -45402, y = -107068, z = 2475},
            {model = 115, x = -45271, y = -106912, z = 2461},
            {model = 114, x = -45487, y = -106842, z = 2476},
            {model = 118, x = -45354, y = -106658, z = 2466},
            -- Process zone
            {model = 1093, x = -215575, y = -51368, z = 100, rx = 0, ry = 49, rz = 0},
            {model = 791, x = -215766, y = -50923, z = 98, rx = 0, ry = 44, rz = 0},
            {model = 887, x = -216356, y = -50306, z = 96, rx = 0, ry = 47, rz = 0},
            {model = 969, x = -215320, y = -50847, z = 110, rx = 0, ry = -47, rz = 0},
            {model = 970, x = -215351, y = -50942, z = 105, rx = 0, ry = 43, rz = 0},
            {model = 791, x = -215954, y = -51115, z = 98, rx = 0, ry = 44, rz = 0},
            {model = 501, x = -215909, y = -51147, z = 106, rx = 0, ry = 0, rz = 0},
            {model = 1099, x = -215450, y = -51220, z = 101, rx = 0, ry = -45, rz = 0},
            {model = 1160, x = -215479, y = -50969, z = 107, rx = 0, ry = 0, rz = 0},
        }
    },
    {-- FISHING
        gather_zone = {
            {x = 232464, y = 193521, z = 112},
            {x = -220130, y = 23036, z = 107},
        },
        gather_item = "fish",
        require_tool = "fishing_rod",
        gather_animation = "FISHING",
        gather_time = 6,
        gather_animation_attachement = {modelid = 1111, bone = "hand_r"},
        sell_zone = {
            {x = -21295, y = -22954, z = 2080, h = -90, item_to_sell = "fish", price_per_unit = 8, sell_time = 5}
        }
    },
    {-- MINING
        gather_zone = {
            {x = -101174, y = 98223, z = 180}
        },
        gather_item = "iron_ore",
        require_tool = "pickaxe",
        gather_animation = "PICKAXE_SWING",
        gather_time = 18,
        gather_animation_attachement = {modelid = 1063, bone = "hand_r"},
        process_steps = {
            {
                step_zone = {x = -82629, y = 90991, z = 481},
                step_require = "iron_ore",
                step_require_number = 1,
                step_processed_item = "iron_ingot",
                step_processed_item_number = 2,
                step_process_time = 18,
            },
            {
                step_zone = {x = -191437, y = -31107, z = 1148},
                step_require = "iron_ingot",
                step_require_number = 2,
                step_processed_item = "iron_pipe",
                step_processed_item_number = 1,
                step_process_time = 30,
            }
        },
        sell_zone = {
            {x = 67862, y = 184741, z = 535, h = 90, item_to_sell = "iron_pipe", price_per_unit = 54, sell_time = 5}
        }
    }
}

gatherPickupsCached = {}
processPickupsCached = {}
sellZoneNpcsCached = {}

local defaultAnimationGather = "PICKUP_LOWER"
local defaultAnimationProcess = "COMBINE"
local defaultGatherTime = 8

AddEvent("OnPackageStart", function()-- Initialize pickups and objects
    for k, v in pairs(gatherTable) do
        if v.gather_zone ~= nil then -- Create pickups for gathering zones
            v.gatherPickup = {}
            for k2, v2 in pairs(v.gather_zone) do
                table.insert(v.gatherPickup, CreatePickup(2, v2.x, v2.y, v2.z))
                CreateText3D(_("gather") .. "\n" .. _("press_e"), 18, v2.x, v2.y, v2.z + 120, 0, 0, 0)
            end
            table.insert(gatherPickupsCached, v.gatherPickup)
        end
        
        if v.process_steps ~= nil then -- Create pickups for processing zones
            local nbSteps = 0
            for k2, v2 in pairs(v.process_steps) do nbSteps = nbSteps + 1 end
            for k2, v2 in pairs(v.process_steps) do -- each processing steps
                v2.processPickup = CreatePickup(2, v2.step_zone.x, v2.step_zone.y, v2.step_zone.z)
                CreateText3D(_("process") .. "\n" .. _("processing_step", k2, nbSteps) .. "\n" .. _("press_e"), 18, v2.step_zone.x, v2.step_zone.y, v2.step_zone.z + 120, 0, 0, 0)
                table.insert(processPickupsCached, v2.processPickup)
            end
        end
        
        if v.gather_rp_props ~= nil then -- Create RP objects
            for k2, v2 in pairs(v.gather_rp_props) do
                if v2.ry ~= nil then
                    CreateObject(v2.model, v2.x, v2.y, v2.z, v2.rx, v2.ry, v2.rx)
                else
                    CreateObject(v2.model, v2.x, v2.y, v2.z)
                end
            end
        end
        
        if v.sell_zone ~= nil then -- Create NPC for selling stuff
            for k2, v2 in pairs(v.sell_zone) do
                v2.sellNpc = CreateNPC(v2.x, v2.y, v2.z, v2.h)
                CreateText3D(_("gathering_supplier_of", _(v2.item_to_sell)) .. "\n" .. _("press_e"), 18, v2.x, v2.y, v2.z + 120, 0, 0, 0)
                table.insert(sellZoneNpcsCached, v2.sellNpc)
            end
        end
    end
end)

AddEvent("OnPlayerJoin", function(player)-- Cache props and pickups client side
    CallRemoteEvent(player, "gathering:setup", gatherPickupsCached, processPickupsCached, sellZoneNpcsCached)
end)

AddEvent("OnPlayerDeath", function(player)
    GatheringCleanPlayerActions(player)
end)

function GatheringCleanPlayerActions(player)-- Clean timers and actions for a player
    SetPlayerNotBusy(player)
    if PlayerData[player].timerProcessing ~= nil then
        DestroyTimer(PlayerData[player].timerProcessing)-- for anim loop
        PlayerData[player].timerProcessing = nil
    end
    if PlayerData[player].timerGathering ~= nil then
        DestroyTimer(PlayerData[player].timerGathering)-- for anim loop
        PlayerData[player].timerGathering = nil
    end
end


--- GATHERING
AddRemoteEvent("gathering:gather:start", function(player, gatherPickup)-- Start the gathering
    local gather = GetGatherByGatherPickup(gatherPickup)
    
    if gatherTable[gather] == nil then return end -- fail check
    if GetPlayerBusy(player) then -- Stop gathering
        StopGathering(player, gather)
        CallRemoteEvent(player, 'KNotify:Send', _("gather_cancelled"), "#0f0")
        return
    end
    
    -- #1 Check for jobs
    if gatherTable[gather].require_job ~= nil and gatherTable[gather].require_job ~= false and gatherTable[gather].require_job ~= PlayerData[player].job then
        CallRemoteEvent(player, 'KNotify:Send', _("wrong_job", _(gatherTable[gather].require_job)), "#f00")
        return
    end
    
    -- #2 Check for tools
    if gatherTable[gather].require_tool ~= nil and PlayerData[player].inventory[gatherTable[gather].require_tool] == nil then
        CallRemoteEvent(player, 'KNotify:Send', _("need_tool2", _(gatherTable[gather].require_tool)), "#f00")
        return
    end
    
    -- #3 Attach tool if any
    if gatherTable[gather].gather_animation_attachement ~= nil then
        SetAttachedItem(player, gatherTable[gather].gather_animation_attachement.bone, gatherTable[gather].gather_animation_attachement.modelid)
    end
    
    SetPlayerBusy(player)
    PlayerData[player].isGathering = gather
    PlayerData[player].gatheringAntiGlitch = math.random(0, 100)
    DoGathering(player, gather, PlayerData[player].gatheringAntiGlitch)
end)

function DoGathering(player, gather, antiglitchKey)
    -- #4 Lock and prepare player
    CallRemoteEvent(player, "LockControlMove", true)
    
    -- #5 Start animation and loop
    SetPlayerAnimation(player, gatherTable[gather].gather_animation or defaultAnimationGather)
    print("Setting animation")
    if PlayerData[player].timerGathering ~= nil then DestroyTimer(PlayerData[player].timerGathering) end
    print("destroy timer")
    PlayerData[player].timerGathering = CreateTimer(function(player, anim)-- for anim loop
        SetPlayerAnimation(player, anim)
    end, 4000, player, gatherTable[gather].gather_animation or defaultAnimationGather)
    
    -- #6 Display loading bar
    
    -- #7 When job is done, add to inventory and loop
    if PlayerData[player].isGathering == gather and PlayerData[player].gatheringAntiGlitch == antiglitchKey then
        Delay((gatherTable[gather].gather_time or defaultGatherTime) * 1000, function()
            if GetPlayerBusy(player) and PlayerData[player].isGathering == gather and PlayerData[player].gatheringAntiGlitch == antiglitchKey then -- Check if the player didnt canceled the job
                if AddInventory(player, gatherTable[gather].gather_item, 1) == true then
                    CallRemoteEvent(player, 'KNotify:Send', _("gather_success", _(gatherTable[gather].gather_item)), "#0f0")
                    DoGathering(player, gather, antiglitchKey)
                else
                    CallRemoteEvent(player, 'KNotify:Send', _("inventory_notenoughspace"), "#f00")
                    StopGathering(player, gather)
                end
            end
        end)
    end
end

function StopGathering(player, gather)
    SetPlayerNotBusy(player)
    PlayerData[player].isGathering = nil
    if PlayerData[player].timerGathering ~= nil then DestroyTimer(PlayerData[player].timerGathering) end -- for anim loop
    PlayerData[player].timerGathering = nil
    SetPlayerAnimation(player, "STOP")
    CallRemoteEvent(player, "LockControlMove", false)
    if gatherTable[gather].gather_animation_attachement ~= nil then SetAttachedItem(player, gatherTable[gather].gather_animation_attachement.bone, 0) end
    CallRemoteEvent(player, "loadingbar:hide")
end

--- PROCESSING
AddRemoteEvent("gathering:process:start", function(player, processPickup)
    local gather = GetGatherByProcessPickup(processPickup)
    if gather == nil then return end
    if gatherTable[gather[1]] == nil and gatherTable[gather[1]].process_steps[gather[2]] then return end -- fail check
    
    local process = gatherTable[gather[1]].process_steps[gather[2]]
    
    if GetPlayerBusy(player) then -- Stop processing
        SetPlayerNotBusy(player)
        StopProcessing(player, gather, process)
        CallRemoteEvent(player, 'KNotify:Send', _("process_cancel", process.step_require_number, _(process.step_require)), "#0f0")
        return
    end
    
    -- #1 Check for jobs
    if gatherTable[gather[1]].require_job ~= nil and gatherTable[gather[1]].require_job ~= false and gatherTable[gather[1]].require_job ~= PlayerData[player].job then
        CallRemoteEvent(player, 'KNotify:Send', _("wrong_job", _(gatherTable[gather[1]].require_job)), "#f00")
        return
    end
    
    -- #2 Check for tools
    if process.step_require_tool ~= nil and PlayerData[player].inventory[process.step_require_tool] == nil then
        CallRemoteEvent(player, 'KNotify:Send', _("need_tool2", _(process.step_require_tool)), "#f00")
        return
    end
    
    -- #3 Attach tool if any
    if process.step_animation_attachement ~= nil then
        SetAttachedItem(player, process.step_animation_attachement.bone, process.step_animation_attachement.modelid)
    end
    
    SetPlayerBusy(player)
    PlayerData[player].isProcessing = gather[2]
    PlayerData[player].gatheringAntiGlitch = math.random(0, 100)
    DoProcessing(player, gatherTable[gather[1]], process, gather[2], PlayerData[player].gatheringAntiGlitch)
end)

function DoProcessing(player, gather, process, processKey, antiglitchKey)
    -- #4 Check if player have items we need to process
    if PlayerData[player].inventory[process.step_require] == nil or PlayerData[player].inventory[process.step_require] < process.step_require_number then
        CallRemoteEvent(player, 'KNotify:Send', _("process_not_enough_item", process.step_require_number, _(process.step_require)), "#f00")
        StopProcessing(player, gather, process)
        return
    end
    
    -- #4bis If knowledge is necesasry, check for it
    local canProcess = 1
    if gather.require_knowledge == true and canProcess == 0 then
        CallRemoteEvent(player, 'KNotify:Send', _("drugdealer_noknowledgeforthis"), "#f00")
        SetPlayerNotBusy(player)
        return
    end
    
    -- #5 Lock and prepare player
    CallRemoteEvent(player, "LockControlMove", true)
    SetPlayerBusy(player)
    
    -- #6 Start animation and loop
    SetPlayerAnimation(player, process.step_animation or defaultAnimationProcess)
    if PlayerData[player].timerProcessing ~= nil then DestroyTimer(PlayerData[player].timerProcessing) end
    PlayerData[player].timerProcessing = CreateTimer(function(player, anim)-- for anim loop
        SetPlayerAnimation(player, anim)
    end, 4000, player, process.step_animation or defaultAnimationProcess)
    
    -- #7 Display loading bar
    CallRemoteEvent(player, "loadingbar:show", _("process") .. " " .. _(process.step_processed_item), process.step_process_time)-- LOADING BAR
    -- #8 When job is done, add to inventory and loop
    if PlayerData[player].isProcessing == processKey and RemoveInventory(player, process.step_require, process.step_require_number) and PlayerData[player].gatheringAntiGlitch == antiglitchKey then
        Delay(process.step_process_time * 1000, function()
            if GetPlayerBusy(player) and PlayerData[player].isProcessing == processKey and PlayerData[player].gatheringAntiGlitch == antiglitchKey then -- Check if the player didnt canceled the job
                if AddInventory(player, process.step_processed_item, process.step_processed_item_number) == true then
                    CallRemoteEvent(player, 'KNotify:Send', _("process_success", process.step_processed_item_number, _(process.step_processed_item)), "#0f0")
                    DoProcessing(player, gather, process, processKey, antiglitchKey)
                else
                    CallRemoteEvent(player, 'KNotify:Send', _("inventory_notenoughspace"), "#f00")
                    StopProcessing(player, gather, process)
                end
            end
        end)
    else
        CallRemoteEvent(player, 'KNotify:Send', _("process_not_enough_item", process.step_require_number, _(process.step_require)), "#f00")
        StopProcessing(player, gather, process)
    end
end

function StopProcessing(player, gather, process)
    SetPlayerNotBusy(player)
    PlayerData[player].isProcessing = nil
    if PlayerData[player].timerProcessing ~= nil then DestroyTimer(PlayerData[player].timerProcessing) end -- for anim loop
    PlayerData[player].timerProcessing = nil
    SetPlayerAnimation(player, "STOP")
    CallRemoteEvent(player, "LockControlMove", false)
    if process.step_animation_attachement ~= nil then SetAttachedItem(player, process.step_animation_attachement.bone, 0) end
    CallRemoteEvent(player, "loadingbar:hide")
end


--- SELLING
function StartSelling(player, npc)
    local gather = GetGatherBySellNpc(npc)
    local item = gatherTable[gather[1]].sell_zone[gather[2]].item_to_sell
    local time = gatherTable[gather[1]].sell_zone[gather[2]].sell_time
    local price = gatherTable[gather[1]].sell_zone[gather[2]].price_per_unit
    if PlayerData[player].inventory[item] ~= nil and PlayerData[player].inventory[item] > 0 then
        Delay(time * 1000, function()
            local x, y, z = GetPlayerLocation(player)
            local x2, y2, z2 = GetNPCLocation(npc)
            if GetDistance3D(x, y, z, x2, y2, z2) <= 200 then
                local totalPrice = tonumber(PlayerData[player].inventory[item]) * price
                CallRemoteEvent(player, 'KNotify:Send', _("sold_item_for_money", tonumber(PlayerData[player].inventory[item]), _(item), totalPrice), "#0f0")
                AddPlayerCash(player, totalPrice)
                RemoveInventory(player, item, tonumber(PlayerData[player].inventory[item]))
            else
                CallRemoteEvent(player, 'KNotify:Send', _("too_far_from_seller"), "#f00")
            end
        end)
    else
        CallRemoteEvent(player, 'KNotify:Send', _("nothing_to_sell"), "#f00")
    end
end
AddRemoteEvent("gathering:sell:start", StartSelling)



-- tools
function GetGatherByGatherPickup(gatherPickup)
    for k, v in pairs(gatherTable) do
        for k2, v2 in pairs(v.gatherPickup) do
            if v2 == gatherPickup then
                return k
            end
        end
    end
end

function GetGatherByProcessPickup(processPickup)
    for k, v in pairs(gatherTable) do
        if v.process_steps ~= nil then
            for k2, v2 in pairs(v.process_steps) do
                if v2.processPickup == processPickup then
                    return {k, k2}
                end
            end
        end
    end
end

function GetGatherBySellNpc(npc)
    for k, v in pairs(gatherTable) do
        if v.sell_zone ~= nil then
            for k2, v2 in pairs(v.sell_zone) do
                if v2.sellNpc == npc then
                    return {k, k2}
                end
            end
        end
    end
end
