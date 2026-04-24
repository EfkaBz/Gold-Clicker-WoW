-- UI.lua - Interface graphique simple et propre

GoldClicker = GoldClicker or {}

-- Système de localisation
GoldClicker.currentLanguage = "fr"

GoldClicker.L = {
    ["fr"] = {
        ["Gold Clicker WoW"] = "Gold Clicker WoW",
        ["Inventaire"] = "Inventaire",
        ["Reset"] = "Reset",
        ["Règles"] = "Règles",
        ["Employés & Améliorations"] = "Employés & Améliorations",
        ["EMPLOYÉS"] = "EMPLOYÉS",
        ["AMÉLIORATIONS"] = "AMÉLIORATIONS",
        ["Possédé: "] = "Possédé: ",
        ["Coût: "] = "Coût: ",
        ["Coût (x"] = "Coût (x",
        ["): "] = "): ",
        ["MAX"] = "MAX",
        ["GOLD"] = "GOLD",
        ["par seconde: "] = "par seconde: ",
        ["par clic: "] = "par clic: ",
        ["Inventaire & Hôtel des Ventes"] = "Inventaire & Hôtel des Ventes",
        ["Items: "] = "Items: ",
        ["Valeur totale: "] = "Valeur totale: ",
        ["Total looté: "] = "Total looté: ",
        ["Quantité: "] = "Quantité: ",
        ["g chacun"] = "g chacun",
        ["Vendre"] = "Vendre",
        ["Tout Vendre à l'HDV"] = "Tout Vendre à l'HDV",
        ["Total farmé: "] = "Total farmé: ",
        ["Clics: "] = "Clics: ",
        ["Temps de jeu: "] = "Temps de jeu: ",
        ["Cliquez pour farmer de l'or !"] = "Cliquez pour farmer de l'or !",
        ["Voulez-vous vraiment tout réinitialiser ?\n\n|cffff0000Vous perdrez:|r\n- Tout votre gold\n- Tous vos upgrades\n- Tout votre inventaire\n- Toutes vos statistiques"] = "Voulez-vous vraiment tout réinitialiser ?\n\n|cffff0000Vous perdrez:|r\n- Tout votre gold\n- Tous vos upgrades\n- Tout votre inventaire\n- Toutes vos statistiques",
        ["Oui, Reset !"] = "Oui, Reset !",
        ["Annuler"] = "Annuler",
        ["Règles du mini-jeu Gold Clicker WoW:\n\n1. Cliquer pour gagner de l'or:\n   - Clique sur la grosse pièce d'or pour gagner du gold.\n   - Chaque clic donne une quantité de gold, augmentée par les upgrades de clic.\n\n2. Acheter des employés:\n   - Achète des employés/producteurs pour générer du gold automatiquement par seconde.\n   - Plus tu achètes d'employés, plus ta production passive augmente.\n\n3. Acheter des multiplicateurs:\n   - Les upgrades de type click_power augmentent le loot par clic.\n   - Certains multiplicateurs avancés demandent d'acheter le niveau précédent.\n\n4. Augmenter la chance de loot:\n   - Certains upgrades augmentent ta chance de looter un objet à chaque clic.\n   - Ces bonus s'additionnent pour rendre le loot automatique et manuel plus fréquent.\n\n5. Loot automatique:\n   - Si tu achètes Pilleur Chanceux, le jeu tente automatiquement de looter des items à intervalle régulier.\n   - L'intervalle peut être réduit si tu prends l'amélioration Super Pilleur Chanceux.\n\n6. Inventaire:\n   - Les items lootés vont dans ton inventaire.\n   - Tu peux voir leur quantité, valeur, et les vendre individuellement ou tout vendre à l'HDV.\n\n7. Vendre les items:\n   - Tu peux vendre les objets common automatiquement si tu achètes Vente Automatique.\n   - Le prix des items peut être multiplié par certaines améliorations.\n\n8. Effets passifs:\n   - Certaines améliorations donnent du gold régulier sans clic, comme Collecteur Automatique.\n   - D'autres améliorations modifient la production globale ou la qualité des objets lootés.\n\n9. Coût et progression:\n   - Chaque upgrade coûte du gold.\n   - Certains upgrades ont un coût fixe et d'autres augmentent avec chaque achat.\n   - Certaines améliorations sont limitées à un achat unique.\n\n10. Stratégie:\n   - Investis dans la production automatique pour augmenter tes gains passifs.\n   - Utilise les multiplicateurs de clic si tu cliques souvent."] = "Règles du mini-jeu Gold Clicker WoW:\n\n1. Cliquer pour gagner de l'or:\n   - Clique sur la grosse pièce d'or pour gagner du gold.\n   - Chaque clic donne une quantité de gold, augmentée par les upgrades de clic.\n\n2. Acheter des employés:\n   - Achète des employés/producteurs pour générer du gold automatiquement par seconde.\n   - Plus tu achètes d'employés, plus ta production passive augmente.\n\n3. Acheter des multiplicateurs:\n   - Les upgrades de type click_power augmentent le loot par clic.\n   - Certains multiplicateurs avancés demandent d'acheter le niveau précédent.\n\n4. Augmenter la chance de loot:\n   - Certains upgrades augmentent ta chance de looter un objet à chaque clic.\n   - Ces bonus s'additionnent pour rendre le loot automatique et manuel plus fréquent.\n\n5. Loot automatique:\n   - Si tu achètes Pilleur Chanceux, le jeu tente automatiquement de looter des items à intervalle régulier.\n   - L'intervalle peut être réduit si tu prends l'amélioration Super Pilleur Chanceux.\n\n6. Inventaire:\n   - Les items lootés vont dans ton inventaire.\n   - Tu peux voir leur quantité, valeur, et les vendre individuellement ou tout vendre à l'HDV.\n\n7. Vendre les items:\n   - Tu peux vendre les objets common automatiquement si tu achètes Vente Automatique.\n   - Le prix des items peut être multiplié par certaines améliorations.\n\n8. Effets passifs:\n   - Certaines améliorations donnent du gold régulier sans clic, comme Collecteur Automatique.\n   - D'autres améliorations modifient la production globale ou la qualité des objets lootés.\n\n9. Coût et progression:\n   - Chaque upgrade coûte du gold.\n   - Certains upgrades ont un coût fixe et d'autres augmentent avec chaque achat.\n   - Certaines améliorations sont limitées à un achat unique.\n\n10. Stratégie:\n   - Investis dans la production automatique pour augmenter tes gains passifs.\n   - Utilise les multiplicateurs de clic si tu cliques souvent.",
        ["par seconde: "] = "par seconde: ",
        ["par clic: "] = "par clic: ",
        ["Coût: "] = "Coût: ",
        ["Coût (x"] = "Coût (x",
        ["): "] = "): ",
        [" gold"] = " gold",
    }
}

function GoldClicker:GetLocalizedText(key)
    return self.L[self.currentLanguage][key] or key
end

-- Créer l'interface principale
function GoldClicker:CreateUI()
    local frame = CreateFrame("Frame", "GoldClickerFrame", UIParent)
    frame:SetSize(750, 660)
    frame:SetPoint("CENTER", 0, 0)
    
    -- Fond simple
    local bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.06, 0.06, 0.06, 0.95)
    
    -- Bordure plus discrète
    local borderSize = 3
    
    local topBorder = frame:CreateTexture(nil, "BORDER")
    topBorder:SetPoint("TOPLEFT", 0, 0)
    topBorder:SetPoint("TOPRIGHT", 0, 0)
    topBorder:SetHeight(borderSize)
    topBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    local bottomBorder = frame:CreateTexture(nil, "BORDER")
    bottomBorder:SetPoint("BOTTOMLEFT", 0, 0)
    bottomBorder:SetPoint("BOTTOMRIGHT", 0, 0)
    bottomBorder:SetHeight(borderSize)
    bottomBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    local leftBorder = frame:CreateTexture(nil, "BORDER")
    leftBorder:SetPoint("TOPLEFT", 0, 0)
    leftBorder:SetPoint("BOTTOMLEFT", 0, 0)
    leftBorder:SetWidth(borderSize)
    leftBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    local rightBorder = frame:CreateTexture(nil, "BORDER")
    rightBorder:SetPoint("TOPRIGHT", 0, 0)
    rightBorder:SetPoint("BOTTOMRIGHT", 0, 0)
    rightBorder:SetWidth(borderSize)
    rightBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetFrameStrata("HIGH")
    frame:SetToplevel(true)
    frame:Hide()
    
    self.mainFrame = frame
    

    
    -- Bouton de fermeture
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -5, -5)
    closeBtn:SetSize(32, 32)
    closeBtn:SetScript("OnClick", function()
        frame:Hide()
    end)
    
    -- Titre
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    title:SetPoint("TOP", 0, -20)
    title:SetText(self:GetLocalizedText("Gold Clicker WoW"))
    title:SetTextColor(1, 0.9, 0.3)
    title:SetShadowOffset(3, -3)
    title:SetShadowColor(0, 0, 0, 1)
    self.titleText = title
    
    self:CreateGoldButton(frame)
    self:CreateActionButtons(frame)
    self:CreateUpgradeList(frame)
    self:CreateStatsPanel(frame)
    self:CreateMinimapButton()
