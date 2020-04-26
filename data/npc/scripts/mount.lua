local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

npcHandler:setMessage(MESSAGE_GREET, "Ola |PLAYERNAME|. Voce pode me ajudar? Se voce me ajudar, vou te recompensar com lindas montarias! Basta dizer {mounts} ou {ajuda} se voce nao sabe o que fazer.")

function playerBuyMountNPC(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end
if (parameters.confirm ~= true) and (parameters.decline ~= true) then
if(getPlayerPremiumDays(cid) >= 1) and (parameters.premium == true) then
npcHandler:say('Desculpe, mas esta montaria e apenas para jogadores premium!', cid)
npcHandler:resetNpc()
return true
end
if (getPlayerStorageValue(cid, parameters.storageID) ~= -1) then
npcHandler:say('Voce ja tem esta montaria!', cid)
npcHandler:resetNpc()
return true
end
local itemsTable = parameters.items
local items_list = ''
if table.maxn(itemsTable) > 0 then
for i = 1, table.maxn(itemsTable) do
local item = itemsTable[i]
items_list = items_list .. item[2] .. ' ' .. getItemNameById(item[1])
if i ~= table.maxn(itemsTable) then
items_list = items_list .. ', '
end
end
end
local text = ''
if (parameters.cost > 0) and table.maxn(parameters.items) then
text = items_list .. ' and ' .. parameters.cost .. ' gp'
elseif (parameters.cost > 0) then
text = parameters.cost .. ' gp'
elseif table.maxn(parameters.items) then
text = items_list
end
npcHandler:say('Trouxeste-me ' .. text .. ' por ' .. keywords[1] .. '?', cid)
return true
elseif (parameters.confirm == true) then
local mountNode = node:getParent()
local mountinfo = mountNode:getParameters()
local items_number = 0
if table.maxn(mountinfo.items) > 0 then
for i = 1, table.maxn(mountinfo.items) do
local item = mountinfo.items[i]
if (getPlayerItemCount(cid,item[1]) >= item[2]) then
items_number = items_number + 1
end
end
end
if(getPlayerMoney(cid) >= mountinfo.cost) and (items_number == table.maxn(mountinfo.items)) then
doPlayerRemoveMoney(cid, mountinfo.cost)
if table.maxn(mountinfo.items) > 0 then
for i = 1, table.maxn(mountinfo.items) do
local item = mountinfo.items[i]
doPlayerRemoveItem(cid,item[1],item[2])
end
end
doPlayerAddMount(cid, mountinfo.mountid)
setPlayerStorageValue(cid,mountinfo.storageID,1)
npcHandler:say('Aqui esta.', cid)
else
npcHandler:say('Voce nao tem os items necessarios ou dinheiro!', cid)
end
npcHandler:resetNpc()
return true
elseif (parameters.decline == true) then
npcHandler:say('Este nao lhe interessa? Experimente outro!', cid)
npcHandler:resetNpc()
return true
end
return false
end

local noNode = KeywordNode:new({'no'}, playerBuyMountNPC, {decline = true})
local yesNode = KeywordNode:new({'yes'}, playerBuyMountNPC, {confirm = true})

-- Widow Queen (done)(custom)
local mount_node = keywordHandler:addKeyword({'Widow Queen'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 1, storageID = 11001})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Racing Bird (done)(custom)
local mount_node = keywordHandler:addKeyword({'Racing Bird'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 2, storageID = 11002})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- War Bear (done)(custom)
local mount_node = keywordHandler:addKeyword({'War Bear'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 3, storageID = 11003})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Black Sheep (done)(custom)
local mount_node = keywordHandler:addKeyword({'Black Sheep'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 4, storageID = 11004})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Midnight Panther (done)(custom)
local mount_node = keywordHandler:addKeyword({'Midnight Panther'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 5, storageID = 11005})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Draptor (done)(custom)
local mount_node = keywordHandler:addKeyword({'Draptor'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 6, storageID = 11006})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Titanica (done)(custom)
local mount_node = keywordHandler:addKeyword({'Titanica'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 7, storageID = 11007})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Tin Lizzard (done)(custom)
local mount_node = keywordHandler:addKeyword({'Tin Lizzard'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 8, storageID = 11008})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Blazebringer (done)(custom)
local mount_node = keywordHandler:addKeyword({'Blazebringer'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 9, storageID = 11009})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Rapid Boar (done)(custom)
local mount_node = keywordHandler:addKeyword({'Rapid Boar'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 10, storageID = 11010})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Stampor (done)(custom)
local mount_node = keywordHandler:addKeyword({'Stampor'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 11, storageID = 11011})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Undead Cavebear (done)(custom)
local mount_node = keywordHandler:addKeyword({'Undead Cavebear'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 12, storageID = 11012})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Donkey (done)(custom)
local mount_node = keywordHandler:addKeyword({'Donkey'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 13, storageID = 11013})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Tiger Slug (done)(custom)
local mount_node = keywordHandler:addKeyword({'Tiger Slug'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 14, storageID = 11014})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Uniwheel (done)(custom)
local mount_node = keywordHandler:addKeyword({'Uniwheel'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 15, storageID = 11015})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Crystal Wolf (done)(custom)
local mount_node = keywordHandler:addKeyword({'Crystal Wolf'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 16, storageID = 11016})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- War Horse (done)(custom)
local mount_node = keywordHandler:addKeyword({'War Horse'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 17, storageID = 11017})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Kingly Deer (done)(custom)
local mount_node = keywordHandler:addKeyword({'Kingly Deer'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 18, storageID = 11018})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Tamed Panda (done)(custom)
local mount_node = keywordHandler:addKeyword({'Tamed Panda'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 19, storageID = 11019})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Dromedary (done)(custom)
local mount_node = keywordHandler:addKeyword({'Dromedary'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 20, storageID = 11020})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Scorpion King (done)(custom)
local mount_node = keywordHandler:addKeyword({'Scorpion King'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 21, storageID = 11021})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Rented Horse (done)(custom)
local mount_node = keywordHandler:addKeyword({'Rented Horse'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 22, storageID = 11022})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Armoured War Horse (done)(custom)
local mount_node = keywordHandler:addKeyword({'Armoured War Horse'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 23, storageID = 11023})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Shadow Draptor (done)(custom)
local mount_node = keywordHandler:addKeyword({'Shadow Draptor'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 24, storageID = 11024})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Rented Horse (done)(custom)
local mount_node = keywordHandler:addKeyword({'Rented Horse'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 25, storageID = 11025})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Rented Horse (done)(custom)
local mount_node = keywordHandler:addKeyword({'Rented Horse'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 26, storageID = 11026})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Lady Bug (done)(custom)
local mount_node = keywordHandler:addKeyword({'Lady Bug'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 27, storageID = 11027})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Manta Ray (done)(custom)
local mount_node = keywordHandler:addKeyword({'Manta Ray'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 28, storageID = 11028})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Ironblight (done)(custom)
local mount_node = keywordHandler:addKeyword({'Ironblight'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 29, storageID = 11029})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Magma Crawler (done)(custom)
local mount_node = keywordHandler:addKeyword({'MagmaCrawler'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 30, storageID = 11030})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Dragonling (done)(custom)
local mount_node = keywordHandler:addKeyword({'Dragonling'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 31, storageID = 11031})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Gnarlhound (done)(custom)
local mount_node = keywordHandler:addKeyword({'Gnarlhound'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 32, storageID = 11032})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Crimson Ray (done)(custom)
local mount_node = keywordHandler:addKeyword({'Crimson Ray'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 33, storageID = 11033})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Steelbeak (done)(custom)
local mount_node = keywordHandler:addKeyword({'Steelbeak'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 34, storageID = 11034})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Water Buffalo (done)(custom)
local mount_node = keywordHandler:addKeyword({'Water Buffalo'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 35, storageID = 11035})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Tombstinger (done)(custom)
local mount_node = keywordHandler:addKeyword({'Tombstinger'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 36, storageID = 11036})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Platesaurian (done)(custom)
local mount_node = keywordHandler:addKeyword({'Platesaurian'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 37, storageID = 11037})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Ursagrodon (done)(custom)
local mount_node = keywordHandler:addKeyword({'Ursagrodon'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 38, storageID = 11038})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- The Hellgrip (done)(custom)
local mount_node = keywordHandler:addKeyword({'The Hellgrip'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 39, storageID = 11039})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Noble Lion (done)(custom)
local mount_node = keywordHandler:addKeyword({'Noble Lion'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 40, storageID = 11040})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Desert King (done)(custom)
local mount_node = keywordHandler:addKeyword({'Desert King'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 41, storageID = 11041})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Shock Head (done)(custom)
local mount_node = keywordHandler:addKeyword({'Shock Head'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 42, storageID = 11042})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Walker (done)(custom)
local mount_node = keywordHandler:addKeyword({'Walker'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 43, storageID = 11043})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Azudocus (done)(custom)
local mount_node = keywordHandler:addKeyword({'Azudocus'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 44, storageID = 11044})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Carpacosaurus (done)(custom)
local mount_node = keywordHandler:addKeyword({'Carpacosaurus'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 45, storageID = 11045})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Death Crawler (done)(custom)
local mount_node = keywordHandler:addKeyword({'Death Crawler'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 46, storageID = 11046})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Flamesteed (done)(custom)
local mount_node = keywordHandler:addKeyword({'Flamesteed'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 47, storageID = 11047})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Jade Lion (done)(custom)
local mount_node = keywordHandler:addKeyword({'Jade Lion'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 48, storageID = 11048})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Jade Pincer (done)(custom)
local mount_node = keywordHandler:addKeyword({'Jade Pincer'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 49, storageID = 11049})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Nethersteed (done)(custom)
local mount_node = keywordHandler:addKeyword({'Nethersteed'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 50, storageID = 11050})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Tempest (done)(custom)
local mount_node = keywordHandler:addKeyword({'Tempest'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 51, storageID = 11051})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Winter King (done)(custom)
local mount_node = keywordHandler:addKeyword({'Winter King'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 52, storageID = 11052})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Doombringer (done)(custom)
local mount_node = keywordHandler:addKeyword({'Doombringer'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 53, storageID = 11053})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Woodland Prince (done)(custom)
local mount_node = keywordHandler:addKeyword({'Woodland Prince'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 54, storageID = 11054})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Hailstorm Fury (done)(custom)
local mount_node = keywordHandler:addKeyword({'Hailstorm Fury'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 55, storageID = 11055})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Siegebreaker (done)(custom)
local mount_node = keywordHandler:addKeyword({'Siegebreaker'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 56, storageID = 11056})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Poisonbane (done)(custom)
local mount_node = keywordHandler:addKeyword({'Poisonbane'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 57, storageID = 11057})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Blackpelt (done)(custom)
local mount_node = keywordHandler:addKeyword({'Blackpelt'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 58, storageID = 11058})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Golden Dragonfly (done)(custom)
local mount_node = keywordHandler:addKeyword({'Golden Dragonfly'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 59, storageID = 11059})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)


