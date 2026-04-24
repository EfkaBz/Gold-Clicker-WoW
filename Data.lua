-- Data.lua - Définitions des upgrades et constantes

GoldClicker = GoldClicker or {}

-- Configuration du jeu
GoldClicker.Config = {
    clickValue = 1,
    autoClickInterval = 1.0, -- secondes
    lootChance = 0.02, -- 2% de chance de loot par clic (au lieu de 15%)
}

-- Définition des items lootables
GoldClicker.LootTable = {
    -- Gear commun (80% des loots)
    {
        id = "rusty_sword",
        name = "Épée Rouillée",
        quality = "common",
        type = "weapon",
        icon = "Interface\\Icons\\INV_Sword_04",
        value = 5,
        weight = 100,
    },
    {
        id = "leather_boots",
        name = "Bottes en Cuir",
        quality = "common",
        type = "armor",
        icon = "Interface\\Icons\\INV_Boots_05",
        value = 8,
        weight = 100,
    },
    {
        id = "cloth_gloves",
        name = "Gants en Tissu",
        quality = "common",
        type = "armor",
        icon = "Interface\\Icons\\INV_Gauntlets_05",
        value = 6,
        weight = 100,
    },
    {
        id = "health_potion",
        name = "Potion de Soin",
        quality = "common",
        type = "consumable",
        icon = "Interface\\Icons\\INV_Potion_54",
        value = 3,
        weight = 120,
    },
    {
        id = "mana_potion",
        name = "Potion de Mana",
        quality = "common",
        type = "consumable",
        icon = "Interface\\Icons\\INV_Potion_76",
        value = 3,
        weight = 120,
    },
    {
        id = "copper_ore",
        name = "Minerai de Cuivre",
        quality = "common",
        type = "material",
        icon = "Interface\\Icons\\INV_Ore_Copper_01",
        value = 2,
        weight = 150,
    },
    {
        id = "wool_cloth",
        name = "Étoffe de Laine",
        quality = "common",
        type = "material",
        icon = "Interface\\Icons\\INV_Fabric_Wool_01",
        value = 2,
        weight = 150,
    },
    
    -- Gear non-commun (15% des loots)
    {
        id = "steel_axe",
        name = "Hache en Acier",
        quality = "uncommon",
        type = "weapon",
        icon = "Interface\\Icons\\INV_Axe_09",
        value = 50,
        weight = 30,
    },
    {
        id = "mail_chest",
        name = "Plastron de Mailles",
        quality = "uncommon",
        type = "armor",
        icon = "Interface\\Icons\\INV_Chest_Chain_03",
        value = 65,
        weight = 30,
    },
    {
        id = "elixir_strength",
        name = "Élixir de Force",
        quality = "uncommon",
        type = "consumable",
        icon = "Interface\\Icons\\INV_Potion_61",
        value = 25,
        weight = 35,
    },
    {
        id = "thorium_ore",
        name = "Minerai de Thorium",
        quality = "uncommon",
        type = "material",
        icon = "Interface\\Icons\\INV_Ore_Thorium_01",
        value = 30,
        weight = 40,
    },
    
    -- Gear rare (4% des loots)
    {
        id = "enchanted_staff",
        name = "Bâton Enchanté",
        quality = "rare",
        type = "weapon",
        icon = "Interface\\Icons\\INV_Staff_13",
        value = 250,
        weight = 8,
    },
    {
        id = "plate_helm",
        name = "Heaume de Plates",
        quality = "rare",
        type = "armor",
        icon = "Interface\\Icons\\INV_Helmet_03",
        value = 300,
        weight = 8,
    },
    {
        id = "flask_titans",
        name = "Flacon des Titans",
        quality = "rare",
        type = "consumable",
        icon = "Interface\\Icons\\INV_Potion_41",
        value = 150,
        weight = 10,
    },
    {
        id = "arcane_crystal",
        name = "Cristal d'Arcane",
        quality = "rare",
        type = "material",
        icon = "Interface\\Icons\\INV_Enchant_EssenceArcaneLarge",
        value = 200,
        weight = 8,
    },
    
    -- Gear épique (0.5% des loots - ultra rare!)
    {
        id = "legendary_sword",
        name = "Épée Légendaire",
        quality = "epic",
        type = "weapon",
        icon = "Interface\\Icons\\INV_Sword_62",
        value = 2000,
        weight = 2,
    },
    {
        id = "epic_armor",
        name = "Plastron Titanesque",
        quality = "epic",
        type = "armor",
        icon = "Interface\\Icons\\INV_Chest_Plate06",
        value = 2500,
        weight = 1,
    },
}