end

-- Créer le bouton gold
function GoldClicker:CreateGoldButton(parent)
    local goldFrame = CreateFrame("Frame", nil, parent)
    goldFrame:SetSize(320, 420)
    goldFrame:SetPoint("TOPLEFT", 25, -65)
    
    local bg = goldFrame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.08, 0.08, 0.08, 0.95)
    
    local border = goldFrame:CreateTexture(nil, "BORDER")
    border:SetPoint("TOPLEFT", -3, 3)
    border:SetPoint("BOTTOMRIGHT", 3, -3)
    border:SetColorTexture(0.18, 0.18, 0.18, 0.95)
    
    local goldContainer = CreateFrame("Frame", nil, goldFrame)
    goldContainer:SetSize(220, 220)
    goldContainer:SetPoint("TOP", 0, -25)
    
    -- Bouton pièce
    local goldBtn = CreateFrame("Button", nil, goldContainer)
    goldBtn:SetSize(200, 200)
    goldBtn:SetPoint("CENTER")
    
    local texture = goldBtn:CreateTexture(nil, "ARTWORK")
    texture:SetAllPoints()
    texture:SetTexture("Interface\\Icons\\INV_Misc_Coin_01")
    
    -- Textes
    local goldCount = goldFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    goldCount:SetPoint("TOP", goldBtn, "BOTTOM", 0, -25)
    goldCount:SetText("0")
    goldCount:SetTextColor(1, 0.9, 0.2)
    goldCount:SetShadowOffset(2, -2)
    goldCount:SetShadowColor(0, 0, 0, 1)
    self.goldCountText = goldCount
    
    local goldLabel = goldFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    goldLabel:SetPoint("TOP", goldCount, "BOTTOM", 0, -10)
    goldLabel:SetText("GOLD")
    goldLabel:SetTextColor(1, 0.9, 0.3)
    goldLabel:SetShadowOffset(1, -1)
    
    local gpsText = goldFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    gpsText:SetPoint("TOP", goldLabel, "BOTTOM", 0, -20)
    gpsText:SetText("par seconde: 0")
    gpsText:SetTextColor(0.95, 0.95, 0.95)
    self.cpsText = gpsText
    
    local clickValue = goldFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    clickValue:SetPoint("TOP", gpsText, "BOTTOM", 0, -6)
    clickValue:SetText("par clic: 1")
    clickValue:SetTextColor(0.5, 1, 0.5)
    self.clickValueText = clickValue
    
goldBtn:SetScript("OnClick", function()
    GoldClicker:OnGoldClick()
    
    -- Animation zoom/dézoom
    local clickAnim = goldBtn:CreateAnimationGroup()
    
    local scale1 = clickAnim:CreateAnimation("Scale")
    scale1:SetScale(0.9, 0.9)
    scale1:SetDuration(0.08)
    scale1:SetOrder(1)
    
    local scale2 = clickAnim:CreateAnimation("Scale")
    scale2:SetScale(1.111, 1.111)
    scale2:SetDuration(0.08)
    scale2:SetOrder(2)
    
    clickAnim:Play()
end)
    
    goldBtn:SetScript("OnEnter", function()
        texture:SetVertexColor(1.2, 1.2, 1.1)
        
        GameTooltip:SetOwner(goldBtn, "ANCHOR_RIGHT")
        GameTooltip:SetText("Cliquez pour farmer de l'or !", 1, 0.9, 0.3)
        GameTooltip:Show()
    end)
    
    goldBtn:SetScript("OnLeave", function()
        texture:SetVertexColor(1, 1, 1)
        GameTooltip:Hide()
    end)
    
    goldBtn:EnableMouse(true)
    goldBtn:RegisterForClicks("LeftButtonUp")
end

