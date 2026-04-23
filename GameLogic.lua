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
