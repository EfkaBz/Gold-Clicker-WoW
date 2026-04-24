-- GameLogic.lua - Logique de jeu (achats, upgrades, etc.)

GoldClicker = GoldClicker or {}

-- Acheter un upgrade (avec quantité)
function GoldClicker:BuyUpgrade(upgradeId, amount)
    amount = amount or 1
    
    local upgrade = self:GetUpgradeData(upgradeId)
    if not upgrade then
        print("Upgrade inconnu:", upgradeId)
        return false
    end
    
    -- Vérifier les prérequis
    if upgrade.requires then
        local reqCount = GoldClickerDB.upgrades[upgrade.requires] or 0
        if reqCount == 0 then
            print("|cffff0000Vous devez d'abord acheter:|r " .. self:GetUpgradeData(upgrade.requires).name)
            return false
        end
    end
    
    local purchased = GoldClickerDB.upgrades[upgradeId] or 0
    
    -- Vérifier la limite max
    if upgrade.maxPurchases and (purchased + amount) > upgrade.maxPurchases then
        local canBuy = upgrade.maxPurchases - purchased
        if canBuy <= 0 then
            return false
        end
        amount = canBuy
    end
    
    -- Calculer le coût total
    local totalCost = self:GetTotalUpgradeCost(upgradeId, amount)
    
    if not totalCost then
        return false
    end
    
    -- Vérifier les fonds
    if GoldClickerDB.gold < totalCost then
        return false
    end
    
    -- Acheter
    GoldClickerDB.gold = GoldClickerDB.gold - totalCost
    GoldClickerDB.upgrades[upgradeId] = purchased + amount
    
    -- Mettre à jour l'UI
    self:UpdateUI()
    
    return true
end

-- Réinitialiser la progression (pour debug ou prestige futur)
function GoldClicker:Reset()
    GoldClickerDB.gold = 0
    GoldClickerDB.totalGold = 0
    GoldClickerDB.totalClicks = 0
    GoldClickerDB.upgrades = {}
    GoldClickerDB.inventory = {}
    GoldClickerDB.totalLooted = 0
    GoldClickerDB.startTime = time()
    GoldClickerDB.lastDungeonTime = nil  -- Reset cooldown donjon
    
    -- Réinitialiser les compteurs d'upgrades
    for _, upgrade in ipairs(self.Upgrades) do
        GoldClickerDB.upgrades[upgrade.id] = 0
    end
    
    self:UpdateUI()
    
    -- Fermer et réinitialiser l'inventaire s'il est ouvert
    if self.inventoryFrame and self.inventoryFrame:IsShown() then
        self.inventoryFrame:Hide()
    end
end

-- Reset TOTAL (prestige inclus)
function GoldClicker:ResetFull()
    GoldClickerDB.gold = 0
    GoldClickerDB.totalGold = 0
    GoldClickerDB.totalClicks = 0
    GoldClickerDB.upgrades = {}
    GoldClickerDB.inventory = {}
    GoldClickerDB.totalLooted = 0
    GoldClickerDB.startTime = time()
    GoldClickerDB.prestigeLevel = 0
    GoldClickerDB.prestigePoints = 0
    GoldClickerDB.totalPrestiges = 0
    GoldClickerDB.achievements = {}
    GoldClickerDB.lastDungeonTime = nil  -- Reset cooldown donjon
    GoldClickerDB.dungeonsCompleted = 0  -- Reset stats donjons
    GoldClickerDB.prestigeUpgrades = {}  -- Reset améliorations permanentes de prestige
    
    -- Réinitialiser les compteurs d'upgrades
    for _, upgrade in ipairs(self.Upgrades) do
        GoldClickerDB.upgrades[upgrade.id] = 0
    end
    
    self:UpdateUI()
    
    -- Fermer et réinitialiser l'inventaire s'il est ouvert
    if self.inventoryFrame and self.inventoryFrame:IsShown() then
        self.inventoryFrame:Hide()
    end
    
    -- Fermer la fenêtre d'achievements si ouverte
    if self.achievementFrame and self.achievementFrame:IsShown() then
        self.achievementFrame:Hide()
    end
    
    print("|cffff0000Reset TOTAL effectue ! Tout a ete remis a zero (prestige, succes et ameliorations permanentes inclus).")
end

-- Vérifier si le prestige est disponible
function GoldClicker:CanPrestige()
    return GoldClickerDB.totalGold >= 1000000000 -- 1 milliard