-- Créer les boutons d'action
function GoldClicker:CreateActionButtons(parent)
    -- Bouton Inventaire
    local invBtn = CreateFrame("Button", nil, parent)
    invBtn:SetSize(135, 38)
    invBtn:SetPoint("BOTTOM", -290, 130)
    
    local invNormal = invBtn:CreateTexture(nil, "BACKGROUND")
    invNormal:SetAllPoints()
    invNormal:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    invNormal:SetTexCoord(0, 0.625, 0, 0.6875)
    
    local invHighlight = invBtn:CreateTexture(nil, "HIGHLIGHT")
    invHighlight:SetAllPoints()
    invHighlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    invHighlight:SetTexCoord(0, 0.625, 0, 0.6875)
    invHighlight:SetBlendMode("ADD")
    
    local invIcon = invBtn:CreateTexture(nil, "ARTWORK")
    invIcon:SetSize(26, 26)
    invIcon:SetPoint("LEFT", 8, 0)
    invIcon:SetTexture("Interface\\Icons\\INV_Misc_Bag_10_Green")
    
    local invText = invBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    invText:SetPoint("LEFT", invIcon, "RIGHT", 8, 0)
    invText:SetText(self:GetLocalizedText("Inventaire"))
    invText:SetTextColor(1, 0.82, 0)
    
    invBtn:SetScript("OnClick", function() self:ToggleInventory() end)
    invBtn:EnableMouse(true)
    invBtn:RegisterForClicks("LeftButtonUp")
    
    -- Bouton Reset
    local resetBtn = CreateFrame("Button", nil, parent)
    resetBtn:SetSize(135, 38)
    resetBtn:SetPoint("LEFT", invBtn, "RIGHT", 10, 0)
    
    local resetNormal = resetBtn:CreateTexture(nil, "BACKGROUND")
    resetNormal:SetAllPoints()
    resetNormal:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    resetNormal:SetTexCoord(0, 0.625, 0, 0.6875)
    
    local resetHighlight = resetBtn:CreateTexture(nil, "HIGHLIGHT")
    resetHighlight:SetAllPoints()
    resetHighlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    resetHighlight:SetTexCoord(0, 0.625, 0, 0.6875)
    resetHighlight:SetBlendMode("ADD")
    
    local resetIcon = resetBtn:CreateTexture(nil, "ARTWORK")
    resetIcon:SetSize(26, 26)
    resetIcon:SetPoint("LEFT", 8, 0)
    resetIcon:SetTexture("Interface\\Icons\\Spell_ChargeNegative")
    
    local resetText = resetBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    resetText:SetPoint("LEFT", resetIcon, "RIGHT", 8, 0)
    resetText:SetText(self:GetLocalizedText("Reset"))
    resetText:SetTextColor(1, 0.82, 0)
    
    resetBtn:SetScript("OnClick", function()
        StaticPopupDialogs["GOLDCLICKER_RESET_CHOICE"] = {
            text = "|cffFFD700Quel type de reset voulez-vous ?|r\n\n|cff00ff00Garder Prestige:|r\nReset tout SAUF votre niveau de prestige, succes et ameliorations permanentes\n\n|cffff0000Reset Total:|r\nTOUT remettre a zero (prestige, succes et ameliorations permanentes inclus)",
            button1 = "Garder Prestige",
            button2 = "Reset Total",
            button3 = "Annuler",
            OnAccept = function() 
                GoldClicker:Reset() -- Reset normal (garde le prestige et succès)
            end,
            OnCancel = function()
                -- Reset TOTAL (prestige et succès inclus)
                StaticPopupDialogs["GOLDCLICKER_RESET_CONFIRM"] = {
                    text = "|cffff0000ATTENTION !|r\n\nVous allez TOUT perdre :\n- Tout votre gold\n- Tous vos employes\n- Toutes vos ameliorations\n- Tout votre inventaire\n- |cffff0000TOUS VOS PRESTIGES|r\n- |cffff0000TOUS VOS SUCCES|r\n- |cffff0000TOUTES LES AMELIORATIONS PERMANENTES|r\n\nC'est IRREVERSIBLE !",
                    button1 = "OUI, TOUT RESET",
                    button2 = "Annuler",
                    OnAccept = function()
                        GoldClicker:ResetFull()
                    end,
                    timeout = 0,
                    whileDead = true,
                    hideOnEscape = true,
                    preferredIndex = 3,
                }
                StaticPopup_Show("GOLDCLICKER_RESET_CONFIRM")
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }
        StaticPopup_Show("GOLDCLICKER_RESET_CHOICE")
    end)
    
    resetBtn:EnableMouse(true)
    resetBtn:RegisterForClicks("LeftButtonUp")
    
    -- Bouton Prestige
    local prestigeBtn = CreateFrame("Button", nil, parent)
    prestigeBtn:SetSize(135, 38)
    prestigeBtn:SetPoint("LEFT", resetBtn, "RIGHT", 10, 0)
    
    local prestigeNormal = prestigeBtn:CreateTexture(nil, "BACKGROUND")
    prestigeNormal:SetAllPoints()
    prestigeNormal:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    prestigeNormal:SetTexCoord(0, 0.625, 0, 0.6875)
    
    local prestigeHighlight = prestigeBtn:CreateTexture(nil, "HIGHLIGHT")
    prestigeHighlight:SetAllPoints()
    prestigeHighlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    prestigeHighlight:SetTexCoord(0, 0.625, 0, 0.6875)
    prestigeHighlight:SetBlendMode("ADD")
    
    local prestigeIcon = prestigeBtn:CreateTexture(nil, "ARTWORK")
    prestigeIcon:SetSize(26, 26)
    prestigeIcon:SetPoint("LEFT", 8, 0)
    prestigeIcon:SetTexture("Interface\\Icons\\Spell_Holy_GreaterHeal")  
    local prestigeText = prestigeBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    prestigeText:SetPoint("LEFT", prestigeIcon, "RIGHT", 8, 0)
    prestigeText:SetText("Prestige")
    prestigeText:SetTextColor(1, 0.82, 0)
    
    prestigeBtn:SetScript("OnClick", function()
        if GoldClicker:CanPrestige() then
            local pointsGained = GoldClicker:CalculatePrestigePoints()
            StaticPopupDialogs["GOLDCLICKER_PRESTIGE"] = {
                text = "|cffFFD700PRESTIGE|r\n\nVous allez gagner:\n\n|cff00ff00+" .. pointsGained .. " Points de Prestige|r\n|cff00ff00+" .. ((GoldClickerDB.prestigeLevel + 1) * 10) .. "%% production permanente|r\n\n|cffff0000Vous perdrez tout:|r\nGold, employes, ameliorations, inventaire",
                button1 = "PRESTIGE !",
                button2 = "Annuler",
                OnAccept = function() GoldClicker:DoPrestige() end,
                timeout = 0,
                whileDead = true,
                hideOnEscape = true,
                preferredIndex = 3,
            }
            StaticPopup_Show("GOLDCLICKER_PRESTIGE")
        else
            print("|cffff0000Vous avez besoin de 1 milliard de gold total pour faire un Prestige!")
        end
    end)
    
    prestigeBtn:SetScript("OnEnter", function()
        GameTooltip:SetOwner(prestigeBtn, "ANCHOR_RIGHT")
        if GoldClicker:CanPrestige() then
            local points = GoldClicker:CalculatePrestigePoints()
            GameTooltip:SetText("|cffFFD700PRESTIGE DISPONIBLE|r", 1, 1, 1)
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("Points gagnes: |cff00ff00" .. points .. "|r", 1, 1, 1)
            GameTooltip:AddLine("Nouveau bonus: |cff00ff00+" .. ((GoldClickerDB.prestigeLevel + 1) * 10) .. "%% production|r", 1, 1, 1)
        else
            GameTooltip:SetText("Prestige", 1, 0.9, 0.3)
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cffff0000Requis: 1,000,000,000 gold total|r", 1, 1, 1)
            GameTooltip:AddLine("Actuel: " .. GoldClicker:FormatNumber(GoldClickerDB.totalGold), 0.8, 0.8, 0.8)
        end
        GameTooltip:Show()
    end)
    
    prestigeBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    
    prestigeBtn:EnableMouse(true)
    prestigeBtn:RegisterForClicks("LeftButtonUp")
    self.prestigeButton = prestigeBtn
    
    -- Bouton Succès
    local achievementBtn = CreateFrame("Button", nil, parent)
    achievementBtn:SetSize(135, 38)
    achievementBtn:SetPoint("LEFT", prestigeBtn, "RIGHT", 10, 0)
    
    local achievementNormal = achievementBtn:CreateTexture(nil, "BACKGROUND")
    achievementNormal:SetAllPoints()
    achievementNormal:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    achievementNormal:SetTexCoord(0, 0.625, 0, 0.6875)
    
    local achievementHighlight = achievementBtn:CreateTexture(nil, "HIGHLIGHT")
    achievementHighlight:SetAllPoints()
    achievementHighlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    achievementHighlight:SetTexCoord(0, 0.625, 0, 0.6875)
    achievementHighlight:SetBlendMode("ADD")
    
    local achievementIcon = achievementBtn:CreateTexture(nil, "ARTWORK")
    achievementIcon:SetSize(26, 26)
    achievementIcon:SetPoint("LEFT", 8, 0)
    achievementIcon:SetTexture("Interface\\Icons\\Spell_Arcane_StarFire")
    
    local achievementText = achievementBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    achievementText:SetPoint("LEFT", achievementIcon, "RIGHT", 8, 0)
    achievementText:SetText("Succes")
    achievementText:SetTextColor(1, 0.82, 0)
    
    achievementBtn:SetScript("OnClick", function() self:ToggleAchievements() end)
    achievementBtn:EnableMouse(true)
    achievementBtn:RegisterForClicks("LeftButtonUp")

    -- Bouton Règles du jeu
    local rulesBtn = CreateFrame("Button", nil, parent)
    rulesBtn:SetSize(135, 38)
    rulesBtn:SetPoint("LEFT", achievementBtn, "RIGHT", 10, 0)

    local rulesNormal = rulesBtn:CreateTexture(nil, "BACKGROUND")
    rulesNormal:SetAllPoints()
    rulesNormal:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    rulesNormal:SetTexCoord(0, 0.625, 0, 0.6875)

    local rulesHighlight = rulesBtn:CreateTexture(nil, "HIGHLIGHT")
    rulesHighlight:SetAllPoints()
    rulesHighlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    rulesHighlight:SetTexCoord(0, 0.625, 0, 0.6875)
    rulesHighlight:SetBlendMode("ADD")

    local rulesIcon = rulesBtn:CreateTexture(nil, "ARTWORK")
    rulesIcon:SetSize(26, 26)
    rulesIcon:SetPoint("LEFT", 8, 0)
    rulesIcon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")

    local rulesText = rulesBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    rulesText:SetPoint("LEFT", rulesIcon, "RIGHT", 8, 0)
    rulesText:SetText(self:GetLocalizedText("Règles"))
    rulesText:SetTextColor(1, 0.82, 0)

    rulesBtn:SetScript("OnClick", function() self:ShowGameRules() end)
    rulesBtn:EnableMouse(true)
    rulesBtn:RegisterForClicks("LeftButtonUp")
    
    -- DEUXIÈME LIGNE DE BOUTONS
    
    -- Bouton Donjon/Raid
    local dungeonBtn = CreateFrame("Button", nil, parent)
    dungeonBtn:SetSize(135, 38)
    dungeonBtn:SetPoint("BOTTOM", -290, 90)  -- Même X que invBtn, mais Y plus bas
    
    local dungeonNormal = dungeonBtn:CreateTexture(nil, "BACKGROUND")
    dungeonNormal:SetAllPoints()
    dungeonNormal:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    dungeonNormal:SetTexCoord(0, 0.625, 0, 0.6875)
    
    local dungeonHighlight = dungeonBtn:CreateTexture(nil, "HIGHLIGHT")
    dungeonHighlight:SetAllPoints()
    dungeonHighlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    dungeonHighlight:SetTexCoord(0, 0.625, 0, 0.6875)
    dungeonHighlight:SetBlendMode("ADD")
    
    local dungeonIcon = dungeonBtn:CreateTexture(nil, "ARTWORK")
    dungeonIcon:SetSize(26, 26)
    dungeonIcon:SetPoint("LEFT", 8, 0)
    dungeonIcon:SetTexture("Interface\\Icons\\INV_Misc_Key_03")
    
    local dungeonText = dungeonBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    dungeonText:SetPoint("LEFT", dungeonIcon, "RIGHT", 8, 0)
    dungeonText:SetText("Donjon")
    dungeonText:SetTextColor(1, 0.82, 0)
    
    dungeonBtn:SetScript("OnClick", function() self:StartDungeon() end)
    dungeonBtn:SetScript("OnEnter", function()
        GameTooltip:SetOwner(dungeonBtn, "ANCHOR_RIGHT")
        
        if self:CanStartDungeon() then
            GameTooltip:SetText("|cffFFD700LANCER UN DONJON|r", 1, 1, 1)
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("Cout: 10,000 gold", 1, 1, 1)
            GameTooltip:AddLine("Recompenses:", 0, 1, 0)
            GameTooltip:AddLine("- Gold bonus (variable)", 1, 1, 1)
            GameTooltip:AddLine("- Items rares garantis", 1, 1, 1)
        else
            local cooldownRemaining = self:GetDungeonCooldown()
            if cooldownRemaining > 0 then
                local mins = math.floor(cooldownRemaining / 60)
                local secs = cooldownRemaining % 60
                GameTooltip:SetText("Donjon", 1, 0.9, 0.3)
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine("|cffff0000Cooldown: " .. mins .. "m " .. secs .. "s|r", 1, 1, 1)
            else
                GameTooltip:SetText("Donjon", 1, 0.9, 0.3)
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine("|cffff0000Requis: 10,000 gold|r", 1, 1, 1)
            end
        end
        GameTooltip:Show()
    end)
    
    dungeonBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    
    dungeonBtn:EnableMouse(true)
    dungeonBtn:RegisterForClicks("LeftButtonUp")
    self.dungeonButton = dungeonBtn
    
    -- Bouton Boutique Prestige
    local shopBtn = CreateFrame("Button", nil, parent)
    shopBtn:SetSize(135, 38)
    shopBtn:SetPoint("LEFT", dungeonBtn, "RIGHT", 10, 0)
    
    local shopNormal = shopBtn:CreateTexture(nil, "BACKGROUND")
    shopNormal:SetAllPoints()
    shopNormal:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    shopNormal:SetTexCoord(0, 0.625, 0, 0.6875)
    
    local shopHighlight = shopBtn:CreateTexture(nil, "HIGHLIGHT")
    shopHighlight:SetAllPoints()
    shopHighlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    shopHighlight:SetTexCoord(0, 0.625, 0, 0.6875)
    shopHighlight:SetBlendMode("ADD")
    
    local shopIcon = shopBtn:CreateTexture(nil, "ARTWORK")
    shopIcon:SetSize(26, 26)
    shopIcon:SetPoint("LEFT", 8, 0)
    shopIcon:SetTexture("Interface\\Icons\\INV_Misc_Gem_Diamond_03")
    
    local shopText = shopBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    shopText:SetPoint("LEFT", shopIcon, "RIGHT", 8, 0)
    shopText:SetText("Boutique")
    shopText:SetTextColor(1, 0.82, 0)
    
    shopBtn:SetScript("OnClick", function() self:TogglePrestigeShop() end)
    shopBtn:SetScript("OnEnter", function()
        GameTooltip:SetOwner(shopBtn, "ANCHOR_RIGHT")
        GameTooltip:SetText("|cffFFD700BOUTIQUE PRESTIGE|r", 1, 1, 1)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Points disponibles: |cff00ff00" .. (GoldClickerDB.prestigePoints or 0) .. "|r", 1, 1, 1)
        GameTooltip:AddLine("Ameliorations permanentes", 0.8, 0.8, 0.8)
        GameTooltip:Show()
    end)
    
    shopBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    
    shopBtn:EnableMouse(true)
    shopBtn:RegisterForClicks("LeftButtonUp")
    self.shopButton = shopBtn
