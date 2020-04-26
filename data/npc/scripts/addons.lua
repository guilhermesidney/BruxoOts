local keywordHandler = KeywordHandler:new()

local npcHandler = NpcHandler:new(keywordHandler)

local talkState = {}

local rtnt = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function onThink() npcHandler:onThink() end

 

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. I need your help and I'll reward you with nice addons if you help me! Just say {addons} or {help} if you don't know what to do.")

 

addoninfo = {

['citizen'] = {cost =3000000, outfit_male = 128, outfit_female = 136, addon = 3, storageID = 10042},

['hunter'] = {cost =3000000, outfit_male = 129, outfit_female = 137, addon = 3, storageID = 10043},

['knight'] = {cost =3000000, outfit_male = 131, outfit_female = 139, addon = 3, storageID = 10044},

['mage'] = {cost =3000000, outfit_male = 130, outfit_female = 138, addon = 3, storageID = 10045},

['summoner'] = {cost =3000000, outfit_male = 133, outfit_female = 141, addon = 3, storageID = 10046},

['barbarian'] = {cost =3000000, outfit_male = 143, outfit_female = 147, addon = 3, storageID = 10047},

['druid'] = {cost =3000000, outfit_male = 144, outfit_female = 148, addon = 3, storageID = 10048},

['nobleman'] = {cost = 3000000, outfit_male = 132, outfit_female = 140, addon = 3, storageID = 10049},

['oriental'] = {cost =3000000, outfit_male = 146, outfit_female = 150, addon = 3, storageID = 10050},

['warrior'] = {cost =3000000, outfit_male = 134, outfit_female = 142, addon = 3, storageID = 10051},

['wizard'] = {cost =3000000, outfit_male = 145, outfit_female = 149, addon = 3, storageID = 10052},

['assassin'] = {cost =3000000, outfit_male = 152, outfit_female = 156, addon = 3, storageID = 10053},

['beggar'] = {cost =3000000, outfit_male = 153, outfit_female = 157, addon = 3, storageID = 10054},

['pirate'] = {cost =3000000, outfit_male = 151, outfit_female = 155, addon = 3, storageID = 10055},

['shaman'] = {cost =3000000, outfit_male = 154, outfit_female = 158, addon = 3, storageID = 10056},

['norseman'] = {cost =3000000, outfit_male = 251, outfit_female = 252, addon = 3, storageID = 10057},

['jester'] = {cost =3000000, outfit_male = 273, outfit_female = 270, addon = 3, storageID = 10058},

['demonhunter'] = {cost =3000000, outfit_male = 289, outfit_female = 288, addon = 3, storageID = 10059},

['nightmare'] = {cost =3000000, outfit_male = 268, outfit_female = 269, addon = 3, storageID = 10060},

['brotherhood'] = {cost =3000000, outfit_male = 278, outfit_female = 279, addon = 3, storageID = 10061},

['yalaharian'] = {cost =3000000, outfit_male = 325, outfit_female = 324, addon = 3, storageID = 10062},

['yalaharian'] = {cost =3000000, outfit_male = 325, outfit_female = 324, addon = 3, storageID = 10063},

['afflicted'] = {cost =3000000, outfit_male = 430, outfit_female = 431, addon = 3, storageID = 10064},

['battlemage'] = {cost =3000000, outfit_male = 1069, outfit_female = 1070, addon = 3, storageID = 10065},

['caveexplorer'] = {cost =3000000, outfit_male = 574, outfit_female = 575, addon = 3, storageID = 10066},

['crystalwarlord'] = {cost =3000000, outfit_male = 512, outfit_female = 513, addon = 3, storageID = 10067},

['deepling'] = {cost =3000000, outfit_male = 463, outfit_female = 464, addon = 3, storageID = 10068},

['demon'] = {cost =3000000, outfit_male = 541, outfit_female = 542, addon = 3, storageID = 10069},

['discoverer'] = {cost =3000000, outfit_male = 1094, outfit_female = 1095, addon = 3, storageID = 10070},

['dreamwarden'] = {cost =3000000, outfit_male = 577, outfit_female = 578, addon = 3, storageID = 10071},

['dreamwarrior'] = {cost =3000000, outfit_male = 1146, outfit_female = 1147, addon = 3, storageID = 10072},

['elementalist'] = {cost =3000000, outfit_male = 432, outfit_female = 433, addon = 3, storageID = 10073},

['festive'] = {cost =3000000, outfit_male = 931, outfit_female = 929, addon = 3, storageID = 10074},

['gloothengineer'] = {cost =3000000, outfit_male = 610, outfit_female = 618, addon = 3, storageID = 10075},

['tombassassin'] = {cost =3000000, outfit_male = 1243, outfit_female = 1244, addon = 3, storageID = 10076},

['insectoid'] = {cost =3000000, outfit_male = 465, outfit_female = 466, addon = 3, storageID = 10077},

['makeshiftwarrior'] = {cost =3000000, outfit_male = 1042, outfit_female = 1043, addon = 3, storageID = 10078},

['orcsoberfest'] = {cost =3000000, outfit_male = 1251, outfit_female = 1252, addon = 3, storageID = 10079},

['percht'] = {cost =3000000, outfit_male = 1161, outfit_female = 1162, addon = 3, storageID = 10080},

['poltergeist'] = {cost =3000000, outfit_male = 1270, outfit_female = 1271, addon = 3, storageID = 10081},

['riftwarrior'] = {cost =3000000, outfit_male = 846, outfit_female = 845, addon = 3, storageID = 10082},

['soilguardian'] = {cost =3000000, outfit_male = 516, outfit_female = 514, addon = 3, storageID = 10083},

['warmaster'] = {cost =3000000, outfit_male = 335, outfit_female = 336, addon = 3, storageID = 10084},

['wayfarer'] = {cost =3000000, outfit_male = 367, outfit_female = 366, addon = 3, storageID = 10085},


--Addons Store e Especiais
['recruiter'] = {cost =3000000, outfit_male = 746, outfit_female = 745, addon = 3, storageID = 10086},

['arenachampion'] = {cost =3000000, outfit_male = 884,outfit_female = 885, addon = 3, storageID = 10087},

['beastmaster'] = {cost =3000000, outfit_male = 637, outfit_female = 636, addon = 3, storageID = 10088},

['breezygarb'] = {cost =3000000, outfit_male = 1245, outfit_female = 1246,  addon = 3, storageID = 10089},

['ceremonialgarb'] = {cost =3000000, outfit_male = 695, outfit_female = 694,  addon = 3, storageID = 10090},

['champion'] = {cost =3000000, outfit_male = 633, outfit_female = 632,  addon = 3, storageID = 10091},

['acolyte'] = {cost =3000000, outfit_male = 665, outfit_female = 664,  addon = 3, storageID = 10092},

['conjurer'] = {cost =3000000, outfit_male = 634, outfit_female = 635,  addon = 3, storageID = 10093},

['herald'] = {cost =3000000, outfit_male = 667, outfit_female = 666,  addon = 3, storageID = 10094},

['entrepreneur'] = {cost =3000000, outfit_male = 472, outfit_female = 471,  addon = 3, storageID = 10095},

['evoker'] = {cost =3000000, outfit_male = 725, outfit_female = 724,  addon = 3, storageID = 10096},

['grovekeeper'] = {cost =3000000, outfit_male = 908, outfit_female = 909,  addon = 3, storageID = 10097},

['guidonbearer'] = {cost =3000000, outfit_male = 1186, outfit_female = 1187,  addon = 3, storageID = 10098},

['herbalist'] = {cost =3000000, outfit_male = 1021, outfit_female = 1020,  addon = 3, storageID = 10099},

['herder'] = {cost =3000000, outfit_male = 1279, outfit_female = 1080,  addon = 3, storageID = 10100},

['lupinewarden'] = {cost =3000000, outfit_male = 899, outfit_female = 900,  addon = 3, storageID = 10101},

['mercenary'] = {cost =3000000, outfit_male = 1056, outfit_female = 1057,  addon = 3, storageID = 10102},

['owlkeeper'] = {cost =3000000, outfit_male = 1173, outfit_female = 1174,  addon = 3, storageID = 10103},

['pharaoh'] = {cost =3000000, outfit_male = 955, outfit_female = 956,  addon = 3, storageID = 10104},

['philosopher'] = {cost =3000000, outfit_male = 873, outfit_female = 874,  addon = 3, storageID = 10105},

['pumpkinmummy'] = {cost =3000000, outfit_male = 1127, outfit_female = 1128,  addon = 3, storageID = 10106},

['puppeteer'] = {cost =3000000, outfit_male = 697, outfit_female = 696,  addon = 3, storageID = 10107},

['ranger'] = {cost =3000000, outfit_male = 684, outfit_female = 683,  addon = 3, storageID = 10108},

['royalpumpkin'] = {cost =3000000, outfit_male = 760, outfit_female = 759,  addon = 3, storageID = 10109},

['seadog'] = {cost =3000000, outfit_male = 750, outfit_female = 749,  addon = 3, storageID = 10110},

['seaweaver'] = {cost =3000000, outfit_male = 733, outfit_female = 732,  addon = 3, storageID = 10111},

['siegemaster'] = {cost =3000000, outfit_male = 1051, outfit_female = 1050,  addon = 3, storageID = 10112},

['sinisterarcher'] = {cost =3000000, outfit_male = 1102, outfit_female = 1103,  addon = 3, storageID = 10113},

['spiritcaller'] = {cost =3000000, outfit_male = 699, outfit_female = 698,  addon = 3, storageID = 10114},

['sunpriest'] = {cost =3000000, outfit_male = 1023, outfit_female = 1024,  addon = 3, storageID = 10115},

['trailblazer'] = {cost =3000000, outfit_male = 1292, outfit_female = 1293,  addon = 3, storageID = 10116},

['trophyhunter'] = {cost =3000000, outfit_male = 957, outfit_female = 958,  addon = 3, storageID = 10117},

['winterwarden'] = {cost =3000000, outfit_male = 853, outfit_female = 852,  addon = 3, storageID = 10118},

--Especiais
['lionofwar'] = {cost =10000000, outfit_male = 1206, outfit_female = 1207,  addon = 3, storageID = 10119},

['veteranpaladin'] = {cost =10000000, outfit_male = 1205, outfit_female = 1204,  addon = 3, storageID = 10120},

['voidmaster'] = {cost =10000000, outfit_male = 1202, outfit_female = 1203,  addon = 3, storageID = 10121},

['golden'] = {cost =10000000, outfit_male = 1210, outfit_female = 1211,  addon = 3, storageID = 10122},

['dragonslayer'] = {cost =10000000, outfit_male = 1288, outfit_female = 1289,  addon = 3, storageID = 10123}

}