-- Steel Bee (done)(custom)
local mount_node = keywordHandler:addKeyword({'Steel Bee'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 60, storageID = 11060})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Copper Fly (done)(custom)
local mount_node = keywordHandler:addKeyword({'Copper Fly'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 61, storageID = 11061})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Tundra Rambler (done)(custom)
local mount_node = keywordHandler:addKeyword({'Tundra Rambler'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 62, storageID = 11062})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Highland Yak (done)(custom)
local mount_node = keywordHandler:addKeyword({'Highland Yak'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 63, storageID = 11063})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Glacier Vagabond (done)(custom)
local mount_node = keywordHandler:addKeyword({'Glacier Vagabond'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 64, storageID = 11064})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Flying Divan (done)(custom)
local mount_node = keywordHandler:addKeyword({'Flying Divan'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 65, storageID = 11065})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Magic Carpet (done)(custom)
local mount_node = keywordHandler:addKeyword({'Magic Carpet'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 66, storageID = 11066})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Floating Kashmir (done)(custom)
local mount_node = keywordHandler:addKeyword({'Floating Kashmir'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 67, storageID = 11067})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Ringtail Waccoon (done)(custom)
local mount_node = keywordHandler:addKeyword({'Ringtail Waccoon'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 68, storageID = 11068})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Night Waccoon (done)(custom)
local mount_node = keywordHandler:addKeyword({'Night Waccoon'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 69, storageID = 11069})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Emerald Waccoon (done)(custom)
local mount_node = keywordHandler:addKeyword({'Emerald Waccoon'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 70, storageID = 11070})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Glooth Glider (done)(custom)
local mount_node = keywordHandler:addKeyword({'Glooth Glider'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 71, storageID = 11071})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Shadow Hart (done)(custom)
local mount_node = keywordHandler:addKeyword({'Shadow Hart'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 72, storageID = 11072})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Black Stag (done)(custom)
local mount_node = keywordHandler:addKeyword({'Black Stag'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 73, storageID = 11073})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Emperor Deer (done)(custom)
local mount_node = keywordHandler:addKeyword({'Emperor Deer'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 74, storageID = 11074})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Flitterkatzen (done)(custom)
local mount_node = keywordHandler:addKeyword({'Flitterkatzen'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 75, storageID = 11075})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Venompaw (done)(custom)
local mount_node = keywordHandler:addKeyword({'Venompaw'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 76, storageID = 11076})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Batcat (done)(custom)
local mount_node = keywordHandler:addKeyword({'Batcat'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 77, storageID = 11077})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Sea Devil (done)(custom)
local mount_node = keywordHandler:addKeyword({'Sea Devil'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 78, storageID = 11078})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Coralripper (done)(custom)
local mount_node = keywordHandler:addKeyword({'Coralripper'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 79, storageID = 11079})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Plumfish (done)(custom)
local mount_node = keywordHandler:addKeyword({'Plumfish'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 80, storageID = 11080})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Gorongra (done)(custom)
local mount_node = keywordHandler:addKeyword({'Gorongra'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 81, storageID = 11081})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Noctungra (done)(custom)
local mount_node = keywordHandler:addKeyword({'Noctungra'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 82, storageID = 11082})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Silverneck (done)(custom)
local mount_node = keywordHandler:addKeyword({'Silverneck'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 83, storageID = 11083})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Slagsnare (done)(custom)
local mount_node = keywordHandler:addKeyword({'Slagsnare'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 84, storageID = 11084})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Nightstinger (done)(custom)
local mount_node = keywordHandler:addKeyword({'Nightstinger'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 85, storageID = 11085})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Razorcreep (done)(custom)
local mount_node = keywordHandler:addKeyword({'Razorcreep'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 86, storageID = 11086})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Rift Runner (done)(custom)
local mount_node = keywordHandler:addKeyword({'Rift Runner'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 87, storageID = 11087})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Nightdweller (done)(custom)
local mount_node = keywordHandler:addKeyword({'Nightdweller'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 88, storageID = 11088})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Frostflare (done)(custom)
local mount_node = keywordHandler:addKeyword({'Frostflare'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 89, storageID = 11089})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Cinderhoof (done)(custom)
local mount_node = keywordHandler:addKeyword({'Cinderhoof'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 90, storageID = 11090})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Mouldpincer (done)(custom)
local mount_node = keywordHandler:addKeyword({'Mouldpincer'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 91, storageID = 11091})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Bloodcurl (done)(custom)
local mount_node = keywordHandler:addKeyword({'Bloodcurl'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 92, storageID = 11092})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Leafscuttler (done)(custom)
local mount_node = keywordHandler:addKeyword({'Leafscuttler'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 93, storageID = 11093})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Sparkion (done)(custom)
local mount_node = keywordHandler:addKeyword({'Sparkion'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 94, storageID = 11094})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Swamp Snapper (done)(custom)
local mount_node = keywordHandler:addKeyword({'Swamp Snapper'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 95, storageID = 11095})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Mould Shell (done)(custom)
local mount_node = keywordHandler:addKeyword({'Mould Shell'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 96, storageID = 11096})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Reed Lurker (done)(custom)
local mount_node = keywordHandler:addKeyword({'Reed Lurker'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 97, storageID = 11097})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Neon Sparkid (done)(custom)
local mount_node = keywordHandler:addKeyword({'Neon Sparkid'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 98, storageID = 11098})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Vortexion(done)(custom)
local mount_node = keywordHandler:addKeyword({'Vortexion'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 99, storageID = 11099})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Ivory Fang(done)(custom)
local mount_node = keywordHandler:addKeyword({'Ivory Fang'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 100, storageID = 11100})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Shadow Claw(done)(custom)
local mount_node = keywordHandler:addKeyword({'Shadow Claw'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 101, storageID = 11101})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Snow Pelt(done)(custom)
local mount_node = keywordHandler:addKeyword({'Snow Pelt'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 102, storageID = 11102})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Jackalope(done)(custom)
local mount_node = keywordHandler:addKeyword({'Jackalope'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 103, storageID = 11103})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Dreadhare(done)(custom)
local mount_node = keywordHandler:addKeyword({'Dreadhare'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 104, storageID = 11104})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Wolpertinger(done)(custom)
local mount_node = keywordHandler:addKeyword({'Wolpertinger'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 105, storageID = 11105})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Stone Rhino(done)(custom)
local mount_node = keywordHandler:addKeyword({'Stone Rhino'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 106, storageID = 11106})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Gold Sphinx(done)(custom)
local mount_node = keywordHandler:addKeyword({'Gold Sphinx'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 107, storageID = 11107})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Emerald Sphinx(done)(custom)
local mount_node = keywordHandler:addKeyword({'Emerald Sphinx'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 108, storageID = 11108})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Shadow Sphinx(done)(custom)
local mount_node = keywordHandler:addKeyword({'Shadow Sphinx'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 109, storageID = 11109})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Jungle Saurian(done)(custom)
local mount_node = keywordHandler:addKeyword({'Jungle Saurian'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 110, storageID = 11110})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Ember Saurian(done)(custom)
local mount_node = keywordHandler:addKeyword({'Ember Saurian'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 111, storageID = 11111})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Lagoon Saurian(done)(custom)
local mount_node = keywordHandler:addKeyword({'Lagoon Saurian'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 112, storageID = 11112})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Blazing Unicorn(done)(custom)
local mount_node = keywordHandler:addKeyword({'Blazing Unicorn'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 113, storageID = 11113})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Arctic Unicorn(done)(custom)
local mount_node = keywordHandler:addKeyword({'Arctic Unicorn'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 114, storageID = 11114})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Prismatic unicorn(done)(custom)
local mount_node = keywordHandler:addKeyword({'Prismatic unicorn'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 115, storageID = 11115})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Cranium Spider(done)(custom)
local mount_node = keywordHandler:addKeyword({'Cranium Spider'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 116, storageID = 11116})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Cave Tarantula(done)(custom)
local mount_node = keywordHandler:addKeyword({'Cave Tarantula'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 117, storageID = 11117})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Gloom Widow(done)(custom)
local mount_node = keywordHandler:addKeyword({'Gloom Widow'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 118, storageID = 11118})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Mole(done)(custom)
local mount_node = keywordHandler:addKeyword({'Mole'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 119, storageID = 11119})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Marsh Toad(done)(custom)
local mount_node = keywordHandler:addKeyword({'Marsh Toad'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 120, storageID = 11120})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Sanguine Frog(done)(custom)
local mount_node = keywordHandler:addKeyword({'Sanguine Frog'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 121, storageID = 11121})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Toxic Toad(done)(custom)
local mount_node = keywordHandler:addKeyword({'Toxic Toad'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 122, storageID = 11122})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Ebony Tiger(done)(custom)
local mount_node = keywordHandler:addKeyword({'Ebony Tiger'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 123, storageID = 11123})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Feral Tiger(done)(custom)
local mount_node = keywordHandler:addKeyword({'Feral Tiger'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 124, storageID = 11124})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Jungle Tiger(done)(custom)
local mount_node = keywordHandler:addKeyword({'Jungle Tiger'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 125, storageID = 11125})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Fleeting Knowledge(done)(custom)
local mount_node = keywordHandler:addKeyword({'Fleeting Knowledge'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 126, storageID = 11126})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Tawny Owl(done)(custom)
local mount_node = keywordHandler:addKeyword({'Tawny Owl'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 127, storageID = 11127})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Snowy Owl(done)(custom)
local mount_node = keywordHandler:addKeyword({'Snowy Owl'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 128, storageID = 11128})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Boreal Owl(done)(custom)
local mount_node = keywordHandler:addKeyword({'Boreal Owl'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 129, storageID = 11129})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Lacewing Moth(done)(custom)
local mount_node = keywordHandler:addKeyword({'Lacewing Moth'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 130, storageID = 11130})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Hibernal Moth(done)(custom)
local mount_node = keywordHandler:addKeyword({'Hibernal Moth'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 131, storageID = 11131})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Cold Percht Sleigh(done)(custom)
local mount_node = keywordHandler:addKeyword({'Cold Percht Sleigh'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 132, storageID = 11132})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Bright Percht Sleigh(done)(custom)
local mount_node = keywordHandler:addKeyword({'Bright Percht Sleigh'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 133, storageID = 11133})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Dark Percht Sleigh(done)(custom)
local mount_node = keywordHandler:addKeyword({'Dark Percht Sleigh'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 134, storageID = 11134})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Festive Snowman(done)(custom)
local mount_node = keywordHandler:addKeyword({'Festive Snowman'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 135, storageID = 11135})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Muffled Snowman(done)(custom)
local mount_node = keywordHandler:addKeyword({'Muffled Snowman'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 136, storageID = 11136})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Caped Snowman(done)(custom)
local mount_node = keywordHandler:addKeyword({'Caped Snowman'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 137, storageID = 11137})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Rabbit Rickshaw(done)(custom)
local mount_node = keywordHandler:addKeyword({'Rabbit Rickshaw'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 138, storageID = 11138})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Bunny Dray(done)(custom)
local mount_node = keywordHandler:addKeyword({'Bunny Dray'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 139, storageID = 11139})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Cony Cart(done)(custom)
local mount_node = keywordHandler:addKeyword({'Cony Cart'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 140, storageID = 11140})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--River Crocovile(done)(custom)
local mount_node = keywordHandler:addKeyword({'River Crocovile'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 141, storageID = 11141})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Swamp Crocovile(done)(custom)
local mount_node = keywordHandler:addKeyword({'Swamp Crocovile'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 142, storageID = 11142})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Nightmarish Crocovile(done)(custom)
local mount_node = keywordHandler:addKeyword({'Nightmarish Crocovile'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 143, storageID = 11143})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Jousting Eagle(done)(custom)
local mount_node = keywordHandler:addKeyword({'Jousting Eagle'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 144, storageID = 11144})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Cerberus Champion(done)(custom)
local mount_node = keywordHandler:addKeyword({'Cerberus Champion'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 145, storageID = 11145})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Percht Sleigh(done)(custom)
local mount_node = keywordHandler:addKeyword({'Percht Sleigh'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 146, storageID = 11146})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Percht Sleigh(done)(custom)
local mount_node = keywordHandler:addKeyword({'Percht Sleigh'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 147, storageID = 11147})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Percht Sleigh(done)(custom)
local mount_node = keywordHandler:addKeyword({'Percht Sleigh'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 148, storageID = 11148})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Percht Sleigh(done)(custom)
local mount_node = keywordHandler:addKeyword({'Percht Sleigh'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 149, storageID = 11149})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Percht Sleigh(done)(custom)
local mount_node = keywordHandler:addKeyword({'Percht Sleigh'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 150, storageID = 11150})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Percht Sleigh(done)(custom)
local mount_node = keywordHandler:addKeyword({'Percht Sleigh'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 151, storageID = 11151})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Batle Badger(done)(custom)
local mount_node = keywordHandler:addKeyword({'Batle Badger'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 152, storageID = 11152})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Ether Badger(done)(custom)
local mount_node = keywordHandler:addKeyword({'Ether Badger'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 153, storageID = 11153})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Zaoan Badger(done)(custom)
local mount_node = keywordHandler:addKeyword({'Zaoan Badger'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 154, storageID = 11154})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Blue Rolling Barrel(done)(custom)
local mount_node = keywordHandler:addKeyword({'Blue Rolling Barrel'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 155, storageID = 11155})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Red Rolling Barrel(done)(custom)
local mount_node = keywordHandler:addKeyword({'Red Rolling Barrel'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 156, storageID = 11156})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Green Rolling Barrel(done)(custom)
local mount_node = keywordHandler:addKeyword({'Green Rolling Barrel'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 157, storageID = 11157})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Floating Sage(done)(custom)
local mount_node = keywordHandler:addKeyword({'Floating Sage'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 158, storageID = 11158})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Floating Scholar(done)(custom)
local mount_node = keywordHandler:addKeyword({'Floating Scholar'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 159, storageID = 11159})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Floating Augur(done)(custom)
local mount_node = keywordHandler:addKeyword({'Floating Augur'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 160, storageID = 11160})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Haze(done)(custom)
local mount_node = keywordHandler:addKeyword({'Haze'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 161, storageID = 11161})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Antelope(done)(custom)
local mount_node = keywordHandler:addKeyword({'Antelope'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 162, storageID = 11162})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Snow Strinder(done)(custom)
local mount_node = keywordHandler:addKeyword({'Snow Strinder'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 163, storageID = 11163})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Dusk Pryer(done)(custom)
local mount_node = keywordHandler:addKeyword({'Dusk Pryer'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 164, storageID = 11164})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Dawn Strayer(done)(custom)
local mount_node = keywordHandler:addKeyword({'Dawn Strayer'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 165, storageID = 11165})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Benevolent Savanna Ostrich(done)(custom)
local mount_node = keywordHandler:addKeyword({'Benevolent Savanna Ostrich'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 166, storageID = 11166})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Benevolent Coral Rhea(done)(custom)
local mount_node = keywordHandler:addKeyword({'Benevolent Coral Rhea'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 167, storageID = 11167})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