end

function GoldClicker:ShowGameRules()
    StaticPopupDialogs["GOLDCLICKER_RULES"] = {
        text = self:GetLocalizedText("Règles du mini-jeu Gold Clicker WoW:\n\n1. Cliquer pour gagner de l'or:\n   - Clique sur la grosse pièce d'or pour gagner du gold.\n   - Chaque clic donne une quantité de gold, augmentée par les upgrades de clic.\n\n2. Acheter des employés:\n   - Achète des employés/producteurs pour générer du gold automatiquement par seconde.\n   - Plus tu achètes d'employés, plus ta production passive augmente.\n\n3. Acheter des multiplicateurs:\n   - Les upgrades de type click_power augmentent le loot par clic.\n   - Certains multiplicateurs avancés demandent d'acheter le niveau précédent.\n\n4. Augmenter la chance de loot:\n   - Certains upgrades augmentent ta chance de looter un objet à chaque clic.\n   - Ces bonus s'additionnent pour rendre le loot automatique et manuel plus fréquent.\n\n5. Loot automatique:\n   - Si tu achètes Pilleur Chanceux, le jeu tente automatiquement de looter des items à intervalle régulier.\n   - L'intervalle peut être réduit si tu prends l'amélioration Super Pilleur Chanceux.\n\n6. Inventaire:\n   - Les items lootés vont dans ton inventaire.\n   - Tu peux voir leur quantité, valeur, et les vendre individuellement ou tout vendre à l'HDV.\n\n7. Vendre les items:\n   - Tu peux vendre les objets common automatiquement si tu achètes Vente Automatique.\n   - Le prix des items peut être multiplié par certaines améliorations.\n\n8. Effets passifs:\n   - Certaines améliorations donnent du gold régulier sans clic, comme Collecteur Automatique.\n   - D'autres améliorations modifient la production globale ou la qualité des objets lootés.\n\n9. Coût et progression:\n   - Chaque upgrade coûte du gold.\n   - Certains upgrades ont un coût fixe et d'autres augmentent avec chaque achat.\n   - Certaines améliorations sont limitées à un achat unique.\n\n10. Stratégie:\n   - Investis dans la production automatique pour augmenter tes gains passifs.\n   - Utilise les multiplicateurs de clic si tu cliques souvent."),
        button1 = self:GetLocalizedText("Fermer"),
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
    }
    StaticPopup_Show("GOLDCLICKER_RULES")
end

-- Créer la liste des upgrades
function GoldClicker:CreateUpgradeList(parent)
    local upgradeFrame = CreateFrame("Frame", nil, parent)
    upgradeFrame:SetSize(370, 420)
    upgradeFrame:SetPoint("TOPRIGHT", -25, -65)
    
    local bg = upgradeFrame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.08, 0.08, 0.08, 0.95)
    
    local frameBorder = upgradeFrame:CreateTexture(nil, "BORDER")
    frameBorder:SetPoint("TOPLEFT", -3, 3)
    frameBorder:SetPoint("BOTTOMRIGHT", 3, -3)
    frameBorder:SetColorTexture(0.18, 0.18, 0.18, 0.95)
    
    local title = upgradeFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -15)
    title:SetText(self:GetLocalizedText("Employés & Améliorations"))
    title:SetTextColor(1, 0.9, 0.3)
    title:SetShadowOffset(2, -2)
    
    -- Boutons de quantité
    local buttonWidth = 110
    local buttonSpacing = 12
    local totalWidth = (buttonWidth * 3) + (buttonSpacing * 2)
    local startX = -(totalWidth / 2) + (buttonWidth / 2)
    
    local buyAmounts = {1, 10, 100}
    self.buyButtons = {}
    
    for i, amount in ipairs(buyAmounts) do
        local btn = CreateFrame("Button", nil, upgradeFrame)
        btn:SetSize(buttonWidth, 30)
        btn:SetPoint("TOP", startX + ((i - 1) * (buttonWidth + buttonSpacing)), -48)
        
        local btnNormal = btn:CreateTexture(nil, "BACKGROUND")
        btnNormal:SetAllPoints()
        btnNormal:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
        btnNormal:SetTexCoord(0, 0.625, 0, 0.6875)
        btn.bg = btnNormal
        
        local btnHighlight = btn:CreateTexture(nil, "HIGHLIGHT")
        btnHighlight:SetAllPoints()
        btnHighlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
        btnHighlight:SetTexCoord(0, 0.625, 0, 0.6875)
        btnHighlight:SetBlendMode("ADD")
        
        local btnText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        btnText:SetPoint("CENTER")
        btnText:SetText("x" .. amount)
        btnText:SetTextColor(1, 0.82, 0)
        btn.text = btnText
        
        btn.amount = amount
        btn:SetScript("OnClick", function() self:SetBuyAmount(amount) end)
        btn:EnableMouse(true)
        btn:RegisterForClicks("LeftButtonUp")
        
        self.buyButtons[i] = btn
    end
    
    self:UpdateBuyButtons()
    
    -- ScrollFrame
    local scrollFrame = CreateFrame("ScrollFrame", nil, upgradeFrame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 12, -88)
    scrollFrame:SetPoint("BOTTOMRIGHT", -32, 12)
    
    local scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollFrame:SetScrollChild(scrollChild)
    scrollChild:SetSize(310, 1000)
    
self.upgradeButtons = {}
local yOffset = -8

-- Titre EMPLOYÉS
local employeesTitle = scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
employeesTitle:SetPoint("TOP", 0, yOffset)
employeesTitle:SetText(self:GetLocalizedText("EMPLOYÉS"))
employeesTitle:SetTextColor(1, 0.82, 0)
yOffset = yOffset - 35

-- Ajouter les employés (production)
for i, upgrade in ipairs(self.Upgrades) do
    if upgrade.production then
        local btn = self:CreateUpgradeButton(scrollChild, upgrade, yOffset)
        table.insert(self.upgradeButtons, btn)
        yOffset = yOffset - 76
    end
end

-- Espacement
yOffset = yOffset - 10

-- Titre AMÉLIORATIONS
local upgradesTitle = scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
upgradesTitle:SetPoint("TOP", 0, yOffset)
upgradesTitle:SetText(self:GetLocalizedText("AMÉLIORATIONS"))
upgradesTitle:SetTextColor(1, 0.82, 0)
yOffset = yOffset - 35

