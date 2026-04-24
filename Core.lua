-- Core.lua - Initialisation et gestion des événements

GoldClicker = GoldClicker or {}

-- Quantité d'achat par défaut
GoldClicker.buyAmount = 1

-- Frame principal pour gérer les événements
local eventFrame = CreateFrame("Frame")

-- Initialisation de la base de données
local function InitDatabase()
    if not GoldClickerDB then
        GoldClickerDB = {
            gold = 0,
            totalGold = 0,
            totalClicks = 0,
            upgrades = {},
            inventory = {}, -- {itemId = count}
            totalLooted = 0,
            startTime = time(),
            prestigeLevel = 0,
            prestigePoints = 0,
            totalPrestiges = 0,
            achievements = {}, -- {achievementId = true}
        }
    end
    
    -- Initialiser l'inventaire s'il n'existe pas
    if not GoldClickerDB.inventory then
        GoldClickerDB.inventory = {}
    end
    
    if not GoldClickerDB.totalLooted then
        GoldClickerDB.totalLooted = 0
    end
    
    -- Initialiser le prestige
    if not GoldClickerDB.prestigeLevel then
        GoldClickerDB.prestigeLevel = 0
    end
    
    if not GoldClickerDB.prestigePoints then
        GoldClickerDB.prestigePoints = 0
    end
    
    if not GoldClickerDB.totalPrestiges then
        GoldClickerDB.totalPrestiges = 0
    end
    
    -- Initialiser les achievements
    if not GoldClickerDB.achievements then
        GoldClickerDB.achievements = {}
    end
    
    -- Initialiser les donjons
    if not GoldClickerDB.lastDungeonTime then
        GoldClickerDB.lastDungeonTime = nil
    end
    
    if not GoldClickerDB.dungeonsCompleted then
        GoldClickerDB.dungeonsCompleted = 0
    end
    
    -- Initialiser les upgrades prestige
    if not GoldClickerDB.prestigeUpgrades then
        GoldClickerDB.prestigeUpgrades = {}
    end
    
    -- Initialiser les compteurs d'upgrades s'ils n'existent pas
    for _, upgrade in ipairs(GoldClicker.Upgrades) do
        if not GoldClickerDB.upgrades[upgrade.id] then
            GoldClickerDB.upgrades[upgrade.id] = 0
        end
    end
end

-- Événement ADDON_LOADED
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" and addonName == "GoldClickerWoW" then
        print("|cffFFD700[Gold Clicker]|r Initialisation...")
        InitDatabase()
        print("|cffFFD700[Gold Clicker]|r Base de données OK")
        
        -- Créer l'interface
        GoldClicker:CreateUI()
        print("|cffFFD700[Gold Clicker]|r Interface créée")
        
        -- Démarrer la production automatique
        GoldClicker:StartAutoProduction()
        print("|cffFFD700[Gold Clicker]|r Production démarrée")
        
        print("|cffFFD700Gold Clicker WoW|r chargé ! Tapez |cffFFFF00/gold|r pour jouer.")
        
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

-- Commande slash pour ouvrir/fermer l'interface
SLASH_GOLDCLICKER1 = "/gold"
SLASH_GOLDCLICKER2 = "/goldclicker"
SlashCmdList["GOLDCLICKER"] = function(msg)
    print("|cffFFD700[Gold Clicker]|r Commande reçue")
    
    if not GoldClicker.mainFrame then
        print("|cffff0000[Gold Clicker]|r ERREUR: mainFrame n'existe pas!")
        return
    end
    
    print("|cffFFD700[Gold Clicker]|r mainFrame existe")
    
    if GoldClicker.mainFrame:IsShown() then
        print("|cffFFD700[Gold Clicker]|r Fermeture de l'interface")
        GoldClicker.mainFrame:Hide()
    else
        print("|cffFFD700[Gold Clicker]|r Ouverture de l'interface")
        GoldClicker.mainFrame:Show()
        GoldClicker:UpdateUI()
        print("|cffFFD700[Gold Clicker]|r Interface affichée")
    end
end