-- Couleurs de qualité
GoldClicker.QualityColors = {
    common = {r = 0.9, g = 0.9, b = 0.9},
    uncommon = {r = 0.12, g = 1, b = 0},
    rare = {r = 0, g = 0.44, b = 0.87},
    epic = {r = 0.64, g = 0.21, b = 0.93},
}

-- Définition des upgrades
GoldClicker.Upgrades = {
    -- Upgrades de production passive
    {
        id = "goblin",
        name = "Gobelin Mineur",
        description = "Un gobelin qui farm 0.5 gold par seconde",
        baseCost = 15,
        costMultiplier = 1.15,
        production = 0.5,
        icon = "Interface\\Icons\\INV_Misc_Coin_01",
    },
    {
        id = "dwarf",
        name = "Nain Forgeron",
        description = "Un nain qui génère 2 gold par seconde",
        baseCost = 100,
        costMultiplier = 1.15,
        production = 2,
        icon = "Interface\\Icons\\INV_Ingot_05",
    },
    {
        id = "mine",
        name = "Mine d'Or",
        description = "Une mine productive qui rapporte 10 gold/sec",
        baseCost = 1100,
        costMultiplier = 1.15,
        production = 10,
        icon = "Interface\\Icons\\INV_Ore_Gold_01",
    },
    {
        id = "auction",
        name = "Maître de l'Hôtel des Ventes",
        description = "Vend automatiquement pour 50 gold/sec",
        baseCost = 12000,
        costMultiplier = 1.15,
        production = 50,
        icon = "Interface\\Icons\\INV_Misc_Coin_02",
    },
    {
        id = "guild_bank",
        name = "Banque de Guilde",
        description = "Les contributions affluent: 300 gold/sec",
        baseCost = 130000,
        costMultiplier = 1.15,
        production = 300,
        icon = "Interface\\Icons\\INV_Misc_Bag_10_Green",
    },
    {
        id = "black_market",
        name = "Marché Noir",
        description = "Trafic de haut niveau: 1500 gold/sec",
        baseCost = 1400000,
        costMultiplier = 1.15,
        production = 1500,
        icon = "Interface\\Icons\\INV_Misc_Bag_15",
    },
    -- Employé 7
{
    id = "production_7",
    name = "Consortium de Kirin Tor",
    description = "Génère 7,500 gold par seconde",
    baseCost = 7000000,
    costMultiplier = 1.15,
    production = 7500,
    icon = "Interface\\Icons\\INV_Misc_Rune_01",
},

-- Employé 8
{
    id = "production_8",
    name = "Dragon Gardien de Trésor",
    description = "Génère 40,000 gold par seconde",
    baseCost = 50000000,
    costMultiplier = 1.15,
    production = 40000,
    icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Bronze",
},

-- Employé 9
{
    id = "production_9",
    name = "Cartel Gobelin",
    description = "Génère 200,000 gold par seconde",
    baseCost = 300000000,
    costMultiplier = 1.15,
    production = 200000,
    icon = "Interface\\Icons\\INV_Misc_Bomb_04",
},

-- Employé 10
{
    id = "production_10",
    name = "Empire Commercial Ethereal",
    description = "Génère 1,000,000 gold par seconde",
    baseCost = 1500000000,
    costMultiplier = 1.15,
    production = 1000000,
    icon = "Interface\\Icons\\Spell_Arcane_PortalDarnassus",
},
    
    -- Upgrades de multiplicateur de clic
    {
        id = "click_power_1",
        name = "Mains Expertes",
        description = "Double votre loot par clic",
        baseCost = 500,
        costMultiplier = 1,
        clickMultiplier = 2,
        maxPurchases = 1,
        icon = "Interface\\Icons\\Spell_Holy_InnerFire",
    },
    {
        id = "click_power_2",
        name = "Butin Critique",
        description = "Triple votre loot par clic",
        baseCost = 5000,
        costMultiplier = 1,
        clickMultiplier = 3,
        maxPurchases = 1,
        requires = "click_power_1",
        icon = "Interface\\Icons\\Ability_Warrior_DecisiveStrike",
    },
    {
        id = "click_power_3",
        name = "Pillage Titanesque",
        description = "Multiplie votre loot par clic de 5",
        baseCost = 50000,
        costMultiplier = 1,
        clickMultiplier = 5,
        maxPurchases = 1,
        requires = "click_power_2",
        icon = "Interface\\Icons\\INV_Misc_Gem_Diamond_03",
    },
    
    -- Multiplicateurs avancés
    {
        id = "click_power_4",
        name = "Rage du Farmer",
        description = "Multiplie votre loot par clic de 10",
        baseCost = 500000,
        costMultiplier = 1,
        clickMultiplier = 10,
        maxPurchases = 1,
        requires = "click_power_3",
        icon = "Interface\\Icons\\Ability_Warrior_Rampage",
    },
    {
        id = "click_power_5",
        name = "Bénédiction de Fortune",
        description = "Multiplie votre loot par clic de 25",
        baseCost = 5000000,
        costMultiplier = 1,
        clickMultiplier = 25,
        maxPurchases = 1,
        requires = "click_power_4",
        icon = "Interface\\Icons\\Spell_Holy_GreaterBlessingofKings",
    },
    {
    id = "production_multiplier",
    name = "Appel du Trésor",
    description = "Double la production de TOUS les employés",
    baseCost = 1000000,
    costMultiplier = 20,
    maxPurchases = 5,
    productionMultiplier = 2,
    icon = "Interface\\Icons\\Spell_Shadow_RainOfFire",
},
    
    -- Bonus loot chance
    {
        id = "loot_chance",
        name = "Chance du Pilleur",
        description = "Augmente la chance de loot de 2% par achat",
        icon = "Interface\\Icons\\INV_Misc_Gem_Pearl_05",
        baseCost = 1000,
        costMultiplier = 3,
        lootChanceBonus = 0.02
    },
    
    -- Améliorations de loot avancées
    {
        id = "loot_chance_2",
        name = "Œil du Pilleur",
        description = "Augmente la chance de loot de 5% par achat",
        icon = "Interface\\Icons\\INV_Misc_Eye_01",
        baseCost = 10000,
        costMultiplier = 4,
        lootChanceBonus = 0.05
    },
    {
        id = "loot_value_bonus",
        name = "Main Chanceuse",
        description = "Les items lootés valent 2x plus cher",
        baseCost = 50000,
        costMultiplier = 1,
        maxPurchases = 1,
        lootValueMultiplier = 2,
        icon = "Interface\\Icons\\INV_Misc_Coin_09",
    },
    {
        id = "better_quality",
        name = "Détecteur de Légendaire",
        description = "Augmente la chance d'items Rare/Epic de 50%",
        baseCost = 100000,
        costMultiplier = 1,
        maxPurchases = 1,
        betterQuality = true,
        icon = "Interface\\Icons\\INV_Misc_Spyglass_03",
    },
    {
        id = "double_loot",
        name = "Double Loot",
        description = "10% de chance de looter 2 items en même temps",
        baseCost = 250000,
        costMultiplier = 1,
        maxPurchases = 1,
        doubleLootChance = 0.10,
        icon = "Interface\\Icons\\INV_Misc_Bag_17",
    },
    
    -- Loot automatique
    {
        id = "auto_loot",
        name = "Pilleur Chanceux",
        description = "Loot automatiquement des items toutes les 10 secondes",
        icon = "Interface\\Icons\\Ability_Rogue_MasterOfSubtlety",
        baseCost = 5000,
        costMultiplier = 5,
        autoLoot = true
    },
    
    -- Améliorations passives
    {
        id = "auto_gold",
        name = "Collecteur Automatique",
        description = "Génère 100 gold automatiquement toutes les 10 secondes",
        baseCost = 25000,
        costMultiplier = 3,
        autoGoldAmount = 100,
        icon = "Interface\\Icons\\INV_Misc_Gear_04",
    },
    {
        id = "super_auto_loot",
        name = "Super Pilleur Chanceux",
        description = "Le loot automatique se déclenche toutes les 5 secondes au lieu de 10",
        baseCost = 150000,
        costMultiplier = 1,
        maxPurchases = 1,
        requires = "auto_loot",
        fasterAutoLoot = true,
        icon = "Interface\\Icons\\INV_Misc_PocketWatch_01",
    },
    {
        id = "auto_sell",
        name = "Vente Automatique",
        description = "Vend automatiquement les items Common toutes les 30 secondes",
        baseCost = 75000,
        costMultiplier = 1,
        maxPurchases = 1,
        autoSellCommon = true,
        icon = "Interface\\Icons\\INV_Misc_Coin_01",
    },
}