-- Ajouter les améliorations (non-production)
for i, upgrade in ipairs(self.Upgrades) do
    if not upgrade.production then
        local btn = self:CreateUpgradeButton(scrollChild, upgrade, yOffset)
        table.insert(self.upgradeButtons, btn)
        yOffset = yOffset - 76
    end
end
end

-- Définir la quantité d'achat
function GoldClicker:SetBuyAmount(amount)
    self.buyAmount = amount
    self:UpdateBuyButtons()
    self:UpdateUI()
end

-- Mettre à jour l'apparence des boutons de quantité
function GoldClicker:UpdateBuyButtons()
    if not self.buyButtons then return end
    
    for _, btn in ipairs(self.buyButtons) do
        if btn.amount == self.buyAmount then
            btn.bg:SetVertexColor(0.5, 1, 0.5)
            btn.text:SetTextColor(1, 1, 1)
        else
            btn.bg:SetVertexColor(1, 1, 1)
            btn.text:SetTextColor(1, 0.82, 0)
        end
    end
end

-- Créer un bouton d'upgrade
function GoldClicker:CreateUpgradeButton(parent, upgrade, yOffset)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(300, 70)
    btn:SetPoint("TOP", 0, yOffset)
    
    local bg = btn:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    bg:SetTexCoord(0, 0.625, 0, 0.6875)
    bg:SetVertexColor(0.16, 0.16, 0.16, 1)
    btn.bg = bg
    
    local highlight = btn:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetAllPoints()
    highlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    highlight:SetTexCoord(0, 0.625, 0, 0.6875)
    highlight:SetBlendMode("ADD")
    
    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetSize(50, 50)
    icon:SetPoint("LEFT", 10, 0)
    icon:SetTexture(upgrade.icon or "Interface\\Icons\\INV_Misc_QuestionMark")
    
    local name = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    name:SetPoint("TOPLEFT", icon, "TOPRIGHT", 12, -6)
    name:SetPoint("RIGHT", -12, 0)
    name:SetJustifyH("LEFT")
    name:SetText(upgrade.name)
    name:SetTextColor(1, 0.82, 0)
    
    local count = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    count:SetPoint("TOPLEFT", name, "BOTTOMLEFT", 0, -5)
    count:SetTextColor(0.85, 0.85, 0.85)
    count:SetText(self:GetLocalizedText("Possédé: ") .. "0")
    btn.countText = count
    
    local cost = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    cost:SetPoint("BOTTOMLEFT", icon, "BOTTOMRIGHT", 12, 4)
    cost:SetTextColor(1, 0.82, 0)
    cost:SetText("Coût: " .. upgrade.baseCost .. " gold")
    btn.costText = cost
    
    btn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(upgrade.name, 1, 0.9, 0.3)
        GameTooltip:AddLine(upgrade.description, 1, 1, 1, true)
        GameTooltip:AddLine(" ")
        
        local owned = GoldClickerDB.upgrades[upgrade.id] or 0
        GameTooltip:AddLine("Possédé: " .. owned, 0.8, 0.8, 0.8)
        
        if upgrade.production then
            GameTooltip:AddLine("Production totale: " .. (upgrade.production * owned) .. " gold/s", 0, 1, 0)
        end
        
        local buyAmount = GoldClicker.buyAmount
        if buyAmount > 1 then
            local totalCost = GoldClicker:GetTotalUpgradeCost(upgrade.id, buyAmount)
            if totalCost then
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine("Prix pour x" .. buyAmount .. ": " .. GoldClicker:FormatNumber(totalCost) .. " gold", 1, 0.9, 0.3)
            end
        end
        
        GameTooltip:Show()
    end)
    
    btn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    
    btn:SetScript("OnClick", function()
        GoldClicker:BuyUpgrade(upgrade.id, GoldClicker.buyAmount)
    end)
    
    btn:EnableMouse(true)
    btn:RegisterForClicks("LeftButtonUp")
    btn.upgradeId = upgrade.id
    return btn
end

-- Créer le panneau de stats
function GoldClicker:CreateStatsPanel(parent)
    local statsFrame = CreateFrame("Frame", nil, parent)
    statsFrame:SetSize(700, 60)
    statsFrame:SetPoint("BOTTOM", 0, 22)
    
    local bg = statsFrame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.06, 0.06, 0.06, 0.95)
    
    local border = statsFrame:CreateTexture(nil, "BORDER")
    border:SetPoint("TOPLEFT", -3, 3)
    border:SetPoint("BOTTOMRIGHT", 3, -3)
    border:SetColorTexture(0.18, 0.18, 0.18, 0.9)
    
    local stats = statsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    stats:SetPoint("CENTER")
    stats:SetTextColor(0.98, 0.98, 0.98)
    self.statsText = stats
end

-- Gérer le clic sur la pièce d'or
function GoldClicker:OnGoldClick()
    local value = self:GetClickValue()
    self:AddGold(value)
    GoldClickerDB.totalClicks = GoldClickerDB.totalClicks + 1
    
    local lootChance = self:GetLootChance()
    if math.random() < lootChance then
        local lootedItem = self:RollLoot()
        self:AddItemToInventory(lootedItem.id)
    end
    
    if self.inventoryFrame and self.inventoryFrame:IsShown() then
        self:UpdateInventoryUI()
    end
end

-- Mettre à jour l'interface
function GoldClicker:UpdateUI()
    if not self.mainFrame or not self.mainFrame:IsShown() then return end
    
    -- Mettre à jour le titre avec le prestige
    if self.titleText then
        local stars = string.rep("*", GoldClickerDB.prestigeLevel)
        if GoldClickerDB.prestigeLevel > 0 then
            self.titleText:SetText(self:GetLocalizedText("Gold Clicker WoW ") .. stars)
        else
            self.titleText:SetText(self:GetLocalizedText("Gold Clicker WoW"))
        end
    end
    
    local gold = math.floor(GoldClickerDB.gold)
    self.goldCountText:SetText(self:FormatNumber(gold))
    
    local gps = self:GetGoldPerSecond()
    self.cpsText:SetText(string.format(self:GetLocalizedText("par seconde: ") .. "%.1f", gps))
    
    local clickValue = self:GetClickValue()
    if self.clickValueText then
        self.clickValueText:SetText(self:GetLocalizedText("par clic: ") .. self:FormatNumber(clickValue))
    end
    
    for _, btn in ipairs(self.upgradeButtons) do
        local upgradeId = btn.upgradeId
        local owned = GoldClickerDB.upgrades[upgradeId] or 0
        
        btn.countText:SetText(self:GetLocalizedText("Possédé: ") .. owned)
        
        local buyAmount = self.buyAmount
        local totalCost = self:GetTotalUpgradeCost(upgradeId, buyAmount)
        
        if totalCost then
            if buyAmount > 1 then
                btn.costText:SetText(self:GetLocalizedText("Coût (x") .. buyAmount .. self:GetLocalizedText("): ") .. self:FormatNumber(totalCost) .. self:GetLocalizedText(" gold"))
            else
                btn.costText:SetText(self:GetLocalizedText("Coût: ") .. self:FormatNumber(totalCost) .. self:GetLocalizedText(" gold"))
            end
            
if GoldClickerDB.gold >= totalCost then
    btn:Enable()
    btn.costText:SetTextColor(0.5, 1, 0.5)
    btn.bg:SetVertexColor(1, 1, 1)  -- CLAIR quand on peut acheter
else
    btn:Enable()
    btn.costText:SetTextColor(0.5, 0.5, 0.5)
    btn.bg:SetVertexColor(0.6, 0.6, 0.6)  -- SOMBRE quand on peut pas
end
        else
            btn.costText:SetText("MAX")
            btn.bg:SetVertexColor(0.6, 0.6, 0.6)
        end
    end
    
    local playTime = time() - GoldClickerDB.startTime
    local hours = math.floor(playTime / 3600)
    local mins = math.floor((playTime % 3600) / 60)
    
    -- Bonus prestige
    local prestigeBonus = ""
    if GoldClickerDB.prestigeLevel > 0 then
        prestigeBonus = " | Prestige: +" .. (GoldClickerDB.prestigeLevel * 10) .. "%%"
    end
    
    self.statsText:SetText(string.format(
        self:GetLocalizedText("Total farmé: ") .. "%s gold | " .. self:GetLocalizedText("Clics: ") .. "%s | " .. self:GetLocalizedText("Temps de jeu: ") .. "%dh%dm" .. prestigeBonus,
        self:FormatNumber(math.floor(GoldClickerDB.totalGold)),
        self:FormatNumber(GoldClickerDB.totalClicks),
        hours, mins
    ))
end