local o = {'citizen', 'hunter', 'knight', 'mage', 'nobleman', 'summoner', 'warrior', 'barbarian', 'druid', 'wizard', 'oriental', 'pirate', 'assassin', 'beggar', 'shaman', 'norseman', 'nighmare', 'jester', 'yalaharian', 'brotherhood', 'afflicted', 'battlemage', 'caveexplorer', 'crystalwarlord' , 'deepling', 'demon', 'discoverer', 'dreamwarden', 'dreamwarrior', 'elementalist', 'festive', 'gloothengineer', 'tombassassin', 'insectoid', 'makeshiftwarrior', 'orcsoberfest', 'percht', 'poltergeist', 'riftwarrior', 'soilguardian', 'warmaster' , 'wayfarer', 'recruiter', 'arenachampion', 'beastmaster', 'breezygarb', 'ceremonialgarb', 'champion', 'acolyte', 'conjurer', 'herald', 'entrepreneur', 'evoker', 'grovekeeper', 'guidonbearer', 'herbalist', 'herder', 'lupinewarden', 'mercenary', 'owlkeeper', 'pharaoh', 'philosopher', 'pumpkinmummy', 'puppeteer', 'ranger', 'royalpumpkin', 'seadog', 'seaweaver', 'siegemaster', 'sinisterarcher', 'spiritcaller', 'sunpriest', 'trailblazer', 'trophyhunter', 'winterwarden', 'lionofwar', 'veteranpaladin', 'voidmaster', 'golden', 'dragonslayer'}