-- Fonction pour obtenir le coût d'un upgrade
function GoldClicker:GetUpgradeCost(upgradeId)
    local upgrade = self:GetUpgradeData(upgradeId)
    if not upgrade then return 0 end
    
    local purchased = GoldClickerDB.upgrades[upgradeId] or 0
    
    -- Si l'upgrade a un nombre max d'achats et qu'il est atteint
    if upgrade.maxPurchases and purchased >= upgrade.maxPurchases then
        return nil -- Indique qu'on ne peut plus acheter
    end
    
    return math.floor(upgrade.baseCost * (upgrade.costMultiplier ^ purchased))
end

-- Fonction pour obtenir les données d'un upgrade
function GoldClicker:GetUpgradeData(upgradeId)
    for _, upgrade in ipairs(self.Upgrades) do
        if upgrade.id == upgradeId then
            return upgrade
        end
    end
    return nil
end

-- Fonction pour obtenir les données d'un item
function GoldClicker:GetItemData(itemId)
    for _, item in ipairs(self.LootTable) do
        if item.id == itemId then
            -- Créer une copie de l'item
            local scaledItem = {}
            for k, v in pairs(item) do
                scaledItem[k] = v
            end
            
            -- Appliquer le multiplicateur de valeur de loot
            local lootValueMult = 1
            local valueBonusCount = GoldClickerDB.upgrades["loot_value_bonus"] or 0
            if valueBonusCount > 0 then
                lootValueMult = 2
            end
            
            -- Scaler le prix selon le temps de jeu (augmente de 10% par heure)
            local playTime = time() - GoldClickerDB.startTime
            local hoursPlayed = playTime / 3600
            local scaleMultiplier = 1 + (hoursPlayed * 0.1)
            
            scaledItem.value = math.floor(item.value * scaleMultiplier * lootValueMult)
            
            return scaledItem
        end
    end
    return nil