-- Formatter un nombre avec des virgules
function GoldClicker:FormatNumber(num)
    num = math.floor(num)
    local str = tostring(num)
    local formatted = ""
    local len = string.len(str)
    
    for i = 1, len do
        formatted = formatted .. string.sub(str, i, i)
        local remaining = len - i
        if remaining > 0 and remaining % 3 == 0 then
            formatted = formatted .. ","
        end
    end
    
    return formatted
end

-- Toggle Inventaire
function GoldClicker:ToggleInventory()
    if not self.inventoryFrame then
        self:CreateInventoryFrame()
    end
    
    if self.inventoryFrame:IsShown() then
        self.inventoryFrame:Hide()
    else
        self.inventoryFrame:Show()
        self:UpdateInventoryUI()
    end
end

-- Créer la fenêtre d'inventaire
function GoldClicker:CreateInventoryFrame()
    local frame = CreateFrame("Frame", "GoldClickerInventory", UIParent)
    frame:SetSize(520, 620)
    frame:SetPoint("LEFT", self.mainFrame, "RIGHT", 15, 0)
    
    local bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.05, 0.05, 0.05, 0.95)
    
    local borderSize = 3
    
    local topBorder = frame:CreateTexture(nil, "BORDER")
    topBorder:SetPoint("TOPLEFT", 0, 0)
    topBorder:SetPoint("TOPRIGHT", 0, 0)
    topBorder:SetHeight(borderSize)
    topBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    local bottomBorder = frame:CreateTexture(nil, "BORDER")
    bottomBorder:SetPoint("BOTTOMLEFT", 0, 0)
    bottomBorder:SetPoint("BOTTOMRIGHT", 0, 0)
    bottomBorder:SetHeight(borderSize)
    bottomBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    local leftBorder = frame:CreateTexture(nil, "BORDER")
    leftBorder:SetPoint("TOPLEFT", 0, 0)
    leftBorder:SetPoint("BOTTOMLEFT", 0, 0)
    leftBorder:SetWidth(borderSize)
    leftBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    local rightBorder = frame:CreateTexture(nil, "BORDER")
    rightBorder:SetPoint("TOPRIGHT", 0, 0)
    rightBorder:SetPoint("BOTTOMRIGHT", 0, 0)
    rightBorder:SetWidth(borderSize)
    rightBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetFrameStrata("HIGH")
    frame:SetToplevel(true)
    frame:Hide()
    
    self.inventoryFrame = frame
    
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -10, -10)
    closeBtn:SetSize(32, 32)
    
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -20)
    title:SetText(self:GetLocalizedText("Inventaire & Hôtel des Ventes"))
    title:SetTextColor(1, 0.9, 0.3)
    title:SetShadowOffset(2, -2)
    
    local statsText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    statsText:SetPoint("TOP", 0, -55)
    statsText:SetTextColor(0.95, 0.95, 0.95)
    self.invStatsText = statsText
    
    local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 18, -90)
    scrollFrame:SetPoint("BOTTOMRIGHT", -38, 75)
    
    local scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollFrame:SetScrollChild(scrollChild)
    scrollChild:SetSize(460, 2000)
    
    self.invScrollChild = scrollChild
    self.invItemButtons = {}
    
    local sellAllBtn = CreateFrame("Button", nil, frame)
    sellAllBtn:SetSize(210, 42)
    sellAllBtn:SetPoint("BOTTOM", 0, 20)
    
    local sellBg = sellAllBtn:CreateTexture(nil, "BACKGROUND")
    sellBg:SetAllPoints()
    sellBg:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    sellBg:SetTexCoord(0, 0.625, 0, 0.6875)
    
    local sellHighlight = sellAllBtn:CreateTexture(nil, "HIGHLIGHT")
    sellHighlight:SetAllPoints()
    sellHighlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    sellHighlight:SetTexCoord(0, 0.625, 0, 0.6875)
    sellHighlight:SetBlendMode("ADD")
    
    local sellText = sellAllBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    sellText:SetPoint("CENTER")
    sellText:SetText(self:GetLocalizedText("Tout Vendre à l'HDV"))
    sellText:SetTextColor(1, 0.82, 0)
    
    sellAllBtn:SetScript("OnClick", function() self:SellAllInventory() end)
    sellAllBtn:EnableMouse(true)
    sellAllBtn:RegisterForClicks("LeftButtonUp")
end

-- Mettre à jour l'UI de l'inventaire
function GoldClicker:UpdateInventoryUI()
    if not self.inventoryFrame or not self.inventoryFrame:IsShown() then return end
    
    local totalItems = 0
    local totalValue = 0
    
    for itemId, count in pairs(GoldClickerDB.inventory) do
        if count > 0 then
            totalItems = totalItems + count
            local itemData = self:GetItemData(itemId)
            if itemData then
                totalValue = totalValue + (itemData.value * count)
            end
        end
    end
    
    self.invStatsText:SetText(string.format(
        self:GetLocalizedText("Items: ") .. "%s | " .. self:GetLocalizedText("Valeur totale: ") .. "%s gold | " .. self:GetLocalizedText("Total looté: ") .. "%s",
        self:FormatNumber(totalItems),
        self:FormatNumber(totalValue),
        self:FormatNumber(GoldClickerDB.totalLooted)
    ))
    
    for _, btn in ipairs(self.invItemButtons) do
        btn:Hide()
    end
    
    local yOffset = -12
    local btnIndex = 1
    
    for itemId, count in pairs(GoldClickerDB.inventory) do
        if count > 0 then
            local itemData = self:GetItemData(itemId)
            if itemData then
                local btn = self:GetOrCreateInventoryItemButton(btnIndex)
                btn:SetPoint("TOP", self.invScrollChild, "TOP", 0, yOffset)
                btn:Show()
                
                self:UpdateInventoryItemButton(btn, itemData, count)
                
                yOffset = yOffset - 62
                btnIndex = btnIndex + 1
            end
        end
    end
end

-- Obtenir ou créer un bouton d'item d'inventaire
function GoldClicker:GetOrCreateInventoryItemButton(index)
    if self.invItemButtons[index] then
        return self.invItemButtons[index]
    end
    
    local btn = CreateFrame("Frame", nil, self.invScrollChild)
    btn:SetSize(450, 58)
    
    btn.bg = btn:CreateTexture(nil, "BACKGROUND")
    btn.bg:SetAllPoints()
    btn.bg:SetColorTexture(0.2, 0.16, 0.12, 0.85)
    
    local border = btn:CreateTexture(nil, "BORDER")
    border:SetPoint("TOPLEFT", -1, 1)
    border:SetPoint("BOTTOMRIGHT", 1, -1)
    border:SetColorTexture(0.5, 0.4, 0.2, 0.6)
    
    btn.icon = btn:CreateTexture(nil, "ARTWORK")
    btn.icon:SetSize(48, 48)
    btn.icon:SetPoint("LEFT", 6, 0)
    
    btn.nameText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    btn.nameText:SetPoint("TOPLEFT", btn.icon, "TOPRIGHT", 12, -8)
    btn.nameText:SetPoint("RIGHT", -130, 0)
    btn.nameText:SetJustifyH("LEFT")
    
    btn.countText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    btn.countText:SetPoint("TOPLEFT", btn.nameText, "BOTTOMLEFT", 0, -5)
    btn.countText:SetTextColor(0.85, 0.85, 0.85)
    
    btn.priceText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    btn.priceText:SetPoint("BOTTOMLEFT", btn.icon, "BOTTOMRIGHT", 12, 0)
    btn.priceText:SetTextColor(1, 0.9, 0.3)
    
    btn.sellBtn = CreateFrame("Button", nil, btn)
    btn.sellBtn:SetSize(95, 48)
    btn.sellBtn:SetPoint("RIGHT", -6, 0)
    
    local sellBg = btn.sellBtn:CreateTexture(nil, "BACKGROUND")
    sellBg:SetAllPoints()
    sellBg:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    sellBg:SetTexCoord(0, 0.625, 0, 0.6875)
    btn.sellBtn.bg = sellBg
    
    local sellHighlight = btn.sellBtn:CreateTexture(nil, "HIGHLIGHT")
    sellHighlight:SetAllPoints()
    sellHighlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    sellHighlight:SetTexCoord(0, 0.625, 0, 0.6875)
    sellHighlight:SetBlendMode("ADD")
    
    local sellText = btn.sellBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    sellText:SetPoint("CENTER")
    sellText:SetText(self:GetLocalizedText("Vendre"))
    sellText:SetTextColor(1, 0.82, 0)
    
    btn.sellBtn:EnableMouse(true)
    btn.sellBtn:RegisterForClicks("LeftButtonUp")
    
    self.invItemButtons[index] = btn
    return btn
end