-- Production automatique
function GoldClicker:StartAutoProduction()
    if self.productionTicker then
        self.productionTicker:Cancel()
    end
    
    self.productionTicker = C_Timer.NewTicker(0.1, function()
        local gps = self:GetGoldPerSecond()
        if gps > 0 then
            self:AddGold(gps * 0.1)
        end
    end)
    
    -- Ticker pour l'or automatique
    if self.autoGoldTicker then
        self.autoGoldTicker:Cancel()
    end
    
    self.autoGoldTicker = C_Timer.NewTicker(10, function()
        local autoGoldCount = GoldClickerDB.upgrades["auto_gold"] or 0
        if autoGoldCount > 0 then
            self:AddGold(100 * autoGoldCount)
        end
    end)
    
    -- Ticker pour le loot automatique (toutes les 10 secondes, ou 5/3 si amélioré)
    if self.autoLootTicker then
        self.autoLootTicker:Cancel()
    end
    
    local autoLootInterval = 10
    local fasterAutoLootCount = GoldClickerDB.upgrades["super_auto_loot"] or 0
    if fasterAutoLootCount > 0 then
        autoLootInterval = 5
    end
    
    -- Vérifier l'upgrade prestige "Loot Auto Rapide"
    local prestigeFastLoot = self:GetPrestigeUpgradeLevel("fast_auto_loot")
    if prestigeFastLoot > 0 then
        autoLootInterval = 3
    end
    
    self.autoLootTicker = C_Timer.NewTicker(autoLootInterval, function()
        local autoLootLevel = GoldClickerDB.upgrades["auto_loot"] or 0
        if autoLootLevel > 0 then
            -- Loot X items selon le niveau
            for i = 1, autoLootLevel do
                local lootChance = self:GetLootChance()
                if math.random() < lootChance then
                    local lootedItem = self:RollLoot()
                    self:AddItemToInventory(lootedItem.id)
                end
            end
        end
    end)
    
    -- Ticker pour la vente automatique
    if self.autoSellTicker then
        self.autoSellTicker:Cancel()
    end
    
    self.autoSellTicker = C_Timer.NewTicker(30, function()
        local autoSellCount = GoldClickerDB.upgrades["auto_sell"] or 0
        if autoSellCount > 0 then
            -- Vendre tous les items communs
            for itemId, count in pairs(GoldClickerDB.inventory) do
                local itemData = self:GetItemData(itemId)
                if itemData and itemData.quality == "common" and count > 0 then
                    self:SellAllItems(itemId)
                end
            end
        end
    end)
end

-- Calculer les gold par seconde
function GoldClicker:GetGoldPerSecond()
    local total = 0
    local productionMultiplier = 1
    
    -- Vérifier le multiplicateur de production
    local prodMultCount = GoldClickerDB.upgrades["production_multiplier"] or 0
    if prodMultCount > 0 then
        productionMultiplier = 2 ^ prodMultCount  -- Chaque achat double la production
    end
    
    for _, upgrade in ipairs(self.Upgrades) do
        if upgrade.production then
            local count = GoldClickerDB.upgrades[upgrade.id] or 0
            total = total + (upgrade.production * count)
        end
    end
    
    -- Appliquer le bonus de prestige (+10% par niveau)
    local prestigeBonus = 1 + (GoldClickerDB.prestigeLevel * 0.10)
    
    -- Appliquer les bonus d'achievements
    local achievementBonus = 1 + self:GetAchievementBonus("production")
    
    -- Appliquer les bonus d'upgrades prestige (Super Production)
    local prestigeUpgradeBonus = 1 + self:GetPrestigeBonus("production_boost")
    
    return total * productionMultiplier * prestigeBonus * achievementBonus * prestigeUpgradeBonus
end

-- Calculer le coût total pour acheter X upgrades
function GoldClicker:GetTotalUpgradeCost(upgradeId, amount)
    local upgrade = self:GetUpgradeData(upgradeId)
    if not upgrade then return 0 end
    
    local purchased = GoldClickerDB.upgrades[upgradeId] or 0
    
    -- Vérifier si on peut acheter cette quantité
    if upgrade.maxPurchases and (purchased + amount) > upgrade.maxPurchases then
        -- Calculer combien on peut encore acheter
        local canBuy = upgrade.maxPurchases - purchased
        if canBuy <= 0 then
            return nil -- Plus rien à acheter
        end
        amount = canBuy
    end
    
    -- Calculer le coût total
    local totalCost = 0
    for i = 0, amount - 1 do
        local cost = math.floor(upgrade.baseCost * (upgrade.costMultiplier ^ (purchased + i)))
        totalCost = totalCost + cost
    end
    
    return totalCost
end