--Benevolent Eventide Nandu(done)(custom)
local mount_node = keywordHandler:addKeyword({'Benevolent Eventide Nandu'}, playerBuyMountNPC, {premium = false, cost = 5000000, items = {}, mountid = 168, storageID = 11168})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)


keywordHandler:addKeyword({'mounts'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te dar, {Widow Queen}, {Racing Bird}, {War Bear}, {Black Sheep}, {Midnight Panther}, {Draptor}, {Titanica}, {Tin Lizzard}, {Blazebringer}, {Rapid Boar}, {Stampor}, {Undead Cavebear}, {Donkey}, {Tiger Slug}, {Uniwheel}, {Crystal Wolf}, {War Horse}, {Kingly Deer}, {Tamed Panda}, {Dromedary}, {Scorpion King}, {Rented Horse}, {Armoured War Horse}, {Shadow Draptor}, {Rented Horse}, {Rented Horse}, {Lady Bug}, {Manta Ray}, {Ironblight}, {MagmaCrawler}, {Dragonling}, {Gnarlhound}, {Crimson Ray}, {Steelbeak}, {Water Buffalo}, {Tombstinger}, {Platesaurian}, {Ursagrodon}, {The Hellgrip}, {Noble Lion}, {Desert King}, {Shock Head}, {Walker}, {Azudocus}, {Carpacosaurus}, {Death Crawler}, {Flamesteed}, {Jade Lion}, {Jade Pincer}, {Nethersteed}, {Tempest}, {Winter King}, {Doombringer}, {Woodland Prince}, {Hailstorm Fury}, {Siegebreaker}, {Poisonbane}, {Blackpelt}, {Golden Dragonfly}, {Steel Bee}, {Copper Fly}, {Tundra Rambler}, {Highland Yak}, {Glacier Vagabond}, {Flying Divan}, {Magic Carpet}, {Floating Kashmir}, {Ringtail Waccoon}, {Night Waccoon}, {Emerald Waccoon}, {Glooth Glider}, {Shadow Hart}, {Black Stag}, {Emperor Deer}, {Flitterkatzen}, {Venompaw}, {Batcat}, {Sea Devil}, {Coralripper}, {Plumfish}, {Gorongra}, {Noctungra}, {Silverneck}, {Slagsnare}, {Nightstinger}, {Razorcreep}, {Rift Runner}, {Nightdweller}, {Frostflare}, {Cinderhoof}, {Mouldpincer}, {Bloodcurl}, {Leafscuttler}, {Sparkion}, {Swamp Snapper}, {Mould Shell}, {Reed Lurker}, {Neon Sparkid}, {Vortexion}, {Ivory Fang}, {Shadow Claw}, {Snow Pelt}, {Jackalope}, {Dreadhare}, {Wolpertinger}, {Stone Rhino}, {Gold Sphinx}, {Emerald Sphinx}, {Shadow Sphinx}, {Jungle Saurian}, {Ember Saurian}, {Lagoon Saurian}, {Blazing Unicorn}, {Arctic Unicorn}, {Prismatic unicorn}, {Cranium Spider}, {Cave Tarantula}, {Gloom Widow}, {Mole}, {Marsh Toad}, {Sanguine Frog}, {Toxic Toad}, {Ebony Tiger}, {Feral Tiger}, {Jungle Tiger}, {Fleeting Knowledge}, {Tawny Owl}, {Snowy Owl}, {Boreal Owl}, {Lacewing Moth}, {Hibernal Moth}, {Cold Percht Sleigh}, {Bright Percht Sleigh}, {Dark Percht Sleigh}, {Festive Snowman}, {Muffled Snowman}, {Caped Snowman}, {Rabbit Rickshaw}, {Bunny Dray}, {Cony Cart}, {River Crocovile}, {Swamp Crocovile}, {Nightmarish Crocovile}, {Jousting Eagle}, {Cerberus Champion}, {Percht Sleigh}, {Percht Sleigh}, {Percht Sleigh}, {Percht Sleigh}, {Percht Sleigh}, {Percht Sleigh}, {Batle Badger}, {Ether Badger}, {Zaoan Badger}, {Blue Rolling Barrel}, {Red Rolling Barrel}, {Green Rolling Barrel}, {Floating Sage}, {Floating Scholar}, {Floating Augur}, {Haze}, {Antelope}, {Snow Strinder}, {Dusk Pryer}, {Dawn Strayer}, {Benevolent Savanna Ostrich}, {Benevolent Coral Rhea}, {Benevolent Eventide Nandu}'})
keywordHandler:addKeyword({'ajuda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Para ter a montaria fale um dos nomes da lista (falando {mounts}) e consiga os items nescessarios.'})
npcHandler:addModule(FocusModule:new())