-- Mettre à jour un bouton d'item
function GoldClicker:UpdateInventoryItemButton(btn, itemData, count)
    btn.icon:SetTexture(itemData.icon)
    
    local color = self.QualityColors[itemData.quality]
    btn.nameText:SetText(itemData.name)
    btn.nameText:SetTextColor(color.r, color.g, color.b)
    
    btn.countText:SetText(self:GetLocalizedText("Quantité: ") .. count)
    btn.priceText:SetText(itemData.value .. self:GetLocalizedText("g chacun"))
    
    btn.sellBtn:SetScript("OnClick", function()
        local success, totalValue = self:SellAllItems(itemData.id)
        if success then
            self:UpdateInventoryUI()
            self:UpdateUI()
        end
    end)
    
    btn.itemId = itemData.id
end

-- Vendre tout l'inventaire
function GoldClicker:SellAllInventory()
    local totalGold = 0
    local itemsSold = 0
    
    for itemId, count in pairs(GoldClickerDB.inventory) do
        if count > 0 then
            local itemData = self:GetItemData(itemId)
            if itemData then
                totalGold = totalGold + (itemData.value * count)
                itemsSold = itemsSold + count
            end
        end
    end
    
    if itemsSold > 0 then
        self:AddGold(totalGold)
        GoldClickerDB.inventory = {}
        
        self:UpdateInventoryUI()
        self:UpdateUI()
    end
end
    -- Créer le bouton sur la minimap
function GoldClicker:CreateMinimapButton()
    local button = CreateFrame("Button", "GoldClickerMinimapButton", Minimap)
    button:SetSize(32, 32)
    button:SetFrameStrata("MEDIUM")
    button:SetFrameLevel(8)
    button:SetPoint("TOPLEFT", Minimap, "TOPLEFT", -15, 15)
    
    local icon = button:CreateTexture(nil, "BACKGROUND")
    icon:SetSize(20, 20)
    icon:SetPoint("CENTER", 0, 1)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Coin_01")
    
    local overlay = button:CreateTexture(nil, "OVERLAY")
    overlay:SetSize(53, 53)
    overlay:SetPoint("TOPLEFT")
    overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    
    button:SetMovable(true)
    button:EnableMouse(true)
    button:RegisterForDrag("LeftButton")
    button:RegisterForClicks("LeftButtonUp")
    
    button:SetScript("OnClick", function(self, btn)
        GoldClicker:ToggleMainFrame()
    end)
    
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetText("Gold Farmer Simulator", 1, 0.9, 0.3)
        GameTooltip:AddLine("Clic gauche : Ouvrir/Fermer", 1, 1, 1)
        GameTooltip:Show()
    end)
    
    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    
    self.minimapButton = button
end

-- Toggle la fenêtre principale
function GoldClicker:ToggleMainFrame()
    if self.mainFrame:IsShown() then
        self.mainFrame:Hide()
    else
        self.mainFrame:Show()
        self:UpdateUI()
    end
end

-- Toggle la fenêtre des achievements
function GoldClicker:ToggleAchievements()
    if not self.achievementFrame then
        self:CreateAchievementFrame()
    end
    
    if self.achievementFrame:IsShown() then
        self.achievementFrame:Hide()
    else
        self.achievementFrame:Show()
        self:UpdateAchievements()
    end
end

-- Toggle la fenêtre de la boutique prestige
function GoldClicker:TogglePrestigeShop()
    if not self.prestigeShopFrame then
        self:CreatePrestigeShopFrame()
    end
    
    if self.prestigeShopFrame:IsShown() then
        self.prestigeShopFrame:Hide()
    else
        self.prestigeShopFrame:Show()
        self:UpdatePrestigeShop()
    end
end

-- Créer la fenêtre des achievements
function GoldClicker:CreateAchievementFrame()
    local frame = CreateFrame("Frame", nil, UIParent)
    frame:SetSize(520, 620)
    frame:SetPoint("LEFT", self.mainFrame, "RIGHT", 15, 0)
    
    local bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.05, 0.05, 0.05, 0.95)
    
    local borderSize = 3
    
    local topBorder = frame:CreateTexture(nil, "BORDER")
    topBorder:SetPoint("TOPLEFT", 0, 0)
    topBorder:SetPoint("TOPRIGHT", 0, 0)
    topBorder:SetHeight(borderSize)
    topBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    local bottomBorder = frame:CreateTexture(nil, "BORDER")
    bottomBorder:SetPoint("BOTTOMLEFT", 0, 0)
    bottomBorder:SetPoint("BOTTOMRIGHT", 0, 0)
    bottomBorder:SetHeight(borderSize)
    bottomBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    local leftBorder = frame:CreateTexture(nil, "BORDER")
    leftBorder:SetPoint("TOPLEFT", 0, 0)
    leftBorder:SetPoint("BOTTOMLEFT", 0, 0)
    leftBorder:SetWidth(borderSize)
    leftBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    local rightBorder = frame:CreateTexture(nil, "BORDER")
    rightBorder:SetPoint("TOPRIGHT", 0, 0)
    rightBorder:SetPoint("BOTTOMRIGHT", 0, 0)
    rightBorder:SetWidth(borderSize)
    rightBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetFrameStrata("HIGH")
    frame:SetToplevel(true)
    frame:Hide()
    
    -- Titre
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -20)
    title:SetText("|cffFFD700SUCCES|r")
    title:SetTextColor(1, 0.9, 0.3)
    title:SetShadowOffset(2, -2)
    
    -- Bouton fermer (UN SEUL !)
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -5, -5)
    
    -- Stats globaux
    local statsText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    statsText:SetPoint("TOP", 0, -50)
    statsText:SetTextColor(0.9, 0.9, 0.9)
    frame.statsText = statsText
    
    -- ScrollFrame pour la liste
    local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 20, -80)
    scrollFrame:SetPoint("BOTTOMRIGHT", -40, 20)
    
    local scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollChild:SetSize(440, 1)
    scrollFrame:SetScrollChild(scrollChild)
    
    frame.scrollChild = scrollChild
    frame.achievementButtons = {}
    
    self.achievementFrame = frame
    self:PopulateAchievements()
end

-- Remplir la liste des achievements
function GoldClicker:PopulateAchievements()
    local scrollChild = self.achievementFrame.scrollChild
    local yOffset = 0
    local buttonHeight = 70
    
    for i, achievement in ipairs(self.Achievements) do
        local btn = CreateFrame("Frame", nil, scrollChild)
        btn:SetSize(420, buttonHeight)
        btn:SetPoint("TOPLEFT", 10, yOffset)
        
        -- Background
        local bg = btn:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        
        local isUnlocked = GoldClickerDB.achievements[achievement.id]
        if isUnlocked then
            bg:SetTexture(0, 0.3, 0, 0.3)  -- Vert foncé
        else
            bg:SetTexture(0.1, 0.1, 0.1, 0.3)  -- Gris foncé
        end
        
        -- Icône
        local icon = btn:CreateTexture(nil, "ARTWORK")
        icon:SetSize(50, 50)
        icon:SetPoint("LEFT", 10, 0)
        icon:SetTexture(achievement.icon)
        
        if not isUnlocked then
            icon:SetDesaturated(true)
            icon:SetAlpha(0.5)
        end
        
        -- Nom
        local nameText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        nameText:SetPoint("TOPLEFT", icon, "TOPRIGHT", 10, -5)
        nameText:SetText(achievement.name)
        
        if isUnlocked then
            nameText:SetTextColor(0, 1, 0)  -- Vert
        else
            nameText:SetTextColor(0.5, 0.5, 0.5)  -- Gris
        end
        
        -- Description
        local descText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        descText:SetPoint("TOPLEFT", nameText, "BOTTOMLEFT", 0, -3)
        descText:SetPoint("RIGHT", btn, "RIGHT", -10, 0)
        descText:SetJustifyH("LEFT")
        descText:SetText(achievement.description)
        descText:SetTextColor(0.8, 0.8, 0.8)
        
        -- Récompense
        local rewardText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        rewardText:SetPoint("BOTTOMLEFT", icon, "BOTTOMRIGHT", 10, 5)
        rewardText:SetText("|cffFFD700" .. achievement.reward .. "|r")
        
        -- Checkmark si débloqué
        if isUnlocked then
            local check = btn:CreateTexture(nil, "OVERLAY")
            check:SetSize(24, 24)
            check:SetPoint("TOPRIGHT", -5, -5)
            check:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
        end
        
        btn.bg = bg
        btn.icon = icon
        btn.nameText = nameText
        btn.achievementId = achievement.id
        
        self.achievementFrame.achievementButtons[i] = btn
        yOffset = yOffset - buttonHeight - 5
    end
    
    scrollChild:SetHeight(math.abs(yOffset))
end