-- Calculer la valeur d'un clic
function GoldClicker:GetClickValue()
    local value = self.Config.clickValue
    
    -- Appliquer les multiplicateurs de clic
    for _, upgrade in ipairs(self.Upgrades) do
        if upgrade.clickMultiplier then
            local count = GoldClickerDB.upgrades[upgrade.id] or 0
            if count > 0 then
                value = value * upgrade.clickMultiplier
            end
        end
    end
    
    -- Appliquer les bonus d'achievements
    local achievementBonus = 1 + self:GetAchievementBonus("click")
    
    -- Appliquer les bonus d'upgrades prestige (Mega Clic)
    local prestigeUpgradeBonus = 1 + self:GetPrestigeBonus("click_boost")
    
    return value * achievementBonus * prestigeUpgradeBonus
end

-- Ajouter de l'or
function GoldClicker:AddGold(amount)
    GoldClickerDB.gold = GoldClickerDB.gold + amount
    GoldClickerDB.totalGold = GoldClickerDB.totalGold + amount
    
    -- Vérifier les achievements
    self:CheckAchievements()
    
    if self.mainFrame and self.mainFrame:IsShown() then
        self:UpdateUI()
    end
end

-- Calculer la chance de loot totale
function GoldClicker:GetLootChance()
    local baseChance = self.Config.lootChance
    
    -- Ajouter les bonus des upgrades
    for _, upgrade in ipairs(self.Upgrades) do
        if upgrade.lootBonus or upgrade.lootChanceBonus then
            local count = GoldClickerDB.upgrades[upgrade.id] or 0
            local bonus = upgrade.lootBonus or upgrade.lootChanceBonus
            baseChance = baseChance + (bonus * count)
        end
    end
    
    -- Ajouter les bonus d'achievements
    baseChance = baseChance + self:GetAchievementBonus("loot_chance")
    
    return math.min(baseChance, 0.95) -- Max 95%
end

-- Générer un loot aléatoire
function GoldClicker:RollLoot()
    -- Calculer le poids total
    local totalWeight = 0
    local qualityMultiplier = 1
    
    -- Vérifier l'amélioration de qualité
    local betterQualityCount = GoldClickerDB.upgrades["better_quality"] or 0
    if betterQualityCount > 0 then
        qualityMultiplier = 1.5  -- 50% plus de chance pour les items rares/epic
    end
    
    -- Appliquer le bonus prestige "Chasseur Epic"
    local epicBonus = self:GetPrestigeBonus("epic_chance")
    
    for _, item in ipairs(self.LootTable) do
        local weight = item.weight
        if item.quality == "uncommon" or item.quality == "rare" or item.quality == "epic" then
            weight = weight * qualityMultiplier
        end
        -- Bonus spécial pour les Epic
        if item.quality == "epic" and epicBonus > 0 then
            weight = weight * (1 + epicBonus)
        end
        totalWeight = totalWeight + weight
    end
    
    -- Roller un nombre aléatoire
    local roll = math.random() * totalWeight
    local currentWeight = 0
    
    for _, item in ipairs(self.LootTable) do
        local weight = item.weight
        if item.quality == "uncommon" or item.quality == "rare" or item.quality == "epic" then
            weight = weight * qualityMultiplier
        end
        -- Bonus spécial pour les Epic
        if item.quality == "epic" and epicBonus > 0 then
            weight = weight * (1 + epicBonus)
        end
        currentWeight = currentWeight + weight
        if roll <= currentWeight then
            return item
        end
    end
    
    return self.LootTable[1] -- Fallback
end

-- Ajouter un item à l'inventaire
function GoldClicker:AddItemToInventory(itemId)
    if not GoldClickerDB.inventory[itemId] then
        GoldClickerDB.inventory[itemId] = 0
    end
    
    local count = 1
    
    -- Vérifier le double loot
    local doubleLootCount = GoldClickerDB.upgrades["double_loot"] or 0
    if doubleLootCount > 0 and math.random() < 0.10 then
        count = 2
    end
    
    GoldClickerDB.inventory[itemId] = GoldClickerDB.inventory[itemId] + count
    GoldClickerDB.totalLooted = GoldClickerDB.totalLooted + count
end

-- Vendre un item
function GoldClicker:SellItem(itemId, count)
    local itemData = self:GetItemData(itemId)
    if not itemData then return false end
    
    local inventoryCount = GoldClickerDB.inventory[itemId] or 0
    if inventoryCount < count then return false end
    
    -- Vendre
    local totalValue = itemData.value * count
    self:AddGold(totalValue)
    
    GoldClickerDB.inventory[itemId] = inventoryCount - count
    if GoldClickerDB.inventory[itemId] <= 0 then
        GoldClickerDB.inventory[itemId] = nil
    end
    
    return true, totalValue