function creatureSayCallback(cid, type, msg)

local talkUser = cid

 

if(not npcHandler:isFocused(cid)) then

return false

end

 

if addoninfo[msg] ~= nil then

if (getPlayerStorageValue(cid, addoninfo[msg].storageID) ~= -1) then

npcHandler:say('You already have this addon!', cid)

npcHandler:resetNpc()

else

local itemsTable = addoninfo[msg].items

local items_list = ''

if table.maxn(itemsTable) > 0 then

for i = 1, table.maxn(itemsTable) do

local item = itemsTable

items_list = items_list .. item[2] .. ' ' .. ItemType(item[1]):getName()

if i ~= table.maxn(itemsTable) then

items_list = items_list .. ', '

end

end

end

local text = ''

if (addoninfo[msg].cost > 0) then

text = addoninfo[msg].cost .. ' gp'

elseif table.maxn(addoninfo[msg].items) then

text = items_list

elseif (addoninfo[msg].cost > 0) and table.maxn(addoninfo[msg].items) then

text = items_list .. ' and ' .. addoninfo[msg].cost .. ' gp'

end

npcHandler:say('For ' .. msg .. ' you will need ' .. text .. '. Do you have it all with you?', cid)

rtnt[talkUser] = msg

talkState[talkUser] = addoninfo[msg].storageID