-- Mettre à jour l'affichage des achievements
function GoldClicker:UpdateAchievements()
    if not self.achievementFrame or not self.achievementFrame:IsShown() then return end
    
    -- Compter les achievements débloqués
    local unlockedCount = 0
    for _, achievement in ipairs(self.Achievements) do
        if GoldClickerDB.achievements[achievement.id] then
            unlockedCount = unlockedCount + 1
        end
    end
    
    self.achievementFrame.statsText:SetText(string.format(
        "Debloques: %d / %d",
        unlockedCount,
        #self.Achievements
    ))
    
    -- Mettre à jour chaque achievement
    for i, btn in ipairs(self.achievementFrame.achievementButtons) do
        local achievement = self.Achievements[i]
        local isUnlocked = GoldClickerDB.achievements[achievement.id]
        
        if isUnlocked then
            btn.bg:SetTexture(0, 0.3, 0, 0.3)
            btn.icon:SetDesaturated(false)
            btn.icon:SetAlpha(1)
            btn.nameText:SetTextColor(0, 1, 0)
        else
            btn.bg:SetTexture(0.1, 0.1, 0.1, 0.3)
            btn.icon:SetDesaturated(true)
            btn.icon:SetAlpha(0.5)
            btn.nameText:SetTextColor(0.5, 0.5, 0.5)
        end
    end
end

-- Créer la fenêtre de la boutique prestige
function GoldClicker:CreatePrestigeShopFrame()
    local frame = CreateFrame("Frame", nil, UIParent)
    frame:SetSize(520, 620)
    frame:SetPoint("LEFT", self.mainFrame, "RIGHT", 15, 0)
    
    local bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.05, 0.05, 0.05, 0.95)
    
    local borderSize = 3
    
    local topBorder = frame:CreateTexture(nil, "BORDER")
    topBorder:SetPoint("TOPLEFT", 0, 0)
    topBorder:SetPoint("TOPRIGHT", 0, 0)
    topBorder:SetHeight(borderSize)
    topBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    local bottomBorder = frame:CreateTexture(nil, "BORDER")
    bottomBorder:SetPoint("BOTTOMLEFT", 0, 0)
    bottomBorder:SetPoint("BOTTOMRIGHT", 0, 0)
    bottomBorder:SetHeight(borderSize)
    bottomBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    local leftBorder = frame:CreateTexture(nil, "BORDER")
    leftBorder:SetPoint("TOPLEFT", 0, 0)
    leftBorder:SetPoint("BOTTOMLEFT", 0, 0)
    leftBorder:SetWidth(borderSize)
    leftBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    local rightBorder = frame:CreateTexture(nil, "BORDER")
    rightBorder:SetPoint("TOPRIGHT", 0, 0)
    rightBorder:SetPoint("BOTTOMRIGHT", 0, 0)
    rightBorder:SetWidth(borderSize)
    rightBorder:SetColorTexture(0.18, 0.18, 0.18, 1)
    
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetFrameStrata("HIGH")
    frame:SetToplevel(true)
    frame:Hide()
    
    -- Titre
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -20)
    title:SetText("|cffFFD700BOUTIQUE PRESTIGE|r")
    title:SetTextColor(1, 0.9, 0.3)
    title:SetShadowOffset(2, -2)
    
    -- Bouton fermer
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -5, -5)
    
    -- Affichage des points de prestige disponibles
    local pointsText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    pointsText:SetPoint("TOP", 0, -55)
    pointsText:SetTextColor(0, 1, 0)
    frame.pointsText = pointsText
    
    -- Texte explicatif
    local infoText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    infoText:SetPoint("TOP", 0, -85)
    infoText:SetText("|cff888888Ameliorations permanentes|r")
    infoText:SetTextColor(0.7, 0.7, 0.7)
    
    -- ScrollFrame pour la liste des upgrades
    local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 20, -110)
    scrollFrame:SetPoint("BOTTOMRIGHT", -40, 20)
    
    local scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollChild:SetSize(440, 1)
    scrollFrame:SetScrollChild(scrollChild)
    
    frame.scrollChild = scrollChild
    frame.shopButtons = {}
    
    self.prestigeShopFrame = frame
end

-- Mettre à jour la boutique prestige
function GoldClicker:UpdatePrestigeShop()
    if not self.prestigeShopFrame then return end
    
    -- Mettre à jour les points disponibles
    local points = GoldClickerDB.prestigePoints or 0
    self.prestigeShopFrame.pointsText:SetText(
        "|cff00ff00Points disponibles: " .. points .. "|r"
    )
    
    -- Créer les boutons d'upgrades si pas encore fait
    if #self.prestigeShopFrame.shopButtons == 0 then
        local yOffset = 0
        
        for i, upgrade in ipairs(self.PrestigeUpgrades) do
            local btn = CreateFrame("Button", nil, self.prestigeShopFrame.scrollChild)
            btn:SetSize(440, 70)
            btn:SetPoint("TOPLEFT", 10, -yOffset)
            
            local bg = btn:CreateTexture(nil, "BACKGROUND")
            bg:SetAllPoints()
            bg:SetColorTexture(0.1, 0.1, 0.1, 0.5)
            btn.bg = bg
            
            local icon = btn:CreateTexture(nil, "ARTWORK")
            icon:SetSize(50, 50)
            icon:SetPoint("LEFT", 10, 0)
            icon:SetTexture(upgrade.icon)
            btn.icon = icon
            
            local nameText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
            nameText:SetPoint("TOPLEFT", icon, "TOPRIGHT", 10, -5)
            nameText:SetText(upgrade.name)
            nameText:SetTextColor(1, 0.82, 0)
            btn.nameText = nameText
            
            local descText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            descText:SetPoint("TOPLEFT", nameText, "BOTTOMLEFT", 0, -3)
            descText:SetPoint("RIGHT", -120, 0)
            descText:SetText(upgrade.description)
            descText:SetTextColor(0.8, 0.8, 0.8)
            descText:SetJustifyH("LEFT")
            btn.descText = descText
            
            local levelText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            levelText:SetPoint("BOTTOMRIGHT", -10, 5)
            btn.levelText = levelText
            
            local costText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            costText:SetPoint("TOPRIGHT", -10, -5)
            btn.costText = costText
            
            btn:SetScript("OnClick", function()
                self:BuyPrestigeUpgrade(upgrade.id)
            end)
            
            btn:SetScript("OnEnter", function()
                GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
                GameTooltip:SetText(upgrade.name, 1, 0.82, 0)
                GameTooltip:AddLine(upgrade.description, 1, 1, 1, true)
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine("Cout: " .. upgrade.cost .. " points", 1, 1, 0)
                
                local currentLevel = self:GetPrestigeUpgradeLevel(upgrade.id)
                if upgrade.maxPurchases then
                    GameTooltip:AddLine("Niveau: " .. currentLevel .. " / " .. upgrade.maxPurchases, 0.8, 0.8, 0.8)
                else
                    GameTooltip:AddLine("Niveau: " .. currentLevel, 0.8, 0.8, 0.8)
                end
                
                GameTooltip:Show()
            end)
            
            btn:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)
            
            btn.upgradeId = upgrade.id
            table.insert(self.prestigeShopFrame.shopButtons, btn)
            
            yOffset = yOffset + 80
        end
        
        self.prestigeShopFrame.scrollChild:SetHeight(yOffset)
    end
    
    -- Mettre à jour chaque bouton
    for i, btn in ipairs(self.prestigeShopFrame.shopButtons) do
        local upgrade = self.PrestigeUpgrades[i]
        local currentLevel = self:GetPrestigeUpgradeLevel(upgrade.id)
        local canBuy = points >= upgrade.cost
        local maxReached = upgrade.maxPurchases and currentLevel >= upgrade.maxPurchases
        
        -- Niveau
        if upgrade.maxPurchases then
            btn.levelText:SetText("Niveau: " .. currentLevel .. " / " .. upgrade.maxPurchases)
        else
            btn.levelText:SetText("Niveau: " .. currentLevel)
        end
        
        -- Coût
        btn.costText:SetText("Cout: " .. upgrade.cost .. " pts")
        
        -- Couleurs selon état
        if maxReached then
            btn.bg:SetColorTexture(0, 0.2, 0, 0.5)
            btn.nameText:SetTextColor(0, 1, 0)
            btn.costText:SetTextColor(0.5, 0.5, 0.5)
            btn.levelText:SetTextColor(0, 1, 0)
            btn:Disable()
        elseif canBuy then
            btn.bg:SetColorTexture(0.1, 0.3, 0.1, 0.5)
            btn.nameText:SetTextColor(1, 0.82, 0)
            btn.costText:SetTextColor(0, 1, 0)
            btn.levelText:SetTextColor(0.8, 0.8, 0.8)
            btn:Enable()
        else
            btn.bg:SetColorTexture(0.1, 0.1, 0.1, 0.5)
            btn.nameText:SetTextColor(0.5, 0.5, 0.5)
            btn.costText:SetTextColor(1, 0, 0)
            btn.levelText:SetTextColor(0.5, 0.5, 0.5)
            btn:Disable()
        end
    end
end