end

-- Calculer les points de prestige gagnés
function GoldClicker:CalculatePrestigePoints()
    local totalGold = GoldClickerDB.totalGold
    if totalGold < 1000000000 then return 0 end
    
    -- 1 point par milliard
    return math.floor(totalGold / 1000000000)
end

-- Effectuer le prestige
function GoldClicker:DoPrestige()
    if not self:CanPrestige() then
        print("|cffff0000Vous avez besoin de 1 milliard de gold total pour faire un Prestige!")
        return false
    end
    
    local pointsGained = self:CalculatePrestigePoints()
    
    -- Sauvegarder le prestige
    GoldClickerDB.prestigeLevel = GoldClickerDB.prestigeLevel + 1
    GoldClickerDB.prestigePoints = GoldClickerDB.prestigePoints + pointsGained
    GoldClickerDB.totalPrestiges = GoldClickerDB.totalPrestiges + 1
    
    -- Reset la progression SAUF le prestige
    local oldPrestigeLevel = GoldClickerDB.prestigeLevel
    local oldPrestigePoints = GoldClickerDB.prestigePoints
    local oldTotalPrestiges = GoldClickerDB.totalPrestiges
    
    GoldClickerDB.gold = 0
    GoldClickerDB.totalGold = 0
    GoldClickerDB.totalClicks = 0
    GoldClickerDB.upgrades = {}
    GoldClickerDB.inventory = {}
    GoldClickerDB.totalLooted = 0
    GoldClickerDB.startTime = time()
    GoldClickerDB.lastDungeonTime = nil  -- Reset cooldown donjon
    
    -- Restaurer le prestige
    GoldClickerDB.prestigeLevel = oldPrestigeLevel
    GoldClickerDB.prestigePoints = oldPrestigePoints
    GoldClickerDB.totalPrestiges = oldTotalPrestiges
    
    -- Réinitialiser les compteurs d'upgrades
    for _, upgrade in ipairs(self.Upgrades) do
        GoldClickerDB.upgrades[upgrade.id] = 0
    end
    
    -- Appliquer le bonus "Départ Rapide" (quick_start)
    local startGold = self:GetPrestigeBonus("prestige_start")
    if startGold > 0 then
        GoldClickerDB.gold = startGold
        GoldClickerDB.totalGold = startGold
        print("|cff00ff00Depart Rapide: +" .. self:FormatNumber(startGold) .. " gold!")
    end
    
    self:UpdateUI()
    
    -- Fermer l'inventaire
    if self.inventoryFrame and self.inventoryFrame:IsShown() then
        self.inventoryFrame:Hide()
    end
    
    print("|cffFFD700✦ PRESTIGE " .. oldPrestigeLevel .. " ✦")
    print("|cff00ff00Vous avez gagné " .. pointsGained .. " Point(s) de Prestige!")
    print("|cff00ff00Bonus de production: +" .. (oldPrestigeLevel * 10) .. "%")
    
    return true
end


-- SYSTÈME DE DONJONS/RAIDS

-- Vérifier si on peut lancer un donjon
function GoldClicker:CanStartDungeon()
    -- Vérifier le gold
    if GoldClickerDB.gold < 10000 then
        return false
    end
    
    -- Vérifier le cooldown
    if self:GetDungeonCooldown() > 0 then
        return false
    end
    
    return true
end

-- Obtenir le cooldown restant en secondes
function GoldClicker:GetDungeonCooldown()
    if not GoldClickerDB.lastDungeonTime then
        return 0
    end
    
    local cooldownDuration = 1800 -- 30 minutes en secondes
    
    -- Appliquer la réduction de Donjon Express
    local reduction = self:GetPrestigeBonus("dungeon_cooldown")
    cooldownDuration = math.max(60, cooldownDuration - reduction)  -- Minimum 1 minute
    
    local timeSince = time() - GoldClickerDB.lastDungeonTime
    local remaining = cooldownDuration - timeSince
    
    return math.max(0, remaining)
end