end

-- Vendre tous les items d'un type
function GoldClicker:SellAllItems(itemId)
    local count = GoldClickerDB.inventory[itemId] or 0
    if count > 0 then
        return self:SellItem(itemId, count)
    end
    return false
end

-- Sauvegarder (automatique via SavedVariables, mais on peut forcer)
function GoldClicker:Save()
    -- La sauvegarde est automatique avec SavedVariables
    -- Cette fonction peut être utilisée pour des actions supplémentaires
end

-- Vérifier les achievements
function GoldClicker:CheckAchievements()
    local newAchievements = false
    
    for _, achievement in ipairs(self.Achievements) do
        if not GoldClickerDB.achievements[achievement.id] then
            if achievement.requirement() then
                GoldClickerDB.achievements[achievement.id] = true
                newAchievements = true
                
                print("|cffFFD700[SUCCES DEBLOQUE] " .. achievement.name .. "!")
                print("|cff00ff00Recompense: " .. achievement.reward)
                
                -- Appliquer la récompense
                self:ApplyAchievementReward(achievement)
            end
        end
    end
    
    return newAchievements
end

-- Appliquer la récompense d'un achievement
function GoldClicker:ApplyAchievementReward(achievement)
    if achievement.rewardType == "prestige_point" then
        GoldClickerDB.prestigePoints = GoldClickerDB.prestigePoints + achievement.rewardValue
    end
    -- Les autres bonus (production, click, loot_chance) sont appliqués dynamiquement
end

-- Obtenir le bonus total des achievements
function GoldClicker:GetAchievementBonus(bonusType)
    local total = 0
    
    for _, achievement in ipairs(self.Achievements) do
        if GoldClickerDB.achievements[achievement.id] and achievement.rewardType == bonusType then
            total = total + achievement.rewardValue
        end
    end
    
    return total
end

-- SYSTÈME UPGRADES PRESTIGE

-- Acheter un upgrade prestige
function GoldClicker:BuyPrestigeUpgrade(upgradeId)
    local upgrade = self:GetPrestigeUpgradeData(upgradeId)
    if not upgrade then
        print("|cffff0000Upgrade prestige inconnu!")
        return false
    end
    
    local currentLevel = GoldClickerDB.prestigeUpgrades[upgradeId] or 0
    
    -- Vérifier la limite max
    if upgrade.maxPurchases and currentLevel >= upgrade.maxPurchases then
        print("|cffff0000Niveau maximum atteint!")
        return false
    end
    
    -- Vérifier les points
    if GoldClickerDB.prestigePoints < upgrade.cost then
        print("|cffff0000Pas assez de points de prestige!")
        return false
    end
    
    -- Acheter
    GoldClickerDB.prestigePoints = GoldClickerDB.prestigePoints - upgrade.cost
    GoldClickerDB.prestigeUpgrades[upgradeId] = currentLevel + 1
    
    print("|cff00ff00Upgrade prestige achete: " .. upgrade.name .. " (Niveau " .. (currentLevel + 1) .. ")")
    
    -- Mettre à jour l'UI
    if self.prestigeShopFrame and self.prestigeShopFrame:IsShown() then
        self:UpdatePrestigeShop()
    end
    
    return true
end

-- Obtenir les données d'un upgrade prestige
function GoldClicker:GetPrestigeUpgradeData(upgradeId)
    for _, upgrade in ipairs(self.PrestigeUpgrades) do
        if upgrade.id == upgradeId then
            return upgrade
        end
    end
    return nil
end

-- Obtenir le niveau d'un upgrade prestige
function GoldClicker:GetPrestigeUpgradeLevel(upgradeId)
    return GoldClickerDB.prestigeUpgrades[upgradeId] or 0
end

-- Obtenir le bonus d'un type d'upgrade prestige
function GoldClicker:GetPrestigeBonus(bonusType)
    local total = 0
    
    for _, upgrade in ipairs(self.PrestigeUpgrades) do
        if upgrade.applyOn == bonusType then
            local level = self:GetPrestigeUpgradeLevel(upgrade.id)
            if level > 0 then
                total = total + upgrade.effect(level)
            end
        end
    end
    
    return total
end