return true

end

elseif msgcontains(msg, "yes") then

if (talkState[talkUser] > 10010 and talkState[talkUser] < 10100) then

local items_number = 0

if table.maxn(addoninfo[rtnt[talkUser]].items) > 0 then

for i = 1, table.maxn(addoninfo[rtnt[talkUser]].items) do

local item = addoninfo[rtnt[talkUser]].items

if (getPlayerItemCount(cid,item[1]) >= item[2]) then

items_number = items_number + 1

end

end

end

if(getPlayerMoney(cid) >= addoninfo[rtnt[talkUser]].cost) and (items_number == table.maxn(addoninfo[rtnt[talkUser]].items)) then

doPlayerRemoveMoney(cid, addoninfo[rtnt[talkUser]].cost)

if table.maxn(addoninfo[rtnt[talkUser]].items) > 0 then

for i = 1, table.maxn(addoninfo[rtnt[talkUser]].items) do

local item = addoninfo[rtnt[talkUser]].items

doPlayerRemoveItem(cid,item[1],item[2])

end

end

doPlayerAddOutfit(cid, addoninfo[rtnt[talkUser]].outfit_male, addoninfo[rtnt[talkUser]].addon)

doPlayerAddOutfit(cid, addoninfo[rtnt[talkUser]].outfit_female, addoninfo[rtnt[talkUser]].addon)

setPlayerStorageValue(cid,addoninfo[rtnt[talkUser]].storageID,1)

npcHandler:say('Here you are.', cid)

else

npcHandler:say('You do not have needed items!', cid)

end

rtnt[talkUser] = nil

talkState[talkUser] = 0

npcHandler:resetNpc()

return true

end

elseif msgcontains(msg, "addon") then

npcHandler:say('I can give you addons for {' .. table.concat(o, "}, {") .. '} outfits.', cid)

rtnt[talkUser] = nil

talkState[talkUser] = 0

npcHandler:resetNpc()

return true

elseif msgcontains(msg, "help") then

npcHandler:say('To buy the first addon say \'first NAME addon\', for the second addon say \'second NAME addon\'.', cid)

rtnt[talkUser] = nil

talkState[talkUser] = 0

npcHandler:resetNpc()

return true

else

if talkState[talkUser] ~= nil then

if talkState[talkUser] > 0 then

npcHandler:say('Come back when you get these items.', cid)

rtnt[talkUser] = nil

talkState[talkUser] = 0

npcHandler:resetNpc()

return true

end

end

end

return true

end

 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())