end

-- Fonction pour obtenir le coût d'un upgrade
function GoldClicker:GetUpgradeCost(upgradeId)
    local upgrade = self:GetUpgradeData(upgradeId)
    if not upgrade then return 0 end
    
    local purchased = GoldClickerDB.upgrades[upgradeId] or 0
    
    -- Si l'upgrade a un nombre max d'achats et qu'il est atteint
    if upgrade.maxPurchases and purchased >= upgrade.maxPurchases then
        return nil -- Indique qu'on ne peut plus acheter
    end
    
    return math.floor(upgrade.baseCost * (upgrade.costMultiplier ^ purchased))
end

-- Fonction pour obtenir les données d'un upgrade
function GoldClicker:GetUpgradeData(upgradeId)
    for _, upgrade in ipairs(self.Upgrades) do
        if upgrade.id == upgradeId then
            return upgrade
        end
    end
    return nil
end

-- Définition des achievements
GoldClicker.Achievements = {
    -- Achievements Gold
    {
        id = "gold_1k",
        name = "Premiers Pas",
        description = "Atteindre 1,000 gold total",
        icon = "Interface\\Icons\\INV_Misc_Coin_01",
        requirement = function() return GoldClickerDB.totalGold >= 1000 end,
        reward = "Production +5%%",
        rewardType = "production",
        rewardValue = 0.05,
    },
    {
        id = "gold_1m",
        name = "Millionnaire",
        description = "Atteindre 1,000,000 gold total",
        icon = "Interface\\Icons\\INV_Misc_Coin_02",
        requirement = function() return GoldClickerDB.totalGold >= 1000000 end,
        reward = "Production +10%%",
        rewardType = "production",
        rewardValue = 0.10,
    },
    {
        id = "gold_1b",
        name = "Milliardaire",
        description = "Atteindre 1,000,000,000 gold total",
        icon = "Interface\\Icons\\INV_Ingot_05",
        requirement = function() return GoldClickerDB.totalGold >= 1000000000 end,
        reward = "Production +25%%",
        rewardType = "production",
        rewardValue = 0.25,
    },
    
    -- Achievements Clics
    {
        id = "clicks_100",
        name = "Clicker Debutant",
        description = "Cliquer 100 fois",
        icon = "Interface\\Icons\\Ability_Warrior_DecisiveStrike",
        requirement = function() return GoldClickerDB.totalClicks >= 100 end,
        reward = "Clic +10%%",
        rewardType = "click",
        rewardValue = 0.10,
    },
    {
        id = "clicks_1k",
        name = "Clicker Pro",
        description = "Cliquer 1,000 fois",
        icon = "Interface\\Icons\\Ability_Warrior_Rampage",
        requirement = function() return GoldClickerDB.totalClicks >= 1000 end,
        reward = "Clic +20%%",
        rewardType = "click",
        rewardValue = 0.20,
    },
    {
        id = "clicks_10k",
        name = "Addiction",
        description = "Cliquer 10,000 fois",
        icon = "Interface\\Icons\\Spell_Holy_InnerFire",
        requirement = function() return GoldClickerDB.totalClicks >= 10000 end,
        reward = "Clic +50%%",
        rewardType = "click",
        rewardValue = 0.50,
    },
    
    -- Achievements Loot
    {
        id = "loot_10",
        name = "Pilleur Amateur",
        description = "Looter 10 items",
        icon = "Interface\\Icons\\INV_Misc_Bag_10_Green",
        requirement = function() return GoldClickerDB.totalLooted >= 10 end,
        reward = "Loot +5%% chance",
        rewardType = "loot_chance",
        rewardValue = 0.05,
    },
    {
        id = "loot_100",
        name = "Chasseur de Tresor",
        description = "Looter 100 items",
        icon = "Interface\\Icons\\INV_Misc_Bag_17",
        requirement = function() return GoldClickerDB.totalLooted >= 100 end,
        reward = "Loot +10%% chance",
        rewardType = "loot_chance",
        rewardValue = 0.10,
    },
    
    -- Achievements Employés
    {
        id = "goblin_10",
        name = "Patron Gobelin",
        description = "Posseder 10 Gobelins Mineurs",
        icon = "Interface\\Icons\\INV_Misc_Coin_01",
        requirement = function() return (GoldClickerDB.upgrades["goblin"] or 0) >= 10 end,
        reward = "Production +10%%",
        rewardType = "production",
        rewardValue = 0.10,
    },
    
    -- Achievements Temps de jeu
    {
        id = "playtime_1h",
        name = "Marathonien",
        description = "Jouer pendant 1 heure",
        icon = "Interface\\Icons\\INV_Misc_PocketWatch_01",
        requirement = function() return (time() - GoldClickerDB.startTime) >= 3600 end,
        reward = "Production +5%%",
        rewardType = "production",
        rewardValue = 0.05,
    },
    
    -- Achievements Prestige
    {
        id = "prestige_1",
        name = "Renaissance",
        description = "Effectuer votre premier Prestige",
        icon = "Interface\\Icons\\Spell_Holy_GreaterHeal",
        requirement = function() return (GoldClickerDB.totalPrestiges or 0) >= 1 end,
        reward = "+1 Point Prestige",
        rewardType = "prestige_point",
        rewardValue = 1,
    },
}