-- Lancer un donjon
function GoldClicker:StartDungeon()
    if not self:CanStartDungeon() then
        local cooldown = self:GetDungeonCooldown()
        if cooldown > 0 then
            local mins = math.floor(cooldown / 60)
            local secs = cooldown % 60
            print("|cffff0000Cooldown actif ! Temps restant: " .. mins .. "m " .. secs .. "s")
        else
            print("|cffff0000Vous avez besoin de 10,000 gold pour lancer un donjon !")
        end
        return
    end
    
    -- Payer le coût
    GoldClickerDB.gold = GoldClickerDB.gold - 10000
    
    -- Mettre le cooldown
    GoldClickerDB.lastDungeonTime = time()
    
    -- Roller la difficulté (RNG)
    local roll = math.random()
    local difficulty, goldReward, itemCount, quality
    
    if roll < 0.50 then
        -- 50% Normal
        difficulty = "NORMAL"
        goldReward = math.random(15000, 25000)
        itemCount = math.random(2, 4)
        quality = "uncommon"
    elseif roll < 0.85 then
        -- 35% Héroïque
        difficulty = "HEROIQUE"
        goldReward = math.random(30000, 50000)
        itemCount = math.random(3, 5)
        quality = "rare"
    else
        -- 15% Épique
        difficulty = "EPIQUE"
        goldReward = math.random(60000, 100000)
        itemCount = math.random(4, 6)
        quality = "epic"
    end
    
    -- Donner les récompenses
    self:AddGold(goldReward)
    
    -- Looter les items
    local lootedItems = {}
    for i = 1, itemCount do
        local item = self:RollLootByQuality(quality)
        self:AddItemToInventory(item.id)
        table.insert(lootedItems, item.name)
    end
    
    -- Incrémenter les stats
    if not GoldClickerDB.dungeonsCompleted then
        GoldClickerDB.dungeonsCompleted = 0
    end
    GoldClickerDB.dungeonsCompleted = GoldClickerDB.dungeonsCompleted + 1
    
    -- Créer la liste des items pour le popup
    local itemsList = ""
    for i, itemName in ipairs(lootedItems) do
        itemsList = itemsList .. "- " .. itemName .. "\n"
    end
    
    -- Couleur selon difficulté
    local difficultyColor = "|cff00ff00" -- Vert par défaut (Normal)
    if difficulty == "HEROIQUE" then
        difficultyColor = "|cff0070dd" -- Bleu
    elseif difficulty == "EPIQUE" then
        difficultyColor = "|cffa335ee" -- Violet
    end
    
    -- Créer le popup de récompenses
    StaticPopupDialogs["GOLDCLICKER_DUNGEON_REWARD"] = {
        text = "|cffFFD700DONJON TERMINE !|r\n\n" .. difficultyColor .. "Difficulte: " .. difficulty .. "|r\n\n|cffFFD700Recompenses:|r\n\n|cff00ff00Gold: " .. self:FormatNumber(goldReward) .. "|r\n\n|cffFFD700Items lootes (" .. itemCount .. "):|r\n" .. itemsList,
        button1 = "Super !",
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
    }
    StaticPopup_Show("GOLDCLICKER_DUNGEON_REWARD")
    
    -- Mettre à jour l'UI
    if self.mainFrame and self.mainFrame:IsShown() then
        self:UpdateUI()
    end
end

-- Looter un item d'une qualité spécifique
function GoldClicker:RollLootByQuality(targetQuality)
    local possibleItems = {}
    
    for _, item in ipairs(self.LootTable) do
        if item.quality == targetQuality then
            table.insert(possibleItems, item)
        end
    end
    
    if #possibleItems == 0 then
        -- Fallback vers uncommon si pas d'items de la qualité demandée
        for _, item in ipairs(self.LootTable) do
            if item.quality == "uncommon" then
                table.insert(possibleItems, item)
            end
        end
    end
    
    if #possibleItems > 0 then
        return possibleItems[math.random(1, #possibleItems)]
    end
    
    return self.LootTable[1] -- Ultimate fallback
end

-- Commande de debug pour ajouter de l'or
SLASH_COOKIEDEBUG1 = "/golddebug"
SlashCmdList["COOKIEDEBUG"] = function(msg)
    local amount = tonumber(msg)
    if amount and amount > 0 then
        GoldClicker:AddGold(amount)
        print("|cffFFD700Ajouté " .. amount .. " gold!")
    else
        print("Usage: /golddebug <nombre>")
    end
end

-- Commande de reset
SLASH_COOKIERESET1 = "/goldreset"
SlashCmdList["COOKIERESET"] = function(msg)
    if msg == "confirm" then
        GoldClicker:Reset()
    else
        print("|cffff0000Êtes-vous sûr? Tapez /goldreset confirm pour réinitialiser.")
    end
end