-- Upgrades Prestige (améliorations permanentes)
GoldClicker.PrestigeUpgrades = {
    {
        id = "quick_start",
        name = "Depart Rapide",
        description = "Commence chaque prestige avec 10,000 gold",
        icon = "Interface\\Icons\\Inv_boots_plate_03",
        cost = 3,
        maxPurchases = 5,
        effect = function(level)
            return 10000 * level  -- 10k par niveau
        end,
        applyOn = "prestige_start",  -- S'applique au début du prestige
    },
    {
        id = "dungeon_speed",
        name = "Donjon Express",
        description = "Reduit le cooldown des donjons de 5 minutes",
        icon = "Interface\\Icons\\inv_gizmo_newgoggles",
        cost = 5,
        maxPurchases = 6,
        effect = function(level)
            return level * 300  -- 5 minutes = 300 secondes par niveau
        end,
        applyOn = "dungeon_cooldown",
    },
    {
        id = "epic_hunter",
        name = "Chasseur Epic",
        description = "Augmente la chance de loot Epic de 5%",
        icon = "Interface\\Icons\\INV_Misc_Gem_Variety_01",
        cost = 10,
        maxPurchases = 3,
        effect = function(level)
            return level * 0.05  -- +5% par niveau
        end,
        applyOn = "epic_chance",
    },
    {
        id = "super_production",
        name = "Super Production",
        description = "Augmente la production de base de 50%",
        icon = "Interface\\Icons\\INV_Misc_Gear_01",
        cost = 15,
        maxPurchases = nil,  -- Infini
        effect = function(level)
            return level * 0.5  -- +50% par niveau
        end,
        applyOn = "production_boost",
    },
    {
        id = "mega_click",
        name = "Mega Clic",
        description = "Augmente la valeur des clics de 100%",
        icon = "Interface\\Icons\\INV_Gauntlets_28",
        cost = 8,
        maxPurchases = nil,  -- Infini
        effect = function(level)
            return level * 1.0  -- +100% par niveau
        end,
        applyOn = "click_boost",
    },
    {
        id = "fast_auto_loot",
        name = "Loot Auto Rapide",
        description = "Loot automatique toutes les 3s au lieu de 5s",
        icon = "Interface\\Icons\\INV_Misc_Bag_10",
        cost = 5,
        maxPurchases = 1,
        effect = function(level)
            return 3  -- 3 secondes
        end,
        applyOn = "auto_loot_speed",
    },
}

-- Fonction pour obtenir les données brutes d'un item (sans scaling, pour achievements)
function GoldClicker:GetItemDataRaw(itemId)
    for _, item in ipairs(self.LootTable) do
        if item.id == itemId then
            return item
        end
    end
    return nil
end

